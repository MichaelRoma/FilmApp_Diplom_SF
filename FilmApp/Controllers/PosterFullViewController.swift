//
//  PosterFullViewController.swift
//  FilmApp
//
//  Created by Mykhailo Romanovskyi on 13.09.2021.
//

import UIKit

class PosterFullViewController: UIViewController {
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var closeButton: UIButton!
    
    var detailIndex: Int = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        posterImageView.image = UIImage(named: testArrey[detailIndex].testPic ?? "name1")
    }
    
    @IBAction func clossedButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}


