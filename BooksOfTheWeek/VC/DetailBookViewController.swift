//
//  DetailBookViewController.swift
//  BooksOfTheWeek
//
//  Created by Vladimir Zhirov on 12/16/19.
//  Copyright © 2019 Vladimir Zhirov. All rights reserved.
//

import UIKit

class DetailBookViewController: UIViewController {

    var image: UIImage?
    var author: String = ""
    var bookTitle: String?
    var text: String = ""
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var authorNamelabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bookImage.image = image
        authorNamelabel.text = author
        titleLabel.text = bookTitle
        descriptionLabel.text = text
        // Do any additional setup after loading the view.
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
