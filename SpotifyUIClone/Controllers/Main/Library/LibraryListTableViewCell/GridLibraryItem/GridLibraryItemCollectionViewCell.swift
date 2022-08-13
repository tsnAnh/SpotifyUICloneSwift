//
//  GridLibraryItemCollectionViewCell.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 09/08/2022.
//

import UIKit
import Kingfisher
import RxSwift
import RxCocoa

final class GridLibraryItemCollectionViewCell: UICollectionViewCell, HasCellIdentifier {
    
    @IBOutlet private weak var libraryItemImageView: UIImageView!
    @IBOutlet private weak var libraryLabel: UILabel!
    @IBOutlet private weak var libraryDescriptionLabel: UILabel!
    @IBOutlet private weak var layout: UIStackView!
    @IBOutlet weak var labelsStackView: UIStackView!
    
    private var disposeBag = DisposeBag()
    
    var libraryItemViewModel: LibraryItemViewModel! {
        didSet {
            configureCell()
            setNeedsLayout()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let libraryItem = libraryItemViewModel.libraryItem
        if libraryItem is ArtistLibraryItem {
            // Artist
            configureArtistCell()
        } else if libraryItem is PlaylistLibraryItem {
            // Playlist
            configurePlaylistCell()
        }
    }
    
    override func prepareForReuse() {
        disposeBag = DisposeBag()
    }
    
    // MARK: private functions
    private func configureCell() {
        let libraryItem = libraryItemViewModel.libraryItem
        libraryItemImageView.kf.setImage(with: URL(string: "https://cdn.vox-cdn.com/thumbor/4y2s48tJaD0AMtpKIT5B5u3mpsQ=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23352422/003_MoonKnight_KA_R2_JLY_C15_IH_W3.0_ALT_IG_Mech2.jpg"))
        libraryLabel.text = libraryItem.title
        libraryDescriptionLabel.text = libraryItem.subtitle
        
        libraryItemViewModel.isLibraryLayoutGrid
            .asDriver(onErrorJustReturn: false)
            .drive(onNext: { isGrid in
                if isGrid != nil && isGrid! {
                    self.layoutGridCell()
                } else {
                    self.layoutLinearCell()
                }
                self.layoutSubviews()
            })
            .disposed(by: disposeBag)
    }
    
    private func configureArtistCell() {
        DispatchQueue.main.async {
            self.libraryItemImageView.makeCircle()
        }
    }
    
    private func configurePlaylistCell() {
        DispatchQueue.main.async {
            self.libraryItemImageView.makeCorners(all: 8)
        }
    }
    
    private func layoutGridCell() {
        layout.axis = .vertical
        libraryLabel.textAlignment = .center
        libraryDescriptionLabel.textAlignment = .center
        layout.alignment = .center
        labelsStackView.distribution = .fillProportionally
        setNeedsLayout()
        layoutIfNeeded()
    }
    
    private func layoutLinearCell() {
        layout.axis = .horizontal
        libraryLabel.textAlignment = .natural
        libraryDescriptionLabel.textAlignment = .natural
        layout.alignment = .center
        setNeedsLayout()
        layoutIfNeeded()
    }

}
