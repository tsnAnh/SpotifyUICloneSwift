//
//  SearchAndHistoryViewController.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 23/06/2022.
//

import UIKit
import RxSwift
import RxCocoa

final class SearchAndHistoryViewController: BaseViewController {
    
    @IBOutlet private weak var tableViewSearch: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        initialzeSearchController()
        initializeSearchBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        focusSearchBar()
    }

    private func initialzeSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.isActive = true
    }

    private func setupTableView() {
        tableViewSearch.separatorStyle = .none
        tableViewSearch.tableHeaderView = SearchItemHeaderView()
    }

    private func initializeSearchBar() {
        searchBar.placeholder = "Tìm kiếm"
        searchBar.showsCancelButton = true
        searchBar.searchTextField.textColor = .white
        searchBar.rx.cancelButtonClicked
            .asDriver(onErrorJustReturn: ())
            .drive(onNext: { [weak self] in
                self?.navigationController?.popToRootViewController(animated: false)
            })
            .disposed(by: disposeBag)
    }
    
    private func focusSearchBar() {
        searchBar.becomeFirstResponder()
    }
}

extension SearchAndHistoryViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
    }
}
