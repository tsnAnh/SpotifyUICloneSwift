//
// Created by Anh Trần Sĩ Nguyên on 28/05/2022.
//

import RxDataSources

enum HomeSection {
    case HeaderSection(items: [HomeItem])
    case RecentlyListen(items: [HomeItem])
    case HomeSublistSection(items: [HomeItem])
}

extension HomeSection: SectionModelType {
    typealias Item = HomeItem

    var items: [Item] {
        switch self {
        case .HeaderSection(let items):
            return items
        case .RecentlyListen(let items):
            return items
        case .HomeSublistSection(let items):
            return items
        }
    }

    init(original: Self, items: [Item]) {
        self = original
    }
}
