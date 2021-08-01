//
//  FactModel.swift
//  Avocados
//
//  Created by Rami Ounifi on 1/8/2021.
//

import SwiftUI
// MARK: - Facts

struct Fact: Identifiable {
    var id = UUID()
    var image: String
    var content: String
}
