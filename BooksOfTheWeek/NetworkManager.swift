//
//  NetworkManager.swift
//  BooksOfTheWeek
//
//  Created by Vladimir Zhirov on 12/16/19.
//  Copyright © 2019 Vladimir Zhirov. All rights reserved.
//

import Foundation

class NetworkManager {
    
//    private let jsonUrl = "https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=BSQbcGQ0ccrDtyWZJQzY8gpV4sbDAP17"
//
//    func fetchData() {
//
//        guard let url = URL(string: jsonUrl) else { return }
//
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//
//            guard let data = data else { return }
//            
//            do {
//                let jsonResult =  try JSONDecoder().decode(BooksResponse.self, from: data)
//
//                  self.books = jsonResult.results.books
//                for book in self.books {
//                    print(book.author ?? "No author")
//                    print(book.title ?? "No title")
//                    print(book.description ?? "No description")
//                    print(book.book_image ?? "")
//                    print("---")
//                    DispatchQueue.main.async {
//                        self.tableView.reloadData()
//                    }
//                }
//            } catch let error {
//                print (error.localizedDescription)
//            }
//        }.resume()
//    }
}
