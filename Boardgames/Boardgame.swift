//
//  BoardGame.swift
//  Boardgames
//
//  Created by Sam Wareing on 11/25/19.
//  Copyright © 2019 Sam Wareing. All rights reserved.
//

import SwiftUI

struct Boardgame: Hashable, Codable, Identifiable {
    var id: Int = -1
    var title: String = ""
    var description: String = ""
    var minPlayers: String = ""
    var maxPlayers: String = ""
    var minPlayTime: String = ""
    var maxPlayTime: String = ""
    var playTimeRange: String = ""
    var minAge: String = ""
    var categories: [String] = []
    var mechanics: [String] = []
    var thumbnailURL: String = ""
    var imageURL: String = ""
    
    func setPlayTimeRange() {
    
        if self.minPlayTime == self.maxPlayTime {
                 let playTimeRange = minPlayTime
            }
        else {
                let playTimeRange = minPlayTime + "-" + maxPlayTime
            }

    }
    
    func printData() {
        print("++++++++++++++++++++++++++++++++++++++++++++++++++")
        print("id: " + String(self.id))
        print("title: " + self.title)
        print("description: " + self.description)
        print("minPlayers: " + self.minPlayers)
        print("maxPlayers: " + self.maxPlayers)
        print("minPlayTime: " + self.minPlayTime)
        print("maxPlayTime: " + self.maxPlayTime)
        print("playTimeRange: " + self.playTimeRange)
        print("minAge: " + self.minAge)
        print("categories: ", self.categories)
        print("mechanics: ", self.mechanics)
        print("thumbnailURL: " + self.thumbnailURL)
        print("imageURL: " + self.imageURL)
        print("++++++++++++++++++++++++++++++++++++++++++++++++++")
        
    }
    
}
