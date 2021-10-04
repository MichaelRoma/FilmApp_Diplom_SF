//
//  FavoriteFilmCollectionViewCell.swift
//  FilmApp
//
//  Created by Mykhailo Romanovskyi on 03.10.2021.
//

import UIKit

class FavoriteFilmCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var posterPrevieImageView: UIImageView!
    @IBOutlet weak var filmTitleLable: UILabel!
    @IBOutlet weak var  realeseYearLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    var data: Item? {
        didSet {
            guard data != nil else { return }
            posterPrevieImageView.image = UIImage(named: data?.testPic ?? "image1")
            filmTitleLable.text = data?.testTitle
            realeseYearLabel.text = String(data?.testYear ?? 0)
            ratingLabel.text = String(data?.testRating ?? 0)
        }
    }
}
