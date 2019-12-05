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
            
            Toggle(isOn: $userData.filter.isOn){
                Text("Filter")
            }
            
            if self.userData.filter.isOn {
                Stepper(value: $userData.filter.numPlayers, in: 0...20, label: { Text("# of Players:  \(userData.filter.numPlayers)")})
                
                Stepper(value: $userData.filter.minAge, in: 0...18, label: { Text("Minimum Age:  \(userData.filter.minAge)")})
            }
      
            
            ForEach(userData.collection) { boardgame in
        
                if !self.userData.filter.isOn || self.userData.filter.filterBoardgame(boardgame: boardgame)  {
                    NavigationLink( destination: BoardgameDetail(boardgame: boardgame) ) {
                        BoardgameRow(boardgame: boardgame)
                    }
                }
            }
        }
        
    }
}


