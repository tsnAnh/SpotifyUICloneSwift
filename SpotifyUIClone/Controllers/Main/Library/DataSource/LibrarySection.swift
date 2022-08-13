//
//  LibrarySection.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 01/08/2022.
//

import Differentiator

enum LibrarySection {
    case LibraryListSection(items: [LibraryItem])
}

extension LibrarySection: SectionModelType {
    typealias Item = LibraryItem
    
    var items: [LibraryItem] {
        switch self {
        case .LibraryListSection(items: let items):
            return items
        }
    }
    
    init(original: LibrarySection, items: [LibraryItem]) {
        self = original
    }
}
