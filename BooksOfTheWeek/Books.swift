//
//  Books.swift
//  BooksOfTheWeek
//
//  Created by Vladimir Zhirov on 12/12/19.
//  Copyright © 2019 Vladimir Zhirov. All rights reserved.
//

import Foundation

struct  BooksResponse: Decodable {
    
    var status: String?
    var copyright: String?
    var num_results: Int?
    var last_modified: String?
    var results: Results
}

struct Results: Decodable {
    var books: [Book]
    
    // НЕ используется
    var list_name:   String?
    var list_name_encoded: String?
    var bestsellers_date: String?
}

struct Book: Decodable {
    var author: String?
    var title: String?
    var description: String?
    var book_image: String?
    
    init (dictBook: [String : Any]) {
        author = dictBook["author"] as? String
        title = dictBook["title"] as? String
        description = dictBook["description"] as? String
        book_image = dictBook["book_image"] as? String
    }
}




