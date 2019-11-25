//
//  Beer.swift
//  UOLBeer
//
//  Created by Guilherme Miranda Lopes on 20/11/19.
//  Copyright © 2019 Guilherme Miranda. All rights reserved.
//

import Foundation

class Beer: Decodable {
    
    // MARK: - Properties
    let name: String
    let tagline: String
    let description: String
    let imageUrl: String
    let abv: Double
    let ibu: Double
    
    // MARK: - Decodable keys
    enum BeerDecodableKeys: String, CodingKey {
        case name
        case tagline
        case description
        case abv
        case ibu
        case imageUrl = "image_url"
    }
    
    // MARK: - Inits
    init(name: String, tagline: String, description: String, imageUrl: String, abv: Double, ibu:Double) {
        self.name = name
        self.tagline = tagline
        self.description = description
        self.imageUrl = imageUrl
        self.abv = abv
        self.ibu = ibu
    }
    
    required convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: BeerDecodableKeys.self)
        let name: String = try container.decode(String.self, forKey: .name)
        let tagline: String = try container.decode(String.self, forKey: .tagline)
        let description: String = try container.decode(String.self, forKey: .description)
        let imageUrl: String = try container.decode(String.self, forKey: .imageUrl)
        let abv: Double = try container.decode(Double.self, forKey: .abv)
        let ibu: Double = (try? container.decode(Double.self, forKey: .ibu)) ?? 0
        
        self.init(name: name, tagline: tagline, description: description, imageUrl: imageUrl, abv: abv, ibu: ibu)
    }
    
}
