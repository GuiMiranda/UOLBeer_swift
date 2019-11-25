//
//  Protocols.swift
//  UOLBeer
//
//  Created by Guilherme Miranda Lopes on 20/11/19.
//  Copyright © 2019 Guilherme Miranda. All rights reserved.
//

import Foundation

protocol BeerCellSelected: class {
    func didTap(at beerCell: BeerTableViewCell)
}

protocol BeersDataFetchCompleted: class {
    func fetchComplete(for beers: [Beer])
}
