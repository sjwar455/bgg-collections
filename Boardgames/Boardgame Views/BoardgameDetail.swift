//
//  BoardgameDetail.swift
//  Boardgames
//
//  Created by Sam Wareing on 11/30/19.
//  Copyright © 2019 Sam Wareing. All rights reserved.
//

import SwiftUI

struct BoardgameDetail: View {
     @EnvironmentObject private var userData: UserData
    var boardgame: Boardgame
    
    @State private var showDescription: Bool = false
    
    var body: some View {
        ScrollView {
          VStack {
                  
            ImageView(withURL: boardgame.thumbnailURL, width: 200, height: 200)
              
                      
                  Text(verbatim: boardgame.title)
                          .font(.largeTitle)
                      
                  HStack {
                      Text(boardgame.minPlayers + "-" + boardgame.maxPlayers + " players")
                          .font(.subheadline)
                      
                      Text(boardgame.playTimeRange + " mins")
                          .font(.subheadline)
                   
                      Text("ages " + boardgame.minAge + "+")
                          .font(.subheadline)
                          
                      }
                  .padding(.bottom, 25)
                      
        
            // boardgame info
            VStack(alignment: .leading) {
        
                
                Toggle(isOn: $showDescription){
                    Text("Description")
                        .padding(.bottom)
                        .font(.headline)
                    
                }
               
                if showDescription {
                    Text(boardgame.description)
                        .padding(.bottom, 25)
                }
                
                    
                
               
                    
                    
                
                // boardgame mechanics & categories
                  HStack(alignment: .top) {
                    
                    // boardgame categories
                    VStack(alignment: .leading) {
                        Text("Categories")
                                .font(.headline)
                
                    
                        ForEach(boardgame.categories, id: \.self) { category in
                                Text(category)
                                        .font(.body)
                                } // end ForEach categories
                    } // end VStack categories
                        .padding(.trailing, 50)
                    
            
                
                    // boardgam mechanics
                    VStack(alignment: .leading) {
                            Text("Mechanics")
                                    .font(.headline)
                
                            ForEach(boardgame.mechanics, id: \.self) { mechanic in
                                Text(mechanic)
                                    .font(.body)
                            } // end ForEach mechanics
                    } // end VStack mechanics
 
                    
                } // end HStack of boardgame categories and mechanics
 
                
                } // end VStack info
                .offset(x: 0)
                .padding(.top, 25)
 
               } // end main VStack
        } // end of ScrollView 
            
            
    } // end body

} // end View struct
