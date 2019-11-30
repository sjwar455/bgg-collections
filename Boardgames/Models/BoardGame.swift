//
//  BoardGame.swift
//  Boardgames
//
//  Created by Sam Wareing on 11/25/19.
//  Copyright © 2019 Sam Wareing. All rights reserved.
//

import SwiftUI

struct BoardGame: Hashable, Codable, Identifiable {
    var id: Int = -1
    var title: String = "not set"
    var description: String = "not set"
    var minPlayers: Int = -1
    var maxPlayers: Int = -1
    var minPlayTime: Int = -1
    var maxPlayTime: Int = -1
    var minAge: Int = -1
    var categories: [String] = []
    var mechanics: [String] = []
    var imageURL: String = "not set"
    var sourceURL: String = "not set"
    
    func printData() {
        print("++++++++++++++++++++++++++++++++++++++++++++++++++")
        print("id: " + String(self.id))
        print("title: " + self.title)
        print("description: " + self.description)
        print("minPlayers: " + String(self.minPlayers))
        print("maxPlayers: " + String(self.maxPlayers))
        print("minPlayTime: " + String(self.minPlayTime))
        print("maxPlayTime: " + String(self.maxPlayTime))
        print("minAge: " + String(self.minAge))
        print("categories: ", self.categories)
        print("mechanics: ", self.mechanics)
        print("imageURL: " + self.imageURL)
        print("sourceURL: " + self.sourceURL)
        print("++++++++++++++++++++++++++++++++++++++++++++++++++")
        
    }
}
