//
//  LibraryViewController.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 08/05/2022.
//

import UIKit
import RxSwift
import RxCocoa

class LibraryViewController: BaseViewController {
    
    @IBOutlet private weak var libraryTableView: UITableView!
    
    private let viewModel = LibraryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
        observeData()
    }
    
    private func setupTableView() {
        libraryTableView.delegate = self
    }
    
    private func observeData() {
//        viewModel.librarySectionObseravble
//            .bind(to: libraryTableView.rx.items(dataSource: viewModel.dataSource))
//            .disposed(by: disposeBag)
    }
}

extension LibraryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return LibraryHeaderView.loadFromXib()
    }
}
