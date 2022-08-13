//
//  Chip.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 02/08/2022.
//

import UIKit

@IBDesignable
final class Chip: UILabel {
    @IBInspectable
    var borderColor: UIColor = .green {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat = 1.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView() {
        layer.cornerRadius = frame.height / 2
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        layer.backgroundColor = UIColor.clear.cgColor
    }
    
    @IBInspectable
    var edgeInset: UIEdgeInsets = .init(top: 8, left: 16, bottom: 8, right: 16) {
        didSet {
            layoutIfNeeded()
        }
    }
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: edgeInset.top, left: edgeInset.left, bottom: edgeInset.bottom, right: edgeInset.right)
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + edgeInset.left + edgeInset.right, height: size.height + edgeInset.top + edgeInset.bottom)
    }
}
