//
//  Data.swift
//  Boardgames
//
//  Created by Sam Wareing on 11/25/19.
//  Copyright © 2019 Sam Wareing. All rights reserved.
//
//  Helper functions and objects
//

import Foundation
import SwiftUI
import Combine

let boardgameCollection: [Boardgame] = getCollection(userid: "seismicHBDPT")


func getCollection(userid: String) -> [Boardgame] {
    print("========================================================")
    print("parsing collection for user " + userid)
    print("========================================================")
    var collection: [Boardgame] = []
    
    
    let urlString = collectionRootURL.replacingOccurrences(of: collection_userid, with: userid)
    let url = URL(string: urlString)!
    let parser = XMLParser(contentsOf: url)!
    

    let collectionParser = CollectionXMLParser()
    
    parser.delegate = collectionParser
    
    if parser.parse()
    {
       print("Parsing OK")
    }
    else
    {
       print("Parser error: ", parser.parserError, ", line: ", parser.lineNumber, ", column: ", parser.columnNumber);
        
    }
    
    print("========================================================")
    print("boardgame ids:")
    print("========================================================")
    
        print(collectionParser.boardgameIDs)
    
    for boardgameID in collectionParser.boardgameIDs {
        collection.append(getBoardgame(id: boardgameID))
    }
     
    
      print("========================================================")
      print("boardgame collection")
      print("========================================================")
    
        for boardgame in collection {
            boardgame.printData()
        }
    
      print("========================================================")
      print("end of building boardgame collection")
      print("========================================================")
    
    return collection
}

func getBoardgame(id: String) -> Boardgame {
    
    print("========================================================")
    print("parsing boardgame data for boardgame with bgg id: " + id)
    print("========================================================")
    
    let urlString = boardgameRootURL.replacingOccurrences(of: boardgame_id, with: id)
    let url = URL(string: urlString)!
    
    let parser = XMLParser(contentsOf: url)!
    
    let bggXMLParser = BoardgameXMLParser()
    parser.delegate = bggXMLParser
    
    if parser.parse()
    {
       print("Parsing OK for bgg with id " + id)
    }
    else
    {
        let errorMessage = parser.parserError!.localizedDescription
        
        print("Parser error: " + errorMessage)
        print("while parsing bgg id " + id)
        
        if errorMessage.contains(retryError) {
            print("retrying parsing for boardgame wth bgg id " + id + "...")
            
            return getBoardgame(id: id)
        }
        
    
    }
    
    // TO DO: move these as set methods into boardgame struct
    if bggXMLParser.boardgame.minPlayTime == bggXMLParser.boardgame.maxPlayTime {
                bggXMLParser.boardgame.playTimeRange = bggXMLParser.boardgame.minPlayTime
           }
    else {
                bggXMLParser.boardgame.playTimeRange = bggXMLParser.boardgame.minPlayTime + "-" + bggXMLParser.boardgame.maxPlayTime
           }
        
    return bggXMLParser.boardgame
    
}

class ImageLoader: ObservableObject {
    var didChange = PassthroughSubject<Data, Never>()
    
    var data = Data() {
        didSet{
            didChange.send(data)
            print("got image!!")
        }
    }
    
    init(urlString: String) {
        guard let url = URL(string: urlString) else {return}
        print(url) 
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                self.data = data
            }
            
        }
        
        task.resume()
    }
}


