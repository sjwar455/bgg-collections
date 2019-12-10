//
//  MultiSelectRow.swift
//  Boardgames
//
//  Created by Sam Wareing on 12/9/19.
//  Copyright © 2019 Sam Wareing. All rights reserved.
//

import SwiftUI

struct MultipleSelectionRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(self.title)
                if self.isSelected {
                    Spacer()
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}
