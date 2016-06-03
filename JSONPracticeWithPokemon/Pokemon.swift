//
//  Pokemon.swift
//  JSONPracticeWithPokemon
//
//  Created by Michael Mecham on 6/2/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import Foundation

class Pokemon {
    
    let name: String
    
    init?(dictionary: [String:AnyObject]) {
        guard let name = dictionary["name"] as? String else {
            return nil
        }
        self.name = name
    }
}

