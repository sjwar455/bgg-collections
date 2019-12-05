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
            
            Toggle(isOn: $userData.filterCriteria.isOn){
                Text("Filter")
            }
            
            if self.userData.filterCriteria.isOn {
                    FilterView() 
            }
      
            
            ForEach(userData.collection) { boardgame in
        
                if !self.userData.filterCriteria.isOn || self.userData.filterCriteria.filter(boardgame: boardgame)  {
                    NavigationLink( destination: BoardgameDetail(boardgame: boardgame) ) {
                        BoardgameRow(boardgame: boardgame)
                    }
                }
            }
        }
        
    }
}


