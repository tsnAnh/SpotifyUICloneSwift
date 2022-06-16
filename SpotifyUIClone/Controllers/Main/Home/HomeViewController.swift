//
//  HomeViewController.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 08/05/2022.
//

import UIKit
import RxCocoa
import RxSwift
import RxDataSources

final class HomeViewController: BaseViewController {

    @IBOutlet private weak var homeList: UITableView!

    private var disposeBag = DisposeBag()

    private let homeToolbarCell = HomeHeaderTableViewCell()

    private let viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureHomeTableView()

        bindTableView()
    }

    private func configureHomeTableView() {
        let headerCellNibName = String(describing: HomeHeaderTableViewCell.self)
        let recentlyCellNibName = String(describing: RecentlyListenListTableViewCell.self)
        let homeSublistNibName = String(describing: HomeItemSublistTableViewCell.self)

        let headerNib = UINib(nibName: headerCellNibName, bundle: .main)
        let recentlyListenNib = UINib(nibName: recentlyCellNibName, bundle: .main)
        let homeSublistNib = UINib(nibName: homeSublistNibName, bundle: .main)
        homeList.register(headerNib, forCellReuseIdentifier: "header-cell")
        homeList.register(recentlyListenNib, forCellReuseIdentifier: "recently-cell")
        homeList.register(homeSublistNib, forCellReuseIdentifier: "home-sublist-cell")
        homeList.allowsSelection = false
        homeList.dataSource = nil
        homeList.delegate = nil
    }

    private func bindTableView() {
        viewModel.items
            .bind(to: homeList.rx.items(dataSource: HomeDataSource.homeDataSource()))
                .disposed(by: disposeBag)
    }
}
