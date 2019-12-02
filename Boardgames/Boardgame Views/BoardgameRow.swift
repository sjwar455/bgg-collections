//
//  BoardgameRow.swift
//  Boardgames
//
//  Created by Sam Wareing on 12/1/19.
//  Copyright © 2019 Sam Wareing. All rights reserved.
//

import SwiftUI

struct BoardgameRow: View {
     @EnvironmentObject private var userData: UserData
    var boardgame : Boardgame
    
    var body: some View {
        HStack {
            
            ImageView(withURL: boardgame.thumbnailURL, width: 50, height: 50)
            
            Text(boardgame.title)
                .font(.headline)
            
        }
    }
}


