//
//  AppSession.swift
//  GestureExample
//
//  Created by Bin Wang on 2017-12-07.
//  Copyright © 2017 Bin Wang. All rights reserved.
//

import UIKit

class AppSession: NSObject {
    static let shared = AppSession()
    
    var favorite = [Int]()
    var allRecords = [Record]()
    
    var favoriteRecords : [Record]{
        return allRecords.filter{self.favorite.contains($0.recordNo)}
    }
  
    override init() {
        super.init()

        let defaults = UserDefaults.standard
        self.favorite = defaults.array(forKey: "Favorite") as? [Int] ?? [Int]()
        
        var record = Record(recordNo: 1, recordDesc: "Basketball")
        allRecords.append(record)
        record = Record(recordNo: 2, recordDesc: "Soccer")
        allRecords.append(record)
        record = Record(recordNo: 3, recordDesc: "Swimming")
        allRecords.append(record)
        record = Record(recordNo: 4, recordDesc: "Hockey")
        allRecords.append(record)
        record = Record(recordNo: 5, recordDesc: "Piano")
        allRecords.append(record)
        record = Record(recordNo: 6, recordDesc: "Drawing")
        allRecords.append(record)
        record = Record(recordNo: 7, recordDesc: "Dancing")
        allRecords.append(record)
        record = Record(recordNo: 8, recordDesc: "Hiking")
        allRecords.append(record)
        record = Record(recordNo: 9, recordDesc: "Fishing")
        allRecords.append(record)
        record = Record(recordNo: 10, recordDesc: "Travel")
        allRecords.append(record)
        record = Record(recordNo: 11, recordDesc: "Video Game")
        allRecords.append(record)
    }
    
    func updateFavorite() {
        UserDefaults.standard.set(self.favorite, forKey: "Favorite")
    }

}
