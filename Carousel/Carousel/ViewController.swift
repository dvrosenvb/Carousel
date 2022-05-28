//
//  ViewController.swift
//  Carousel
//
//  Created by Rosendo Vázquez on 27/05/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let tableview:UITableView={
        let table = UITableView()
        table.register(CollectionTableViewCell.self,
                       forCellReuseIdentifier: CollectionTableViewCell.identifier)
        return table
    }()
    
    private let models : [CollectionTableViewCellViewModel] = [
        CollectionTableViewCellViewModel(viewModels: [
            StickerCollectionViewCellViewModel(name: "01", backgroundColor: UIColor(red: 0.49, green: 0.93, blue: 0.91, alpha: 0)),
            StickerCollectionViewCellViewModel(name: "02", backgroundColor: UIColor(red: 0.49, green: 0.93, blue: 0.91, alpha: 0)),
            StickerCollectionViewCellViewModel(name: "03", backgroundColor: UIColor(red: 0.49, green: 0.93, blue: 0.91, alpha: 0)),
            StickerCollectionViewCellViewModel(name: "04", backgroundColor: UIColor(red: 0.49, green: 0.93, blue: 0.91, alpha: 0)),
            StickerCollectionViewCellViewModel(name: "05", backgroundColor: UIColor(red: 0.49, green: 0.93, blue: 0.91, alpha: 0)),
            StickerCollectionViewCellViewModel(name: "03", backgroundColor: UIColor(red: 0.49, green: 0.93, blue: 0.91, alpha: 0)),
            StickerCollectionViewCellViewModel(name: "04", backgroundColor: UIColor(red: 0.49, green: 0.93, blue: 0.91, alpha: 0)),
            StickerCollectionViewCellViewModel(name: "05", backgroundColor: UIColor(red: 0.49, green: 0.93, blue: 0.91, alpha: 0)),
            StickerCollectionViewCellViewModel(name: "03", backgroundColor: UIColor(red: 0.49, green: 0.93, blue: 0.91, alpha: 0)),
            StickerCollectionViewCellViewModel(name: "04", backgroundColor: UIColor(red: 0.49, green: 0.93, blue: 0.91, alpha: 0)),
            StickerCollectionViewCellViewModel(name: "05", backgroundColor: UIColor(red: 0.49, green: 0.93, blue: 0.91, alpha: 0)),
            StickerCollectionViewCellViewModel(name: "06", backgroundColor: UIColor(red: 0.49, green: 0.93, blue: 0.91, alpha: 0))
        ])
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableview)
        tableview.dataSource = self
        tableview.delegate = self
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableview.backgroundColor = UIColor(red: 0.92, green: 0.68, blue: 0.33, alpha: 1.00)
        tableview.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = models[indexPath.row]
        
        guard let cell = tableview.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as? CollectionTableViewCell else {
            fatalError()
        }
        
        cell.configure(with: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        print(indexPath.row == 0 )
        return indexPath.row == 0 ? view.frame.size.width / 2 : 20
    }
    
}

