//
//  BookSearchModel.swift
//  BookMark
//
//  Created by 김유빈 on 2023/01/12.
//

import Foundation

struct BookList: Codable {
    let total: Int
    let start: Int
    let display: Int
    let items: [Book]
}

struct Book: Codable, Hashable {
    let title: String
    let image: String
    let author: String
    let publisher: String
}
