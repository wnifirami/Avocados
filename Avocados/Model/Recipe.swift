//
//  Recipe.swift
//  Avocados
//
//  Created by Rami Ounifi on 3/8/2021.
//

import SwiftUI
// MARK: - Recipe Model

struct Recipe: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var image: String
    var rating: Int
    var serves: Int
    var preparation: Int
    var cooking: Int
    var instructions: [String]
    var ingredients: [String]
    
}
