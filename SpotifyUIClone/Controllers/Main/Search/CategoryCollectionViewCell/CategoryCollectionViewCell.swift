//
//  CategoryCollectionViewCell.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 19/06/2022.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var categoryName: UILabel!
    @IBOutlet private weak var categoryImage: UIImageView!
    
    static func cellIdentifier() -> String {
        String(describing: Self.self)
    }
    
    var viewModel: CategoryItemViewModel! {
        didSet {
            configureCell()
            setNeedsLayout()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentView.layer.cornerRadius = 8
        self.contentView.layer.backgroundColor = getRandomColor().cgColor
    }
    
    private func configureCell() {
        categoryName.text = viewModel.categoryName
        categoryImage.kf.setImage(with: URL(string: viewModel.imageUrl))
        categoryImage.transform = categoryImage.transform.rotated(by: Double.pi / 6)
        categoryImage.transform = categoryImage.transform.translatedBy(x: 8, y: 12)
        categoryImage.transform = categoryImage.transform.scaledBy(x: 0.8, y: 0.8)
    }
    
    private func getRandomColor() -> UIColor {
        //Generate between 0 to 1
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
}
