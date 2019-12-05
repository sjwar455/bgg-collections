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
    var numPlayers: Int = 5
    var minAge: Int = 0


// check if boardgame passes through filter i.e. meets filter criteria
func filter(boardgame: Boardgame) -> Bool {

     if  self.numPlayers >= Int(boardgame.minPlayers)!
         && self.numPlayers <= Int(boardgame.maxPlayers)!
         && self.minAge <= Int(boardgame.minAge)! {
         
         return true
         
     }
         
     return false
 }

}
