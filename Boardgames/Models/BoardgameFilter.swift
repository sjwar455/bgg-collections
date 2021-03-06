//
//  BoardgameFilter.swift
//  Boardgames
//
//  Created by Sam Wareing on 12/5/19.
//  Copyright © 2019 Sam Wareing. All rights reserved.
//

import SwiftUI
   
// filter criteria struct
struct BoardgameFilter {
    var isOn: Bool = false
    var numPlayers: Int = 5         // number of players in group
    var minAge: Int = 0             // minimum age
    var categories: [String] = []   // selected categories
    var mustContainAllCategories: Bool = false
    var mechanics: [String] = []    // selected mechanics
    var mustContainAllMechanics: Bool = false


// check if boardgame passes through filter i.e. meets filter criteria
    func filter(boardgame: Boardgame) -> Bool {
        return   self.checkNumPlayers(minPlayers: Int(boardgame.minPlayers)!, maxPlayers: Int(boardgame.maxPlayers)!)
              && self.checkMinAge(minAge: Int(boardgame.minAge)!)
              && self.checkForCommonTraits(boardgameTraits: boardgame.categories, filterTraits: self.categories, mustContainAll: self.mustContainAllCategories)
              && self.checkForCommonTraits(boardgameTraits: boardgame.mechanics, filterTraits: self.mechanics, mustContainAll: self.mustContainAllMechanics)
    }
    
    func checkNumPlayers(minPlayers: Int, maxPlayers: Int) -> Bool {
        return minPlayers <= self.numPlayers && maxPlayers >= self.numPlayers
    }
    
    func checkMinAge(minAge: Int) -> Bool {
        return minAge >= self.minAge
    }
    
    func checkForCommonTraits(boardgameTraits: [String], filterTraits: [String], mustContainAll: Bool) -> Bool {

        let traitSet = Set(boardgameTraits)
        let traitIntersect = traitSet.intersection(filterTraits)
        
        if !traitIntersect.isEmpty || filterTraits.isEmpty {
            
            if !mustContainAll || traitIntersect.count == filterTraits.count {
                return true
            }
  
        }
        
        return false
    }
    

}
