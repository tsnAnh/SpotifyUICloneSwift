//
// Created by Anh Trần Sĩ Nguyên on 28/05/2022.
//

import RxDataSources
import UIKit

struct HomeDataSource {
    typealias DataSource = RxTableViewSectionedReloadDataSource

    static func homeDataSource() -> DataSource<HomeSection> {
        .init { _, tableView, indexPath, item in
            switch item {
            case .Header:
                let headerCell = tableView.dequeueReusableCell(withIdentifier: "header-cell", for: indexPath)
                return headerCell
            case let .RecentlyListenList(items):
                let recentlyListenListCell = tableView.dequeueReusableCell(withIdentifier: "recently-cell", for: indexPath) as! RecentlyListenListTableViewCell
                recentlyListenListCell.bindData(recentlyListenItems: items)
                return recentlyListenListCell
            case let .ListenAgain(header, items):
                let homeSublistCell = tableView.dequeueReusableCell(withIdentifier: "home-sublist-cell", for: indexPath) as! HomeItemSublistTableViewCell
                homeSublistCell.bindData(header, items)
                return homeSublistCell
            }
        }
    }
}
