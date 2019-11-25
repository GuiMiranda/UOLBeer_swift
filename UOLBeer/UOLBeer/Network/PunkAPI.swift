//
//  PunkAPI.swift
//  UOLBeer
//
//  Created by Guilherme Miranda Lopes on 20/11/19.
//  Copyright © 2019 Guilherme Miranda. All rights reserved.
//

import Foundation

class PunkAPI {
    
    weak var dataCompleted: BeersDataFetchCompleted?
    
    func fetchBeers() {
        
        var beers: [Beer] = []
        let urlString = "https://api.punkapi.com/v2/beers?page=1&per_page=80"
        
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, err) in
            
            DispatchQueue.main.async {
                
                if let err = err {
                    print("Failed get data from url:", err)
                    return
                }
                
                guard let data = data else { return }
                
                do {
                    let decoder = JSONDecoder()
                    beers = try decoder.decode([Beer].self, from: data)

                    self.dataCompleted?.fetchComplete(for: beers)
                    
                } catch let jsonErr {
                    print("Error decode json:", jsonErr)
                }
            }
            }.resume()
    }
}
