//
//  BoardgameList.swift
//  Boardgames
//
//  Created by Sam Wareing on 12/1/19.
//  Copyright © 2019 Sam Wareing. All rights reserved.
//

import SwiftUI

struct BoardgameList: View {
    @EnvironmentObject private var userData: UserData
    
    
    var body: some View {
    
    
        List {
            
            ForEach(userData.collection, id: \.self ) { boardgame in
                NavigationLink( destination: BoardgameDetail(boardgame: boardgame) ) {
                    BoardgameRow(boardgame: boardgame)
                }
            }
        }
        
    }
}

struct BoardgameList_Previews: PreviewProvider {
    static var previews: some View {
        BoardgameList()
    }
}
