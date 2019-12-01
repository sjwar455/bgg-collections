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
                      Text(boardgame.minAge + "+")
                          .font(.subheadline)
                          
                      }
                      
              
                  
        
        VStack(alignment: .leading) {
                  Text("Desription")
                      .font(.title)
              
                  Text(boardgame.description)
                  
              
                  Text("Categories")
                      .font(.title)
             
                  Text("Mechanics")
                      .font(.title)
          
              }
        }
        

            
    }

}
