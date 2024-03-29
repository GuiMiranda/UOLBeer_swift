//
//  ReusableImageView.swift
//  UOLBeer
//
//  Created by Guilherme Miranda Lopes on 20/11/19.
//  Copyright © 2019 Guilherme Miranda. All rights reserved.
//

import UIKit

public let imageCache = NSCache<AnyObject, AnyObject>()

class ReusableImageView: UIImageView {
    
    var imageUrlString: String?
    
    func loadImageUsingUrlString(urlString: String) {
        
        self.imageUrlString = urlString
        guard let url = URL(string: urlString) else { return }
        
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error as Any)
                return
            }
            DispatchQueue.main.async {
                guard let imageToCache = UIImage(data: data!) else { return }
                
                if self.imageUrlString == urlString {
                    self.image = imageToCache
                }
                imageCache.setObject(imageToCache, forKey: urlString as AnyObject)
            }
        }.resume()
    }
    
    func loadImageForSingleImageView(with urlString: String, completion: @escaping (UIImage) -> ()) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error as Any)
                return
            }
            DispatchQueue.main.async {
                guard let image = UIImage(data: data!) else { return }
                completion(image)
            }
        }.resume()
    }
}
