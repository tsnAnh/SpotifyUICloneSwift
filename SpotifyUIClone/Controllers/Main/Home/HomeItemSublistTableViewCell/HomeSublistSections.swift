//
//  HomeSublistSection.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 02/06/2022.
//

import RxDataSources

enum HomeSublistSections {
    case HomeSublistSection(items: [HomeSublistItems])
}

extension HomeSublistSections: SectionModelType {
    init(original: HomeSublistSections, items: [HomeSublistItems]) {
        self = original
    }
    
    typealias Item = HomeSublistItems
    
    var items: [HomeSublistItems] {
        switch self {
        case .HomeSublistSection(items: let items):
            return items
        }
    }
}
