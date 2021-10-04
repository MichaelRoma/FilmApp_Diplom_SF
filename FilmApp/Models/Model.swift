//
//  Model.swift
//  FilmApp
//
//  Created by Mykhailo Romanovskyi on 03.10.2021.
//

import Foundation

class Item {
    var id: Int?
    var testPic: String?
    var testTitle: String?
    var testYear: Int?
    var testRating: Double?
    var isLiked: Bool?
    
    init( id: Int?, testPic: String?, testTitle: String?, testYear: Int?, testRating: Double?, isLiked: Bool?) {
        self.id = id
        self.testPic = testPic
        self.testTitle = testTitle
        self.testYear = testYear
        self.testRating = testRating
        self.isLiked = isLiked
    }
}

class Model {
    var testArray: [Item] = [
        Item(id: 0, testPic: "image1", testTitle: "Film 1", testYear: 2001, testRating: 4.0, isLiked: true),
        Item(id: 1, testPic: "image2", testTitle: "Film 2", testYear: 2031, testRating: 4.7, isLiked: false),
        Item(id: 2, testPic: "image3", testTitle: "Film 3", testYear: 2008, testRating: 7.0, isLiked: false),
        Item(id: 3, testPic: "image4", testTitle: "Film 4", testYear: 2005, testRating: 8.0, isLiked: false),
        Item(id: 4, testPic: "image5", testTitle: "Film 5", testYear: 2005, testRating: 4.3, isLiked: true),
        Item(id: 5, testPic: "image6", testTitle: "Film 6", testYear: 2004, testRating: 3.9, isLiked: false),
        Item(id: 6, testPic: "image7", testTitle: "Film 7", testYear: 2008, testRating: 2.0, isLiked: true),
        Item(id: 7, testPic: "image8", testTitle: "Film 8", testYear: 2005, testRating: 1.0, isLiked: false),
        Item(id: 8, testPic: "image9", testTitle: "Film 9", testYear: 2004, testRating: 7.0, isLiked: false),
        Item(id: 9, testPic: "image10", testTitle: "Film 10", testYear: 2031, testRating: 9.9, isLiked: true),
        Item(id: 10, testPic: "image11", testTitle: "Film 11", testYear: 2041, testRating: 5.1, isLiked: true),
        Item(id: 11, testPic: "image12", testTitle: "Film 12", testYear: 2015, testRating: 7.2, isLiked: false),
        Item(id: 12, testPic: "image13", testTitle: "Film 13", testYear: 2013, testRating: 8.3, isLiked: true),
        Item(id: 13, testPic: "image14", testTitle: "Film 14", testYear: 2012, testRating: 3.4, isLiked: true),
        Item(id: 14, testPic: "image15", testTitle: "Film 15", testYear: 2011, testRating: 4.7, isLiked: false),
    ]
    var sortAscending: Bool = true
    var likedItems: [Item] = []
    var sortedTestArray: [Item] = []
//    var likedItems: [Item]{
//        var testlikedItems = [Item]()
//        for i in testArray {
//            if i.isLiked == true {
//                testlikedItems.append(i)
//            }
//        }
//        return testlikedItems
//    }
    var ratingSort: [Item] {
        testArray.sort {
            sortAscending ? ($0.testRating ?? 0) < ($1.testRating ?? 0) : ($0.testRating ?? 0) > ($1.testRating ?? 0)
        }
        sortedTestArray = testArray
        return sortedTestArray
    }
    func showLikedItems() -> [Item] {
        
        for i in testArray {
            if i.isLiked == true {
                likedItems.append(i)
            }
        }
        return likedItems
    }
    
    func search(searchTextValue: String) {
        sortedTestArray = []
        if searchTextValue == "" {
            sortedTestArray = testArray
        } else {
            for item in testArray {
                guard let searchItemTitle = item.testTitle else { return }
                if searchItemTitle.contains(searchTextValue) {
                    sortedTestArray.append(item)
                }
            }
        }
        sortedTestArray = testArray.filter({
            $0.testTitle?.range(of: searchTextValue, options: .caseInsensitive) != nil
        })
    }
}
