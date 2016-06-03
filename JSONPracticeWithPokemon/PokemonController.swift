//
//  PokemonController.swift
//  JSONPracticeWithPokemon
//
//  Created by Michael Mecham on 6/2/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import Foundation

class PokemonController {
    
    static let sharedController = PokemonController()
    
    let url = NSURL(string: "http://pokeapi.co/api/v2/pokemon/")
    
    var myPokemon: [Pokemon] = []
    
    func getPokemon(completion: (pokemon: [Pokemon]) -> Void) {
        guard let unwrappedURL = url else {
            return
        }
        NetworkController.performRequestForURL(unwrappedURL, httpMethod: .Get) { (data, error) in
            guard let data = data,
            jsonDictionary = (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)),
            resultsArray = jsonDictionary["results"] as? [[String:AnyObject]]
            else {
                completion(pokemon: [])
                return
            }
            
                let pokemonArray = resultsArray.flatMap({Pokemon(dictionary: $0)})
                completion(pokemon: pokemonArray)
        
            
        }
    }
}