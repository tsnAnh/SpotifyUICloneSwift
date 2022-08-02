//
//  LibraryViewController.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 08/05/2022.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class LibraryViewController: BaseViewController {
    
    @IBOutlet private weak var libraryTableView: UITableView!
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet weak var libraryTypeCollectionView: UICollectionView!
    @IBOutlet weak var typeCollectionViewHeight: NSLayoutConstraint!
    
    private var lastContentOffset: CGFloat = 0.0
    
    private let viewModel = LibraryViewModel()
    
    private let types = ["Danh sách phát", "Nghệ sĩ", "Album", "Podcast và chương trình", "VCL", "DKM VCL"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHeaderView()
        
        setupTableView()
        
        setupLibraryTypeCollectionView()
        
        observeData()
    }
    
    private func setupHeaderView() {
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
    }
    
    private func setupTableView() {
        libraryTableView.register(LibraryListTableViewCell.self)
        libraryTableView.separatorStyle = .none
        libraryTableView.allowsSelection = false
        libraryTableView.delegate = self
    }
    
    private func setupLibraryTypeCollectionView() {
        libraryTypeCollectionView.allowsSelection = false
        libraryTypeCollectionView.register(LibraryTypeCollectionViewCell.self)
        libraryTypeCollectionView.delegate = self
    }
    
    private func observeData() {
        viewModel.librarySectionObseravble
            .bind(to: libraryTableView.rx.items(dataSource: viewModel.dataSource))
            .disposed(by: disposeBag)
        
        viewModel.userAvatarObservable.asDriver(onErrorJustReturn: "")
            .drive(
                onNext: { [weak self] in
                    self?.avatarImageView.kf.setImage(with: URL(string: $0))
                }
            )
            .disposed(by: disposeBag)
        
        Observable.of(types)
            .bind(to: libraryTypeCollectionView.rx.items(cellIdentifier: LibraryTypeCollectionViewCell.cellIdentifier(), cellType: LibraryTypeCollectionViewCell.self)) { index, type, cell in
                cell.text = type
            }
            .disposed(by: disposeBag)
    }
}

extension LibraryViewController: UITableViewDelegate, UICollectionViewDelegateFlowLayout {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self.libraryTableView {
            if (scrollView.contentOffset.y < 0)  {
                //Scrolling up, scrolled to top
                UIView.animate(withDuration: 0.2) {
                    self.typeCollectionViewHeight.constant = 48.0
                    self.libraryTypeCollectionView.layer.opacity = 1
                    self.view.layoutIfNeeded()
                }
            } else if scrollView.contentOffset.y > 0 {
                UIView.animate(withDuration: 0.2) {
                    self.typeCollectionViewHeight.constant = 0.0
                    self.libraryTypeCollectionView.layer.opacity = 0
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let cell: LibraryTypeCollectionViewCell = Bundle.main.loadNibNamed(LibraryTypeCollectionViewCell.cellIdentifier(),
                                                                      owner: self,
                                                                      options: nil)?.first as? LibraryTypeCollectionViewCell else {
            return CGSize.zero
        }
        cell.text = types[indexPath.row]
        cell.setNeedsLayout()
        cell.layoutIfNeeded()
        let size: CGSize = cell.contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        return CGSize(width: size.width, height: collectionView.frame.height - 4)
    }
}
