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
        
                  
                  ImageView(withURL: boardgame.imageURL)
              
                      
                  Text(verbatim: boardgame.title)
                          .font(.largeTitle)
                      
                  HStack {
                      Text(boardgame.minPlayers + "-" + boardgame.maxPlayers + " players")
                          .font(.subheadline)
                      
                      Text(boardgame.minPlayTime + "-" + boardgame.maxPlayTime + " mins")
                          .font(.subheadline)
                   
                      Text("ages " + boardgame.minAge + "+")
                          .font(.subheadline)
                          
                      }
                  .padding(.bottom, 25)
                      
              
                  
        
            // boardgame info
            VStack(alignment: .leading) {
                
                  Text("Desription")
                      .font(.headline)
                        
                  Text(boardgame.description)
                    .padding(.bottom, 25)
                  
               
                
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
                        .padding(.trailing, 25)
                    
            
                
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
                .offset(x: -50)
            
               } // end main VStack
            
            
    } // end body

} // end View struct
