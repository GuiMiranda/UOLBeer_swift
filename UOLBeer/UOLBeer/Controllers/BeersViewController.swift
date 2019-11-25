//
//  BeersViewController.swift
//  UOLBeer
//
//  Created by Guilherme Miranda Lopes on 20/11/19.
//  Copyright © 2019 Guilherme Miranda. All rights reserved.
//

import UIKit

class BeersViewController: UIViewController {

    @IBOutlet weak var beerTableView: BeerTableView!
  
    var api: PunkAPI = PunkAPI()
    var beerToShow: BeerTableViewCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.api.dataCompleted = self
        self.beerTableView.beerSelected = self
        self.beerTableView.delegate = self.beerTableView
        self.beerTableView.dataSource = self.beerTableView
        self.api.fetchBeers()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            guard let beerCell = self.beerToShow else { return }
            guard let detailVC = segue.destination as? BeerDetailViewController else { return }
            detailVC.beerCell = beerCell
        }
    }
}

extension BeersViewController: BeerCellSelected {
    func didTap(at beerCell: BeerTableViewCell) {
        self.beerToShow = beerCell
        self.performSegue(withIdentifier: "showDetail", sender: self)
    }
}

extension BeersViewController: BeersDataFetchCompleted {
    func fetchComplete(for beers: [Beer]) {
        self.beerTableView.beers = beers
        self.beerTableView.reloadData()
    }
}
