//
//  ContentTypeAndListTypeCollectionViewCell.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 09/08/2022.
//

import UIKit
import RxSwift
import RxCocoa

class ContentTypeAndListTypeCollectionViewCell: UITableViewCell, HasCellIdentifier {
    
    @IBOutlet private weak var contentTypeLabel: UILabel!
    @IBOutlet private weak var listTypeImageView: UIImageView!
    
    private let disposeBag = DisposeBag()
    
    private let viewModel = ContentTypeAndListTypeViewModel()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        viewModel.contentType.asDriver(onErrorJustReturn: ContentType.recentlyAdded)
            .drive(onNext: { contentType in
                self.contentTypeLabel.text = contentType.rawValue
            })
            .disposed(by: disposeBag)
        
        viewModel.isLibraryLayoutGrid.asDriver(onErrorJustReturn: false)
            .drive(onNext: { isGrid in
                if let isGrid = isGrid {
                    if isGrid {
                        self.listTypeImageView.image = UIImage.init(systemName: "circle.grid.2x2")
                    } else {
                        self.listTypeImageView.image = UIImage.init(systemName: "list.bullet")
                    }
                }
            })
            .disposed(by: disposeBag)
        listTypeImageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleListTypeClick(_:)))
        listTypeImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func handleListTypeClick(_ gesture: UITapGestureRecognizer) {
        viewModel.toggleLibraryLayout()
    }
    
}
