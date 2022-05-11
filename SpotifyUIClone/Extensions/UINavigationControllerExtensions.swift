//
//  UINavigationControllerExtensions.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 08/05/2022.
//

import UIKit

extension UINavigationController {
    func popAndPush(vc: UIViewController, animated: Bool) {
        var vcArray = navigationController?.viewControllers
        vcArray?.removeLast()
        vcArray?.append(vc)
        if let viewControllers = vcArray {
            self.navigationController?.setViewControllers(viewControllers, animated: true)
        }
    }
}
