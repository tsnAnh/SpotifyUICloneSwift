//
//  SearchSection.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 19/06/2022.
//

import RxDataSources

enum SearchSection {
    case CategoriesSection(items: [SearchItem])
}

extension SearchSection: SectionModelType {
    typealias Item = SearchItem
    
    var items: [SearchItem] {
        switch self {
        case .CategoriesSection(items: let items):
            return items
        }
    }
    
    init(original: SearchSection, items: [SearchItem]) {
        self = original
    }
}
