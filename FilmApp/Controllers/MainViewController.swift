//
//  ViewController.swift
//  FilmApp
//
//  Created by Mykhailo Romanovskyi on 18.08.2021.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var mainCollectionview: UICollectionView!
    @IBOutlet weak var filmSearchbar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let xibCell = UINib(nibName: "FilmCollectionViewCell", bundle: nil)
        mainCollectionview.register(xibCell, forCellWithReuseIdentifier: "filmCell")
        mainCollectionview.reloadData()
        
        mainCollectionview.delegate = self
        mainCollectionview.dataSource = self
        filmSearchbar.delegate = self
    }
}


extension MainViewController: UICollectionViewDelegate {}

extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testArrey.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filmCell", for: indexPath) as? FilmCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.posterPrevieImageView.image = UIImage(named: testArrey[indexPath.item].testPic ?? "")
        cell.filmTitleLable.text = testArrey[indexPath.item].testTitle
        cell.realeseYearLabel.text = testArrey[indexPath.item].testYear
        cell.ratingLabel.text = testArrey[indexPath.item].testRating
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let distViewController = storyboard?.instantiateViewController(identifier: "DetailFilmViewControllerS") as? DetailFilmViewController
        else { return }
        distViewController.receiverIndex = indexPath.item
        navigationController?.pushViewController(distViewController, animated: true)
    }
}

extension MainViewController: UISearchBarDelegate {}
