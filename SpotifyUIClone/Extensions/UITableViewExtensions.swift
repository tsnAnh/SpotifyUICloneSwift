//
//  UITableViewExtensions.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 27/07/2022.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(_ type: T.Type) {
        let identifier = String(describing: type)
        self.register(UINib(nibName: identifier, bundle: .main), forCellReuseIdentifier: identifier)
    }
}
