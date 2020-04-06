//
//  BoardgameCollection.swift
//  Boardgames
//
//  Created by Sam Wareing on 12/9/19.
//  Copyright © 2019 Sam Wareing. All rights reserved.
//

import SwiftUI

struct BoardgameCollection {
    var userid: String = ""
    var boardgames: [Boardgame] = []
    var categories: [String] = []
    var mechanics: [String] = []
    var filterCriteria: BoardgameFilter = BoardgameFilter()
    
    init(userid: String) {
        self.userid = userid
        self.boardgames = getCollection(userid: self.userid)
        self.categories = []
        self.mechanics = []
        self.filterCriteria = BoardgameFilter()
    }
    
    
}
