//
//  ContentView.swift
//  Boardgames
//
//  Created by Sam Wareing on 11/24/19.
//  Copyright © 2019 Sam Wareing. All rights reserved.
//

import SwiftUI



struct ContentView: View {
    @EnvironmentObject var userData: UserData

    var body: some View {
        NavigationView{
            NavigationLink(destination: BoardgameDetail(boardgame: userData.collection[3])) {
                Text("See boardgame 0")
            }
        }
    }
}



