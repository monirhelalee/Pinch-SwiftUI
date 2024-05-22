//
//  PagrModel.swift
//  Pinch-SwiftUI
//
//  Created by Monir Haider Helalee on 22/5/24.
//

import Foundation

struct Page: Identifiable{
    let id: Int
    let imageName: String
}

extension Page {
    var thumbnailName: String {
        return "thumb-" + imageName
    }
}
