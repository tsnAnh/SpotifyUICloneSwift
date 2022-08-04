//
//  ContentTypeBottomSheetView.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 04/08/2022.
//

import UIKit
import RxSwift

final class ContentTypeBottomSheetView: UIView, NibLoading {
    var onCancelClick: () -> Void = {}
    
    private let viewModel = ContentTypeBottomSheetViewModel()
    private let disposeBag = DisposeBag()
    
    @IBOutlet private weak var contentTypeTableView: UITableView!
    @IBOutlet private weak var cancelButton: UIButton!
    
    static func loadFromXib() -> ContentTypeBottomSheetView {
        return load(nibName: String(describing: Self.self))
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupTableView()
        setupCancelButton()
        
        observe()
    }
    
    private func setupTableView() {
        contentTypeTableView.allowsSelection = false
        contentTypeTableView.separatorStyle = .none
        contentTypeTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        let labelHeader = UILabel(frame: CGRect(x: 0, y: 0, width: contentTypeTableView.frame.width, height: 40))
        labelHeader.text = "Sắp xếp theo"
        contentTypeTableView.tableHeaderView = labelHeader
    }
    
    private func setupCancelButton() {
        cancelButton.rx.tap.asDriver()
            .drive(onNext: { [weak self] in
                self?.onCancelClick()
            })
        
            .disposed(by: disposeBag)
    }
    
    func observe() {
        viewModel.contentTypesObservable
            .bind(to: contentTypeTableView.rx.items(cellIdentifier: "cell", cellType: UITableViewCell.self)) { index, element, cell in
                cell.textLabel?.text = element.rawValue
                cell.backgroundColor = .clear
            }
            .disposed(by: disposeBag)
    }
}
