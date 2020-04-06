//
//  BoardgameListFilter.swift
//  Boardgames
//
//  Created by Sam Wareing on 12/5/19.
//  Copyright © 2019 Sam Wareing. All rights reserved.
//

import SwiftUI

struct BoardgameListFilter: View {
     @EnvironmentObject private var userData: UserData
      
      var body: some View {
          VStack {
            Stepper(value: $userData.collection.filterCriteria.numPlayers, in: 0...20, label: { Text("# of Players:  \(userData.collection.filterCriteria.numPlayers)")})
                            
            Stepper(value: $userData.collection.filterCriteria.minAge, in: 0...18, label: { Text("Minimum Age:  \(userData.collection.filterCriteria.minAge)")})
         
          }
      }
}

