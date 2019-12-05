//
//  FilterView.swift
//  Boardgames
//
//  Created by Sam Wareing on 12/4/19.
//  Copyright © 2019 Sam Wareing. All rights reserved.
//

import SwiftUI

struct FilterView: View {
    @EnvironmentObject private var userData: UserData
    
    var body: some View {
        VStack {
            Stepper(value: $userData.filterCriteria.numPlayers, in: 0...20, label: { Text("# of Players:  \(userData.filterCriteria.numPlayers)")})
                          
            Stepper(value: $userData.filterCriteria.minAge, in: 0...18, label: { Text("Minimum Age:  \(userData.filterCriteria.minAge)")})
        }
    }
}


