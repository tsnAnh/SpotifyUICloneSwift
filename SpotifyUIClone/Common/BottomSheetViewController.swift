//
//  BottomSheetViewController.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 04/08/2022.
//

import UIKit
import SnapKit

class BottomSheetViewController: BaseViewController {
    
    var height: CGFloat = 350 {
        didSet {
            self.containerViewHeightConstraint = containerView.heightAnchor.constraint(equalToConstant: height)
            self.view.layoutIfNeeded()
        }
    }
    
    var containerView: UIView = UIView()
    
    private lazy var dimmedView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.6
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapDismiss(gesture:)))
        view.addGestureRecognizer(gestureRecognizer)
        return view
    }()
    
    @objc private func handleTapDismiss(gesture: UITapGestureRecognizer) {
        dismiss()
    }
    
    var containerViewHeightConstraint: NSLayoutConstraint?
    var containerViewBottomConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        setupConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animatePresentContainer()
        animateDimmedView()
    }
    
    private func setupView() {
        view.backgroundColor = .clear
    }
    
    private func setupConstraints() {
        containerView.layer.cornerRadius = 16
        containerView.clipsToBounds = true
        
        view.addSubview(dimmedView)
        view.addSubview(containerView)
        dimmedView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        dimmedView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        containerView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        containerViewHeightConstraint = containerView.heightAnchor.constraint(equalToConstant: height)
        containerViewBottomConstraint = containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: height)
        
        containerViewBottomConstraint?.isActive = true
        containerViewHeightConstraint?.isActive = true
    }
    
    private func animatePresentContainer() {
        UIView.animate(withDuration: 0.3) {
            self.containerViewBottomConstraint?.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
    private func animateDimmedView() {
        self.dimmedView.alpha = 0
        UIView.animate(withDuration: 0.3) {
            self.dimmedView.alpha = 0.6
        }
    }
    
    func dismiss() {
        UIView.animate(withDuration: 0.3) {
            self.containerViewBottomConstraint?.constant = self.height
            self.view.layoutIfNeeded()
        }
        
        UIView.animate(withDuration: 0.3) {
            self.dimmedView.alpha = 0
        } completion: { _ in
            self.dismiss(animated: false)
        }
    }
}
