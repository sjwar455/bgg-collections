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

let rootURL = "https://boardgamegeek.com/xmlapi2/"
let userid = "sjwar455"

let boardgameCollection: [Boardgame] = getCollection()

func getCollection() -> [Boardgame] {
    var collection: [Boardgame] = []
    
    let urlString = rootURL + "collection?username=" + userid + "&excludesubtype=boardgameexpansion"
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
    
    print(collectionParser.boardgameIDs)
    
    for boardgameID in collectionParser.boardgameIDs {
        collection.append(getBoardgame(id: boardgameID))
        
    }
    
    for boardgame in collection {
        boardgame.printData()
    }
    
    return collection
}

func getBoardgame(id: String) -> Boardgame {
    
    let urlString = rootURL + "thing?id=" + id
    let url = URL(string: urlString)!
    let parser = XMLParser(contentsOf: url)!
    let bggXMLParser = BoardgameXMLParser()
    parser.delegate = bggXMLParser
    
    if parser.parse()
    {
       print("Parsing OK")
    }
    else
    {
       print("Parser error: ", parser.parserError, ", line: ", parser.lineNumber, ", column: ", parser.columnNumber);
    }
    
    return bggXMLParser.boardgame
    
}

class BoardgameXMLParser : NSObject, XMLParserDelegate {
    var level: Int = 0
    var boardgame: Boardgame = Boardgame()
    var currentElement: String = ""
    
   func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
    
     print("startElement: ", elementName, ", Level: ", level);
    
     currentElement = elementName
    
    // build boardgame struct from xml data
    switch elementName {
    case "name":
        if attributeDict["type"] == "primary" {
            boardgame.title = attributeDict["value"]!
        }
        
    case "minplayers":
        boardgame.minPlayers = attributeDict["value"]!
        
    case "maxplayers":
        boardgame.maxPlayers = attributeDict["value"]!
    
    case "minplaytime":
        boardgame.minPlayTime = attributeDict["value"]!
        
    case "maxplaytime":
        boardgame.maxPlayTime = attributeDict["value"]!
    
    case "minage":
        boardgame.minAge = attributeDict["value"]!
    case "link":
        if attributeDict["type"] == "boardgamecategory" {
            boardgame.categories.append(attributeDict["value"]!)
        }
        else if attributeDict["type"] == "boardgamemechanic" {
            boardgame.mechanics.append(attributeDict["value"]!)
        }
        
    default:
        print("-default case-")
    }
      level += 1
   }
    
   func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
      level -= 1
      print("endElement: ", elementName, ", Level: ", level);
      }
    
   func parser(_ parser: XMLParser, foundCharacters string: String) {
      let trimmedString = string.trimmingCharacters(in: .whitespacesAndNewlines)
      if trimmedString.count > 0
      {
         print("Value: " + string);
         
        if currentElement == "thumbnail"{
            boardgame.imageURL = string
        }
         
         
      }
   }

   func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
       print("failure error: ", parseError)
   }
}

class CollectionXMLParser : NSObject, XMLParserDelegate {
   var level: Int = 0
   var boardgameIDs: [String] = []
    
   func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
      print("startElement: ", elementName, ", Level: ", level);
      print(attributeDict)
    
    switch elementName {
    case "item":
        boardgameIDs.append(attributeDict["objectid"]!)
    default:
        print("default")
    }
      level += 1
   }
    
   func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
      level -= 1
      print("endElement: ", elementName, ", Level: ", level);
      }
    
   func parser(_ parser: XMLParser, foundCharacters string: String) {
      let trimmedString = string.trimmingCharacters(in: .whitespacesAndNewlines)
      if trimmedString.count > 0
      {
         print("Value: " + string);
      }
   }

   func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
       print("failure error: ", parseError)
   }
}

