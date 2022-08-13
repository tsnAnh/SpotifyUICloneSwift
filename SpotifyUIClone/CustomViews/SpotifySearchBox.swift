//
//  SpotifySearchBox.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 20/06/2022.
//

import UIKit
import RxCocoa
import RxSwift

class SpotifySearchBox: UITableViewHeaderFooterView {
    @IBOutlet private weak var searchBackgroundView: UIView!
    var viewModel: SpotifySearchBoxViewModel!
    
    private let disposeBag = DisposeBag()
    
    static func loadFromXib() -> SpotifySearchBox {
        SpotifySearchBox.load(nibName: "SpotifySearchBox")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.layer.backgroundColor = Colors.backgroundColor.cgColor
        self.searchBackgroundView.layer.cornerRadius = 8
        self.searchBackgroundView.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer()
        self.searchBackgroundView.addGestureRecognizer(tapGesture)
        tapGesture.rx.event.bind(onNext: { [weak self] _ in
            self?.viewModel.onClick()
        }).disposed(by: disposeBag)
    }
}

extension SpotifySearchBox: NibLoading {
    
}
