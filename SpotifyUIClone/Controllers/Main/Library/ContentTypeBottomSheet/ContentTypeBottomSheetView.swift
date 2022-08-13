//
//  ContentTypeBottomSheetView.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 04/08/2022.
//

import UIKit
import RxSwift
import RxCocoa

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
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        viewModel.selectRowObservable
            .compactMap { $0 }
            .subscribe(on: MainScheduler.instance)
            .subscribe(onNext: { index in
                self.contentTypeTableView.selectRow(at: IndexPath(item: index, section: 0),
                                               animated: false,
                                               scrollPosition: UITableView.ScrollPosition.none)
            })
            .disposed(by: disposeBag)
    }
    
    private func setupTableView() {
        contentTypeTableView.separatorStyle = .none
        contentTypeTableView.register(ContentTypeTableViewCell.self)
        
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
    
    private func observe() {
        viewModel.contentTypesObservable
            .bind(to: contentTypeTableView.rx.items(cellIdentifier: ContentTypeTableViewCell.cellIdentifier(), cellType: ContentTypeTableViewCell.self)) { index, element, cell in
                cell.contentTypeUi = element
                cell.backgroundColor = .clear
                cell.selectionStyle = .none
            }
            .disposed(by: disposeBag)
        
        contentTypeTableView.rx
            .itemSelected
            .asDriver()
            .drive(onNext: { indexPath in
                self.viewModel.updateSelectedContentTypeIndex(index: indexPath.row)
                self.onCancelClick()
            })
            .disposed(by: disposeBag)
    }
}
