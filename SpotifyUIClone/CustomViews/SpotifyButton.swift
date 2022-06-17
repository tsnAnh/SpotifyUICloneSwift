//
//  SpotifyPrimaryButtonn.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 27/04/2022.
//

import UIKit

@IBDesignable
final class SpotifyButton: UIButton {
    private var buttonConfiguration = UIButton.Configuration.filled()
    @IBInspectable var text: String = "Button" {
        didSet {
            self.setTitle(text, for: .normal)
        }
    }

    @IBInspectable var textColor: UIColor = .black {
        didSet {
            buttonConfiguration.baseForegroundColor = textColor
        }
    }

    @IBInspectable var color: UIColor = Colors.spotifyGreen {
        didSet {
            self.tintColor = color
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    func setup() {
        buttonConfiguration.cornerStyle = .capsule
        buttonConfiguration.baseForegroundColor = textColor
        self.configuration = buttonConfiguration
        self.tintColor = color
        self.setTitleColor(textColor, for: .normal)
        self.titleLabel?.font = Font.init(.installed(.GothamBold), size: .standard(.h4)).instance
    }
}
