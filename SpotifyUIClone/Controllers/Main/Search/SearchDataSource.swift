//
//  SearchDataSource.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 19/06/2022.
//

import RxDataSources

struct SearchDataSource {
    static func searchDataSource() -> RxTableViewSectionedReloadDataSource<SearchSection> {
        .init { _, tableView, indexPath, item in
            switch item {
            case .Categories(header: let header, categories: let categories):
                let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CategoriesTableViewCell.self), for: indexPath) as! CategoriesTableViewCell
                cell.viewModel = CategoriesTableViewCellViewModel(header: header, categories: categories)
                
                return cell
            }
        }
    }
}
