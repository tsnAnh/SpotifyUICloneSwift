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
    
    private let types = ["Danh sách phát", "Nghệ sĩ", "Album", "Podcast và chương trình"]
    
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
        libraryTableView.register(ContentTypeAndListTypeCollectionViewCell.self)
        libraryTableView.separatorStyle = .none
        libraryTableView.allowsSelection = false
        libraryTableView.delegate = self
        libraryTableView.estimatedRowHeight = 1
        libraryTableView.rowHeight = UITableView.automaticDimension
        libraryTableView.contentInset = .init(top: 0, left: 0, bottom: self.view?.window?.safeAreaInsets.bottom ?? 0, right: 0)
    }
    
    private func setupLibraryTypeCollectionView() {
        libraryTypeCollectionView.allowsSelection = false
        libraryTypeCollectionView.register(LibraryTypeCollectionViewCell.self)
        libraryTypeCollectionView.delegate = self
        libraryTypeCollectionView.contentInsetAdjustmentBehavior = .never
        libraryTypeCollectionView.showsHorizontalScrollIndicator = false
        libraryTypeCollectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
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
            .bind(to: libraryTypeCollectionView.rx.items(
                cellIdentifier: LibraryTypeCollectionViewCell.cellIdentifier(),
                cellType: LibraryTypeCollectionViewCell.self)
            ) { index, type, cell in
                cell.text = type
            }
            .disposed(by: disposeBag)
        
        viewModel.isLibraryListLayoutGrid.asDriver(onErrorJustReturn: false)
            .drive(onNext: {_ in
                self.libraryTableView.reloadRows(at: [IndexPath(row: 1, section: 0)], with: .none)
            })
            .disposed(by: disposeBag)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        libraryTypeCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let vc = BottomSheetViewController()
        let bottomSheetView = ContentTypeBottomSheetView.loadFromXib()
        bottomSheetView.onCancelClick = {
            vc.dismiss()
        }
        vc.modalPresentationStyle = .overCurrentContext
        vc.containerView = bottomSheetView
        let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate
        sceneDelegate?.navigationController.present(vc, animated: false)
    }
}

extension LibraryViewController: UITableViewDelegate, UICollectionViewDelegateFlowLayout {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self.libraryTableView {
            if (scrollView.contentOffset.y < 0)  {
                // Scrolling up, scrolled to top
                UIView.animate(withDuration: 0.1) {
                    self.typeCollectionViewHeight.constant = 48.0
                    self.libraryTypeCollectionView.layer.opacity = 1
                    self.libraryTypeCollectionView.transform = CGAffineTransform(translationX: 0, y: 0)
                    self.view.layoutIfNeeded()
                }
            } else if scrollView.contentOffset.y > 0 {
                UIView.animate(withDuration: 0.1) {
                    self.typeCollectionViewHeight.constant = 0.0
                    self.libraryTypeCollectionView.layer.opacity = 0
                    self.libraryTypeCollectionView.transform = CGAffineTransform(translationX: 0, y: -16)
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
        return CGSize(width: size.width, height: collectionView.frame.height)
    }
}
