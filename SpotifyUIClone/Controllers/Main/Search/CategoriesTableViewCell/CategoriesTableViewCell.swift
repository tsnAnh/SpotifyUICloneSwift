//
//  CategoriesTableViewCell.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 18/06/2022.
//

import UIKit
import RxSwift
import RxCocoa

class CategoriesTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var headerLabel: UILabel!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    static func cellIdentifier() -> String {
        String(describing: Self.self)
    }
    
    private var disposeBag = DisposeBag()
    
    var viewModel: CategoriesTableViewCellViewModel! {
        didSet {
            configureCell()
            layoutIfNeeded()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.isScrollEnabled = false
        collectionView.register(
            UINib(
                nibName: String(describing: CategoryCollectionViewCell.cellIdentifier()),
                bundle: .main
            ),
            forCellWithReuseIdentifier: CategoryCollectionViewCell.cellIdentifier()
        )
        collectionView.collectionViewLayout = createCollectionLayout()
    }
    
    private func createCollectionLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2 - 22, height: 100)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 12
        return layout
    }
    
    private func configureCell() {
        headerLabel.text = viewModel.header
        Observable.of(viewModel.categories)
            .bind(to: collectionView.rx.items(
                cellIdentifier: CategoryCollectionViewCell.cellIdentifier(),
                cellType: CategoryCollectionViewCell.self)
            ) { _ ,element, cell in
                cell.viewModel = element
            }
            .disposed(by: disposeBag)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
}

