//
//  UICollectionViewExtensions.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 02/08/2022.
//

import UIKit

extension UICollectionView {
    func register<T: UICollectionViewCell>(_ type: T.Type) {
        let identifier = String(describing: type)
        self.register(UINib(nibName: identifier, bundle: .main), forCellWithReuseIdentifier: identifier)
    }
}
