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
            case .ContentTypeAndListType:
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: ContentTypeAndListTypeCollectionViewCell.cellIdentifier(),
                    for: indexPath) as! ContentTypeAndListTypeCollectionViewCell
                return cell
            case .LibraryList(let items):
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: LibraryListTableViewCell.cellIdentifier(),
                    for: indexPath) as! LibraryListTableViewCell
                cell.viewModel = LibraryListViewModel(libraryItems: items)
                return cell
            case .AddArtist:
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: LibraryListTableViewCell.cellIdentifier(),
                    for: indexPath) as! LibraryListTableViewCell
                return cell
            case .AddPodcastAndProgram:
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: LibraryListTableViewCell.cellIdentifier(),
                    for: indexPath) as! LibraryListTableViewCell
                return cell
            }
        }
    }
}
