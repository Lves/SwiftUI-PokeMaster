//
//  User.swift
//  PokeMaster
//
//  Created by LvesLi on 2020/10/23.
//

import Foundation

struct User: Codable {
    var email: String
    var favoritePokemonIDs: Set<Int>
    
    func isFavoritePokemon(id: Int) -> Bool {
        favoritePokemonIDs.contains(id)
    }
}
