//
//  HomeViewController.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 08/05/2022.
//

import UIKit
import RxCocoa
import RxSwift

final class HomeViewController: BaseViewController {

    @IBOutlet private weak var notificationsIcon: UIImageView!
    @IBOutlet private weak var historyIcon: UIImageView!
    @IBOutlet private weak var settingsIcon: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var recentlyListenList: UICollectionView!
    
    private var disposeBag = DisposeBag()
    
    let recentlyListenItems = [
        RecentlyListenItemUiModel(imageUrl: "https://imgix.bustle.com/uploads/image/2022/3/29/ac951bf3-0cad-4d84-80b9-565c9a69ffce-moon-knight-header.jpg?w=1200&h=630&fit=crop&crop=focalpoint&fm=jpg&fp-x=0.4667&fp-y=0.307", title: "Test"),
        RecentlyListenItemUiModel(imageUrl: "https://imgix.bustle.com/uploads/image/2022/3/29/ac951bf3-0cad-4d84-80b9-565c9a69ffce-moon-knight-header.jpg?w=1200&h=630&fit=crop&crop=focalpoint&fm=jpg&fp-x=0.4667&fp-y=0.307", title: "Test"),
        RecentlyListenItemUiModel(imageUrl: "https://imgix.bustle.com/uploads/image/2022/3/29/ac951bf3-0cad-4d84-80b9-565c9a69ffce-moon-knight-header.jpg?w=1200&h=630&fit=crop&crop=focalpoint&fm=jpg&fp-x=0.4667&fp-y=0.307", title: "Test"),
        RecentlyListenItemUiModel(imageUrl: "https://imgix.bustle.com/uploads/image/2022/3/29/ac951bf3-0cad-4d84-80b9-565c9a69ffce-moon-knight-header.jpg?w=1200&h=630&fit=crop&crop=focalpoint&fm=jpg&fp-x=0.4667&fp-y=0.307", title: "Test"),
        RecentlyListenItemUiModel(imageUrl: "https://imgix.bustle.com/uploads/image/2022/3/29/ac951bf3-0cad-4d84-80b9-565c9a69ffce-moon-knight-header.jpg?w=1200&h=630&fit=crop&crop=focalpoint&fm=jpg&fp-x=0.4667&fp-y=0.307", title: "Test"),
        RecentlyListenItemUiModel(imageUrl: "https://imgix.bustle.com/uploads/image/2022/3/29/ac951bf3-0cad-4d84-80b9-565c9a69ffce-moon-knight-header.jpg?w=1200&h=630&fit=crop&crop=focalpoint&fm=jpg&fp-x=0.4667&fp-y=0.307", title: "Test"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupRecentlyListenList()
    }
    
    private func setupRecentlyListenList() {
        let nib = UINib(nibName: "RecentListenCollectionViewCell", bundle: Bundle.main)
        recentlyListenList.register(nib, forCellWithReuseIdentifier: "cell")
        recentlyListenList.delegate = self
        recentlyListenList.backgroundColor = .clear
        
        let observable = Observable.of(recentlyListenItems)
        
        observable.bind(to: recentlyListenList.rx.items(cellIdentifier: "cell", cellType: RecentListenCollectionViewCell.self)) { index, element, cell in
            cell.bind(recentlyListenItemModel: element)
        }.disposed(by: disposeBag)
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
            let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
            let size:CGFloat = (recentlyListenList.frame.size.width - space) / 2.0
            return CGSize(width: size, height: 48)
        }
}
