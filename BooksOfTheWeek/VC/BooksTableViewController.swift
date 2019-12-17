//
//  BooksTableViewController.swift
//  BooksOfTheWeek
//
//  Created by Vladimir Zhirov on 12/14/19.
//  Copyright © 2019 Vladimir Zhirov. All rights reserved.
//

import UIKit

class BooksTableViewController: UITableViewController {
    
    
    private let jsonUrl = "https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=BSQbcGQ0ccrDtyWZJQzY8gpV4sbDAP17"
    
    
    private var books: [Book] = []
    
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 110
        
        fetchData()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath) as! BookCell
        
        let book = books[indexPath.row]
        cell.configure(with: book)
        
        //  cell.textLabel?.text = "Hey"
        //books[indexPath.row].title// Configure the cell...
        
        return cell
    }
    
    
    func fetchData() {
        
        guard let url = URL(string: jsonUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            
            do {
                let jsonResult =  try JSONDecoder().decode(BooksResponse.self, from: data)
                
                self.books = jsonResult.results.books
                for book in self.books {
                    print(book.author ?? "No author")
                    print(book.title ?? "No title")
                    print(book.description ?? "No description")
                    print(book.book_image ?? "")
                    print("---")
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            } catch let error {
                print (error.localizedDescription)
            }
        }.resume()
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("---")
        print("This cell # \(indexPath.row) was tapped")
        let bookAuthor = books[indexPath.row].author
        print(bookAuthor!)
        
        index = indexPath.row
        
        performSegue(withIdentifier: "goToDetails", sender: self)
    }
    
    //  MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! DetailBookViewController
        //       detailVC.image = books_image
        detailVC.author = books[index].author ?? "Unknown author"
        detailVC.bookTitle = books[index].title ?? "No title"
        detailVC.text = books[index].description ?? ""
    }
}
