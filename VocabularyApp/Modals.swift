//
//  Modals.swift
//  VocabularyApp
//
//  Created by Melih on 9.12.2022.
//

import Foundation

struct Result: Codable {
    let data : [ResultItem]
}

struct ResultItem: Codable {
    let title: String
    let item: [Words]
}

struct Words:Codable {
    let id : String
    let german: String
    let turkish: String
}
