//
//  BooksTableViewController.swift
//  BooksOfTheWeek
//
//  Created by Vladimir Zhirov on 12/14/19.
//  Copyright © 2019 Vladimir Zhirov. All rights reserved.
//

import UIKit
import Alamofire

class BooksTableViewController: UITableViewController {
    
    
    private let jsonUrl = "https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=BSQbcGQ0ccrDtyWZJQzY8gpV4sbDAP17"
    
    
    private var books: [Book] = []
    
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 110
        
        fetchWithAlamofire ()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath) as! BookCell
        
        let book = books[indexPath.row]
        cell.configure(with: book)
        
        return cell
    }
    
    
    func fetchWithAlamofire () {
        guard let url = URL(string: jsonUrl) else { return }
        
        request(url).validate().responseJSON { dataResponse in
            
            switch dataResponse.result {
            case .success(let value):
                print(value)
                guard let jsonData = value as? Array<[String : Any]> else { return }
                print (jsonData)
                
                for dictBook in jsonData {
                    let book = Book(dictBook: dictBook)
                    self.books.append(book)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            case .failure(let error):
                print(error)
            }
            
        }
        
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
