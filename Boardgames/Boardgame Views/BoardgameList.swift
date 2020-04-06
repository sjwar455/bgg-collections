//
//  BoardgameList.swift
//  Boardgames
//
//  Created by Sam Wareing on 12/1/19.
//  Copyright © 2019 Sam Wareing. All rights reserved.
//

import SwiftUI
import Foundation

struct BoardgameList: View {
    @EnvironmentObject private var userData: UserData

    var body: some View {
        List {
            
            Toggle(isOn: $userData.collection.filterCriteria.isOn){
                Text("Filter")
            }
            
            if self.userData.collection.filterCriteria.isOn {
                    BoardgameListFilter()
            }
      
            
            ForEach(userData.collection.boardgames) { boardgame in
        
                if !self.userData.collection.filterCriteria.isOn || self.userData.collection.filterCriteria.filter(boardgame: boardgame)  {
                    NavigationLink( destination: BoardgameDetail(boardgame: boardgame) ) {
                        BoardgameRow(boardgame: boardgame)
                    }
                }
            }
        }
        
    }
}


