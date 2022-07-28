//
//  LibraryViewController.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 08/05/2022.
//

import UIKit

class LibraryViewController: BaseViewController {
    
    @IBOutlet private weak var libraryTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    private func setupTableView() {
        libraryTableView.register(LibraryHeaderTableViewCell.self)
    }
}
