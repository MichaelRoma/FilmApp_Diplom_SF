//
//  JsonModel.swift
//  FilmApp
//
//  Created by Mykhailo Romanovskyi on 18.08.2021.
//

import Foundation

struct JSONModel: Codable {
    let original_title: String?
    let poster_path: String?
    let release_date: String?
    let overview: String?
    let vote_average: Double?
    let backdrop_path: String?
}

class TestModel {
    var testPic: String?
    var testTitle: String?
    var testYear: String?
    var testRating: String?
    
    init(testPic: String?, testTitle: String?, testYear: String?, testRating: String?) {
        self.testPic = testPic
        self.testTitle = testTitle
        self.testYear = testYear
        self.testRating = testRating
    }
}

var testArrey: [TestModel] = [
    TestModel(testPic: "image1", testTitle: "Film 1", testYear: "2001", testRating: "4.0"),
    TestModel(testPic: "image2", testTitle: "Film 2", testYear: "2031", testRating: "4.7"),
    TestModel(testPic: "image3", testTitle: "Film 3", testYear: "2008", testRating: "7.0"),
    TestModel(testPic: "image4", testTitle: "Film 4", testYear: "2005", testRating: "8.0"),
    TestModel(testPic: "image5", testTitle: "Film 5", testYear: "2005", testRating: "4.3"),
    TestModel(testPic: "image6", testTitle: "Film 6", testYear: "2004", testRating: "3.9"),
    TestModel(testPic: "image7", testTitle: "Film 7", testYear: "2008", testRating: "2.0"),
    TestModel(testPic: "image8", testTitle: "Film 8", testYear: "2005", testRating: "1.0"),
    TestModel(testPic: "image9", testTitle: "Film 9", testYear: "2004", testRating: "7.0"),
    TestModel(testPic: "image10", testTitle: "Film 10", testYear: "2031", testRating: "9.9"),
    TestModel(testPic: "image11", testTitle: "Film 11", testYear: "2041", testRating: "5.1"),
    TestModel(testPic: "image12", testTitle: "Film 12", testYear: "2015", testRating: "7.2"),
    TestModel(testPic: "image13", testTitle: "Film 13", testYear: "2013", testRating: "8.3"),
    TestModel(testPic: "image14", testTitle: "Film 14", testYear: "2012", testRating: "3.4"),
    TestModel(testPic: "image15", testTitle: "Film 15", testYear: "2011", testRating: "4.7"),
]
