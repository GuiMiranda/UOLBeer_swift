//
//  BeerTableViewCell.swift
//  UOLBeer
//
//  Created by Guilherme Miranda Lopes on 20/11/19.
//  Copyright © 2019 Guilherme Miranda. All rights reserved.
//

import UIKit

class BeerTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var OutletBeerCellImage: ReusableImageView!
    @IBOutlet weak var OutletBeerCellName: UILabel!
    @IBOutlet weak var OutletBeerCellAbv: UILabel!
    
    // MARK: - Properties
    var beer: Beer? {
        didSet {
            self.setupBeerImage()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(with beer: Beer) {
        self.beer = beer
        self.OutletBeerCellName.text = beer.name
        self.OutletBeerCellAbv.text = "Teor alcoólico: \(beer.abv)"
    }

    func setupBeerImage() {
        if let imageUrl = self.beer?.imageUrl {
            self.OutletBeerCellImage.loadImageUsingUrlString(urlString: imageUrl)
        }
    }
}
