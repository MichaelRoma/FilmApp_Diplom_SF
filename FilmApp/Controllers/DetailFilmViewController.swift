//
//  DetailFilmViewController.swift
//  FilmApp
//
//  Created by Mykhailo Romanovskyi on 18.08.2021.
//

import UIKit

class DetailFilmViewController: UIViewController, UIViewControllerTransitioningDelegate {
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var filmTitleLabel: UILabel!
    @IBOutlet weak var releaseYearLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var receiverIndex: Int = Int()
    
    var transition: RoundingTransiction = RoundingTransiction()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        posterImageView.image = UIImage(named: testArrey[receiverIndex].testPic ?? "image1")
        filmTitleLabel.text = testArrey[receiverIndex].testTitle
        releaseYearLabel.text = testArrey[receiverIndex].testYear
        ratingLabel.text = testArrey[receiverIndex].testRating
    }
    
    
    @IBAction func tapGestureAction(_ sender: UITapGestureRecognizer) {
        print("Hello")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destVC = segue.destination  as? PosterFullViewController else {
            return
        }
        destVC.detailIndex = receiverIndex
        destVC.transitioningDelegate = self
        destVC.modalPresentationStyle = .custom
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionProfile = .cancel
      //  transition.start = posterImageView.center
        transition.start = CGPoint(x: posterImageView.center.x, y: posterImageView.center.y + 70)
        transition.roundColor = UIColor.lightGray
        return transition
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionProfile = .show
        transition.start = CGPoint(x: posterImageView.center.x, y: posterImageView.center.y + 70)
      //  transition.start = posterImageView.center
        transition.roundColor = UIColor.lightGray
        return transition
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
