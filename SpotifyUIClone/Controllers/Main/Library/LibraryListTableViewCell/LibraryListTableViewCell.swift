//
//  LibraryListTableViewCell.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 02/08/2022.
//

import UIKit
import RxSwift
import RxCocoa

class LibraryListTableViewCell: UITableViewCell, HasCellIdentifier {
    
    @IBOutlet private weak var libraryCollectionView: UICollectionView!
    
    private var disposeBag = DisposeBag()
    
    private lazy var collectionViewGridLayout: UICollectionViewFlowLayout = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.minimumInteritemSpacing = 8
        collectionViewLayout.minimumLineSpacing = 8
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        collectionViewLayout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 40) / 2, height:(libraryCollectionView.frame.width - 40) / 2 + 64)
        return collectionViewLayout
    }()
    
    private lazy var collectionViewLinearLayout: UICollectionViewFlowLayout = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.minimumLineSpacing = 8
        collectionViewLayout.minimumInteritemSpacing = 0
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        collectionViewLayout.itemSize = CGSize(width: UIScreen.main.bounds.width - 32, height: 80)
        return collectionViewLayout
    }()
    
    var viewModel: LibraryListViewModel! {
        didSet {
            configureCell()
            layoutIfNeeded()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupLibraryCollectionView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    
    // MARK: private functions
    private func setupLibraryCollectionView() {
        libraryCollectionView.allowsSelection = false
        libraryCollectionView.isScrollEnabled = false
        libraryCollectionView.register(GridLibraryItemCollectionViewCell.self)
        libraryCollectionView.collectionViewLayout = collectionViewGridLayout
    }
    
    private func configureCell() {
        let libraryItems = Observable.just(viewModel.libraryItems)
        libraryItems.bind(to: libraryCollectionView.rx.items(
            cellIdentifier: GridLibraryItemCollectionViewCell.cellIdentifier(),
            cellType: GridLibraryItemCollectionViewCell.self)) { index, element, cell in
                cell.libraryItemViewModel = LibraryItemViewModel(libraryItem: element)
        }
        .disposed(by: disposeBag)
        
        viewModel.isLibraryListUseGridLayout
            .asDriver(onErrorJustReturn: false)
            .drive(onNext: { isGrid in
                let layout = (isGrid ?? false) ? self.collectionViewGridLayout : self.collectionViewLinearLayout
                self.libraryCollectionView.collectionViewLayout = layout
            })
            .disposed(by: disposeBag)
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        self.libraryCollectionView.frame = CGRect(x: 0, y: 0, width: targetSize.width, height: 1)
        self.libraryCollectionView.layoutIfNeeded()
        
        return libraryCollectionView.collectionViewLayout.collectionViewContentSize
    }
    
}
