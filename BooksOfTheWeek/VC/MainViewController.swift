//
//  MainViewController.swift
//  BooksOfTheWeek
//
//  Created by Vladimir Zhirov on 12/12/19.
//  Copyright © 2019 Vladimir Zhirov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var nytImageView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let booksVC = segue.destination as! BooksTableViewController
        //     booksVC.fetchData()  commented b/c Alamofire code
        
    }
    
    @IBAction func booksButtonTapped() {
        performSegue(withIdentifier: "goToBooks", sender: nil)
    }
}
