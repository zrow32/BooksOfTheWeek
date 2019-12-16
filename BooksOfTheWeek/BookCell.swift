//
//  BookCell.swift
//  BooksOfTheWeek
//
//  Created by Vladimir Zhirov on 12/16/19.
//  Copyright © 2019 Vladimir Zhirov. All rights reserved.
//

import UIKit

class BookCell: UITableViewCell {

    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    func configureCell(with book: Book) {
        authorLabel.text = book.author ?? "No author name"
        titleLabel.text = book.title ?? "No title"
    }
}
