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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath) as! BookCell
        
        let book = books[indexPath.row]
        
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


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
