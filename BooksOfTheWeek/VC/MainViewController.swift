//
//  MainViewController.swift
//  BooksOfTheWeek
//
//  Created by Vladimir Zhirov on 12/12/19.
//  Copyright © 2019 Vladimir Zhirov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    
    private let jsonUrl = "https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=BSQbcGQ0ccrDtyWZJQzY8gpV4sbDAP17"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = URL(string: jsonUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            //     print("@@", data, response)
            guard let data = data else { return }
            
            do {
                let jsonResult =  try JSONDecoder().decode(BooksResponse.self, from: data)
                
                let books = jsonResult.results.books
                for book in books {
                    print(book.author ?? "No author")
                    print(book.title ?? "No title")
                    print(book.description ?? "No description")
                    print(book.book_image ?? "")
                    print("---")
                }
            } catch let error {
                print (error.localizedDescription)
            }
        }.resume()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
