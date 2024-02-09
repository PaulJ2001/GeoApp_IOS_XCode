//
//  Question.swift
//  GeoApp
//
//  Created by Paul James on 2023-11-30.
//

import SwiftUI

struct Question: Identifiable {
    

    let id: Int
    let countryFlag: String
    let title: String
    let answer: String
    let options: [String]
    var selected: String?
    
    
}
