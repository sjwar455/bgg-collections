/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A model object that stores app data.
*/

import Combine
import SwiftUI

final class UserData: ObservableObject {
    @Published var userid: String = ""
    @Published var collection: [Boardgame] = []
    @Published var filterCriteria: BoardgameFilter = BoardgameFilter()
    
    init(userid: String) {
        self.userid = userid
        self.collection = getCollection(userid: userid)
        self.filterCriteria = BoardgameFilter()
    }
}


