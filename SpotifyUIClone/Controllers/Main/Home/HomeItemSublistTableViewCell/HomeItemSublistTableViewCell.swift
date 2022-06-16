//
//  HomeItemSublistTableViewCell.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 28/05/2022.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class HomeItemSublistTableViewCell: UITableViewCell {

    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var collectionViewHeightContraint: NSLayoutConstraint!
    
    private var disposeBag = DisposeBag()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let homeItemCellNib = UINib(nibName: String(describing: HomeItemArtistCollectionViewCell.self), bundle: .main)
        collectionView.register(homeItemCellNib, forCellWithReuseIdentifier: "home-item-cell")
        collectionView.register(UINib(nibName: String(describing: HomePlaylistItemCollectionViewCell.self), bundle: .main), forCellWithReuseIdentifier: String(describing: HomePlaylistItemCollectionViewCell.self))
        collectionView.dataSource = nil
        collectionView.delegate = self
    }
    
    override func prepareForReuse() {
        disposeBag = DisposeBag()
    }

    func bindData(_ header: String, _ homeItemUiModels: [HomeItemUiModel]) {
        label.text = header
        let data: [HomeSublistSections] = [
            .HomeSublistSection(items: homeItemUiModels.map { .HomeSublistItem(item: $0)})
        ]
        Observable.of(data)
            .bind(to: collectionView.rx.items(dataSource: HomeSublistDataSource.dataSource()))
            .disposed(by: disposeBag)
        
    }
}

extension HomeItemSublistTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let size = collectionView.frame.size.width / 2.3
        
        return CGSize(width: size, height: collectionView.frame.height)
    }
}
