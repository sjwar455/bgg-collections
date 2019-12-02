//
//  BoardGameGeekParser.swift
//  Boardgames
//
//  Created by Sam Wareing on 11/30/19.
//  Copyright © 2019 Sam Wareing. All rights reserved.
//

import SwiftUI

let rootURL = "https://boardgamegeek.com/xmlapi2/"
let collection_userid = "%USERID%"
let boardgame_id = "%ID%"
let collectionRootURL = rootURL + "collection?username=" + collection_userid + "&excludesubtype=boardgameexpansion"
let boardgameRootURL = rootURL + "thing?id=" + boardgame_id
let retryError: String = "NSXMLParserErrorDomain error 1"


class BoardgameXMLParser : NSObject, XMLParserDelegate {
    var level: Int = 0
    var boardgame: Boardgame = Boardgame()
    var currentElement: String = ""
    
   func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
    
     print("startElement: ", elementName, ", Level: ", level);
    
     currentElement = elementName
    
    // build boardgame struct from xml data
    switch elementName {
    
    case "item":
        boardgame.bggid = attributeDict["id"]!
        
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
        print("deault bg element case")
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
         
        switch currentElement {
        case "image":
            boardgame.imageURL = string
            
        case "thumbnail":
            boardgame.thumbnailURL = string
            
        case "description":
            if string == "&" || string == "#10;" {
                boardgame.description += "\n"
            }
            else {
                boardgame.description += string.replacingOccurrences(of: "#10;", with: "")
            }
        default:
            print("default bg description case")
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
