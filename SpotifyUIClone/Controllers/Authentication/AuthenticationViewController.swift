//
//  AuthenticationViewController.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 27/04/2022.
//

import UIKit
import RxSwift
import RxCocoa

class AuthenticationViewController: UIViewController {

    private var disposeBag = DisposeBag()

    @IBOutlet weak var btnLogin: SpotifyButton!

    fileprivate func setupButton() {
        btnLogin.rx
            .tap
            .bind(onNext: { [weak self] in
                let newVc = MainViewController()
                var vcArray = self?.navigationController?.viewControllers
                vcArray?.removeLast()
                vcArray?.append(newVc)
                if let viewControllers = vcArray {
                    self?.navigationController?.setViewControllers(viewControllers, animated: true)
                }
            })
            .disposed(by: disposeBag)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupButton()
    }
}
