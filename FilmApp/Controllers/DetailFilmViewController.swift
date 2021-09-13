//
//  DetailFilmViewController.swift
//  FilmApp
//
//  Created by Mykhailo Romanovskyi on 18.08.2021.
//

import UIKit

class DetailFilmViewController: UIViewController {
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var filmTitleLabel: UILabel!
    @IBOutlet weak var releaseYearLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    @IBAction func tapGestureAction(_ sender: UITapGestureRecognizer) {
        print("Hello")
    }
}


// MARK: - UICollectionViewDelegate
extension DetailFilmViewController: UICollectionViewDelegate {}

// MARK: - UICollectionViewDataSource
extension DetailFilmViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailCell", for: indexPath) as? GaleryCollectionViewCell else { return UICollectionViewCell() }
        cell.imageView.backgroundColor = .yellow
        return cell
    }
}
