//
//  HomeSublistDataSource.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 02/06/2022.
//

import RxDataSources

struct HomeSublistDataSource {
    typealias DataSource = RxCollectionViewSectionedReloadDataSource
    
    public static func dataSource() -> DataSource<HomeSublistSections> {
        .init { _, collectionView, indexPath, item in
            switch item {
            case let .HomeSublistItem(item):
                switch item.itemType {
                case .Artist:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "home-item-cell", for: indexPath) as! HomeItemArtistCollectionViewCell
                    cell.viewModel = item
                    cell.configure()
                    return cell
                case .Playlist:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HomePlaylistItemCollectionViewCell.self), for: indexPath) as! HomePlaylistItemCollectionViewCell
                    cell.viewModel = item
                    cell.configure()
                    return cell
                }
            }
        }
    }
}
