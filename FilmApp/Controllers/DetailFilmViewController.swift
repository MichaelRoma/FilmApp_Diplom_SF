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
    
    var model = Model()
    
    var receiverIndex: Int = Int()
    
    var cameFromFav: Bool = Bool()
    
    var transition: RoundingTransiction = RoundingTransiction()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        if cameFromFav {
            posterImageView.image = UIImage(named: Model().showLikedItems()[receiverIndex].testPic ?? "image1")
            filmTitleLabel.text = Model().showLikedItems()[receiverIndex].testTitle
            releaseYearLabel.text = String(Model().showLikedItems()[receiverIndex].testYear ?? 0)
            ratingLabel.text = String(Model().showLikedItems()[receiverIndex].testRating ?? 0)
        } else {
            posterImageView.image = UIImage(named: Model().testArray[receiverIndex].testPic ?? "image1")
            filmTitleLabel.text = Model().testArray[receiverIndex].testTitle
            releaseYearLabel.text = String(Model().testArray[receiverIndex].testYear ?? 0)
            ratingLabel.text = String(Model().testArray[receiverIndex].testRating ?? 0)
        }
        
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart"),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(likeButtonAction))
        if model.testArray[receiverIndex].isLiked == true {
            let heart = UIImage(systemName: "heart.fill")
            navigationItem.rightBarButtonItem?.image = heart
        } else {
            let heart = UIImage(systemName: "heart")
            navigationItem.rightBarButtonItem?.image = heart
        }
    }
    
    @objc private func likeButtonAction() {
        
        print("Like")
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
