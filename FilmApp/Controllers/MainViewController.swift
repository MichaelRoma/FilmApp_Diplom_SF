//
//  ViewController.swift
//  FilmApp
//
//  Created by Mykhailo Romanovskyi on 18.08.2021.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var mainCollectionview: UICollectionView!
    @IBOutlet weak var sortButton: UIBarButtonItem!
    private var searchController = UISearchController()
    let model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.sortedTestArray = model.testArray
        
        let xibCell = UINib(nibName: "FilmCollectionViewCell", bundle: nil)
        mainCollectionview.register(xibCell, forCellWithReuseIdentifier: "filmCell")
        model.sortedTestArray = model.ratingSort
        mainCollectionview.reloadData()
        
        mainCollectionview.delegate = self
        mainCollectionview.dataSource = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Find your Film"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = true
    }
    @IBAction func sortingButtonPressed(_ sender: UIBarButtonItem) {
        let arrowUp = UIImage(systemName: "arrow.up")
        let arrowDown = UIImage(systemName: "arrow.down")
        model.sortAscending = !model.sortAscending
        sortButton.image = model.sortAscending ? arrowUp : arrowDown
        _ = model.ratingSort
        mainCollectionview.reloadData()
    }
}


extension MainViewController: UICollectionViewDelegate {}

extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.sortedTestArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filmCell", for: indexPath) as? FilmCollectionViewCell else {
            return UICollectionViewCell()
        }
//        cell.posterPrevieImageView.image = UIImage(named: Model().testArray[indexPath.item].testPic ?? "")
//        cell.filmTitleLable.text = Model().testArray[indexPath.item].testTitle
//        cell.realeseYearLabel.text = String(Model().testArray[indexPath.item].testYear ?? 0)
//        cell.ratingLabel.text = String(Model().testArray[indexPath.item].testRating ?? 0)
        cell.data = self.model.sortedTestArray[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let distViewController = storyboard?.instantiateViewController(identifier: "DetailFilmViewControllerS") as? DetailFilmViewController
        else { return }
        distViewController.receiverIndex = model.sortedTestArray[indexPath.row].id ?? 0
        navigationController?.pushViewController(distViewController, animated: true)
    }
}

extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        model.search(searchTextValue: searchText)
        mainCollectionview.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        model.sortedTestArray = model.testArray
        mainCollectionview.reloadData()
    }
}
