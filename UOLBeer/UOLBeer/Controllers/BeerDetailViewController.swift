//
//  BeerDetailViewController.swift
//  UOLBeer
//
//  Created by Guilherme Miranda Lopes on 20/11/19.
//  Copyright © 2019 Guilherme Miranda. All rights reserved.
//

import UIKit

class BeerDetailViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var OutletBeerImage: ReusableImageView!
    @IBOutlet weak var OutletBeerName: UILabel!
    @IBOutlet weak var OutletBeerTag: UILabel!
    @IBOutlet weak var OutletBeerAbv: UILabel!
    @IBOutlet weak var OutletBeerIbu: UILabel!
    @IBOutlet weak var OutletBeerDescription: UILabel!
    @IBOutlet weak var OutletActivityIndicator: UIActivityIndicatorView!
    
    // MARK: - Properties
    var beerCell: BeerTableViewCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    func setup() {
        
        guard let beer = self.beerCell?.beer else { return }
        
        self.OutletBeerName.text = beer.name
        self.OutletBeerTag.text = beer.tagline
        self.OutletBeerAbv.text = "Teor alcoólico: \(String(describing: beer.abv))"
        self.OutletBeerIbu.text = "Escala de amargor: \(String(describing: beer.ibu))"
        self.OutletBeerDescription.text = beer.description
       
        if let imageFromCache = imageCache.object(forKey: beer.imageUrl as AnyObject) as? UIImage {
            self.doneLoading(with: imageFromCache)
        } else {
            self.OutletBeerImage.loadImageForSingleImageView(with: beer.imageUrl) { (image) in
                self.doneLoading(with: image)
            }
        }
    }
    
    private func doneLoading(with image: UIImage) {
        self.OutletBeerImage.image = image
        self.OutletActivityIndicator.stopAnimating()
    }
}
