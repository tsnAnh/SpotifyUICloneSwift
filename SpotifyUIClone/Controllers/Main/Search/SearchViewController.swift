//
//  SearchViewController.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 08/05/2022.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class SearchViewController: BaseViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var viewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupTableView()
        
        observeData()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 1
        tableView.register(UINib(nibName: CategoriesTableViewCell.cellIdentifier(), bundle: .main), forCellReuseIdentifier: String(describing: CategoriesTableViewCell.self))
        tableView.register(UINib(nibName: SearchHeaderTableViewCell.cellIdentifier(), bundle: .main), forCellReuseIdentifier: SearchHeaderTableViewCell.cellIdentifier())
        tableView.register(UINib(nibName: "SpotifySearchBox", bundle: .main), forHeaderFooterViewReuseIdentifier: "SpotifySearchBox")
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.contentInsetAdjustmentBehavior = .never
    }
    
    private func observeData() {
        viewModel.categories
            .bind(to: tableView.rx.items(dataSource: viewModel.dataSource))
            .disposed(by: disposeBag)
    }
    
    override func viewDidLayoutSubviews() {
        tableView.contentInset.bottom = view.safeAreaInsets.bottom
    }
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if (section == 1) {
            let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "SpotifySearchBox") as! SpotifySearchBox
            cell.viewModel = SpotifySearchBoxViewModel { [weak self] in
                self?.navigationController?.pushViewController(SearchAndHistoryViewController(), animated: false)
            }
            return cell
        }
        
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 1 ? 64 : .leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        .leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
