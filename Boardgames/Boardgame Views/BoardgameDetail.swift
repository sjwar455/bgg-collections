//
//  BoardgameDetail.swift
//  Boardgames
//
//  Created by Sam Wareing on 11/30/19.
//  Copyright © 2019 Sam Wareing. All rights reserved.
//

import SwiftUI

struct BoardgameDetail: View {
    var boardgame: Boardgame
    
    var body: some View {
        VStack {
            Text(verbatim: boardgame.title)
                .font(.title)
            Text(boardgame.minPlayers + "-" + boardgame.maxPlayers)
                .font(.subheadline)
            Text(boardgame.minPlayTime + "-" + boardgame.maxPlayTime + " mins")
                .font(.subheadline)
            Text(boardgame.minAge + "+")
                .font(.subheadline)
            
        }
    }
}


