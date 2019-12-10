/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A model object that stores app data.
*/

import Combine
import SwiftUI

final class UserData: ObservableObject {
    @Published var collection: BoardgameCollection
    
    init(userid: String) {
        self.collection = BoardgameCollection(userid: userid)
    }
}


