//
//  StickerCollectionViewCell.swift
//  Carousel
//
//  Created by Rosendo Vázquez on 27/05/22.
//

import UIKit

struct StickerCollectionViewCellViewModel {
    let name:String
    let backgroundColor:UIColor
}


class StickerCollectionViewCell: UICollectionViewCell {
    static let identifier = "StickerCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        contentView.backgroundColor = UIColor(red: 0.49, green: 0.93, blue: 0.91, alpha: 1.00)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    func configure(with viewModel:StickerCollectionViewCellViewModel){
        contentView.layer.cornerRadius = 50
        contentView.backgroundColor = viewModel.backgroundColor
        let img = UIImageView(image: UIImage(named: viewModel.name))
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.masksToBounds = true
        contentView.addSubview(img)
        img.frame = contentView.bounds
    }
}
