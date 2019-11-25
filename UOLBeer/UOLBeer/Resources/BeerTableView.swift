//
//  BeerTableView.swift
//  UOLBeer
//
//  Created by Guilherme Miranda Lopes on 20/11/19.
//  Copyright © 2019 Guilherme Miranda. All rights reserved.
//

import UIKit

class BeerTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var beers: [Beer] = []
    weak var beerSelected: BeerCellSelected?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.beers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: "beerCell", for: indexPath) as! BeerTableViewCell
        
        cell.setup(with: self.beers[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cellTapped = tableView.cellForRow(at: indexPath) as? BeerTableViewCell else { return }
        self.beerSelected?.didTap(at: cellTapped)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height * 0.25
    }
}
