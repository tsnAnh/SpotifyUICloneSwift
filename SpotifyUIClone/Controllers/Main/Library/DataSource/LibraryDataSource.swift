//
//  LibraryDataSource.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 01/08/2022.
//

import RxDataSources

struct LibraryDataSource {
    static func dataSource() -> RxTableViewSectionedReloadDataSource<LibrarySection> {
        return .init { _, tableView, indexPath, item in
            switch item {
            case .LibraryList:
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: LibraryListTableViewCell.cellIdentifier(),
                    for: indexPath) as! LibraryListTableViewCell
                return cell
            }
        }
    }
}
