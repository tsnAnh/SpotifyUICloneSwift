//
//  BaseViewController.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 11/05/2022.
//

import UIKit
import RxSwift

class BaseViewController: UIViewController {
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.backgroundColor
        
        hideKeyboardWhenTapOutside()
    }
    
    private func hideKeyboardWhenTapOutside() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(onTappedOutside))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    @objc private func onTappedOutside() {
        view.endEditing(true)
    }
}
