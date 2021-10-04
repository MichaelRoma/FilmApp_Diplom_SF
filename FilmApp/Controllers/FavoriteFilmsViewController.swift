//
//  FavoriteFilmsViewController.swift
//  FilmApp
//
//  Created by Mykhailo Romanovskyi on 18.08.2021.
//

import UIKit

class FavoriteFilmsViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var model = Model()
    override func viewDidLoad() {
        super.viewDidLoad()
        model.likedItems = model.showLikedItems()
        let xibCell = UINib(nibName: "FavoriteFilmCollectionViewCell", bundle: nil)
        collectionView.register(xibCell, forCellWithReuseIdentifier: "FavoriteCell")
        collectionView.reloadData()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}


//MARK: UICollectionView Delegate
extension FavoriteFilmsViewController: UICollectionViewDelegate {}

//MARK: UICollectionView DataSource
extension FavoriteFilmsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model.likedItems.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteCell", for: indexPath) as? FavoriteFilmCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.backgroundColor = .lightGray
//        cell.posterPrevieImageView.image = UIImage(named: Model().showLikedItems()[indexPath.item].testPic ?? "")
//        cell.filmTitleLable.text = Model().showLikedItems()[indexPath.item].testTitle
//        cell.ratingLabel.text = String(Model().showLikedItems()[indexPath.item].testRating ?? 0)
//        cell.realeseYearLabel.text = String(Model().showLikedItems()[indexPath.item].testYear ?? 0)
        cell.data = self.model.likedItems[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let distViewController = storyboard?.instantiateViewController(identifier: "DetailFilmViewControllerS") as? DetailFilmViewController
        else { return }
        distViewController.receiverIndex = model.likedItems[indexPath.row].id ?? 0
        navigationController?.pushViewController(distViewController, animated: true)
    }
}

