//
//  ExploreViewModel.swift
//  OnlinGroceryStore
//
//  Created by Mohamed Selim on 28/01/2025.
//


import SwiftUI

struct ExploreCategoryModel: Identifiable, Equatable {
    var id: Int = 0
    var catName: String = ""
    var image: String = ""
    var color: String = ""
    
    init(dict: NSDictionary) {
        self.id = dict["cat_id"] as? Int ?? 0
        self.catName = dict["cat_name"] as? String ?? ""
        self.image = dict["image"] as? String ?? ""
        self.color = dict["color"] as? String ?? "000000"

    }
    
    static func == (lhs: ExploreCategoryModel, rhs: ExploreCategoryModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    
}


