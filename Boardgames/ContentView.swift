//
//  ContentView.swift
//  Boardgames
//
//  Created by Sam Wareing on 11/24/19.
//  Copyright © 2019 Sam Wareing. All rights reserved.
//

import SwiftUI



struct ContentView: View {
    
    @State var image: Image? = nil
    @State var showCaptureImageView: Bool = false
    
    var body: some View {
        
        
        ZStack {
            VStack {
                Button(action: {
                  self.showCaptureImageView.toggle()

                }) {
                    Text("Choose photos")
                }
                image?.resizable()
                  .frame(width: 250, height: 250)
                  .clipShape(Circle())
                  .overlay(Circle().stroke(Color.white, lineWidth: 4))
                  .shadow(radius: 10)
            }
            if (showCaptureImageView) {
                 CaptureImageView(isShown: $showCaptureImageView, image: $image)
               }
        }

//        Text("Testing Firbase config")
//        NavigationView{
//            NavigationLink(destination: BoardgameList().environmentObject(UserData(userid: "seismicHBDPT"))) {
//                Text("view boardgame collection ")
//            }
//        }
    }
}



