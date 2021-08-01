//
//  HeaderModel.swift
//  Avocados
//
//  Created by Rami Ounifi on 1/8/2021.
//

import SwiftUI

// MARK: - header model

struct Header: Identifiable {
    var id = UUID()
    var image, headline, subheadline: String
    
}
