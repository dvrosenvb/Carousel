//
//  CollectionTableViewCell.swift
//  Carousel
//
//  Created by Rosendo Vázquez on 27/05/22.
//

import UIKit

struct CollectionTableViewCellViewModel {
    let viewModels:[StickerCollectionViewCellViewModel]
}

class CollectionTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
   
   static let identifier = "CollectionTableViewCell"
    
    private var viewModel : [StickerCollectionViewCellViewModel] = []
    
    private let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(
            StickerCollectionViewCell.self,
            forCellWithReuseIdentifier: StickerCollectionViewCell.identifier)
        return collectionView
    }()
    
    //MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(red: 0.92, green: 0.68, blue: 0.33, alpha: 1.00)
        collectionView.backgroundColor = UIColor(red: 0.92, green: 0.68, blue: 0.33, alpha: 1.00)
        contentView.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.frame
    }
    
    //MARK: CollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: StickerCollectionViewCell.identifier,
            for: indexPath) as? StickerCollectionViewCell else { fatalError() }
        cell.configure(with: viewModel[indexPath.row])
        return cell
    }
    
    func configure(with viewModel:CollectionTableViewCellViewModel){
        self.viewModel = viewModel.viewModels
        collectionView.reloadData()
    }
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size:CGFloat = contentView.frame.size.width / 3
        return CGSize(width: size, height: size)
    }

}
