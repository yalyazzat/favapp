//
//  ViewController.swift
//  FavsApp
//
//  Created by Инара Алмагамбетова on 10.11.2024.
//

import UIKit

struct Book {
    let title: String
    let author: String
    let genre: String
    let coverImage: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let books = [
        Book(title: "The Great Gatsby", author: "F. Scott Fitzgerald", genre: "Classic", coverImage: "gatsby"),
        Book(title: "1984", author: "George Orwell", genre: "Dystopian", coverImage: "1984"),
        Book(title: "To Kill a Mockingbird", author: "Harper Lee", genre: "Fiction", coverImage: "mockingbird"),
        Book(title: "Pride and Prejudice", author: "Jane Austen", genre: "Romance", coverImage: "pride_prejudice"),
        Book(title: "Moby-Dick", author: "Herman Melville", genre: "Adventure", coverImage: "mobydick"),
        Book(title: "War and Peace", author: "Leo Tolstoy", genre: "Historical Fiction", coverImage: "war_peace"),
        Book(title: "The Catcher in the Rye", author: "J.D. Salinger", genre: "Fiction", coverImage: "catcher_rye"),
        Book(title: "The Lord of the Rings", author: "J.R.R. Tolkien", genre: "Fantasy", coverImage: "lord_of_rings"),
        Book(title: "The Hobbit", author: "J.R.R. Tolkien", genre: "Fantasy", coverImage: "hobbit"),
        Book(title: "Fahrenheit 451", author: "Ray Bradbury", genre: "Dystopian", coverImage: "fahrenheit")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self // Устанавливаем dataSource
        tableView.delegate = self // Устанавливаем delegate
    }
}
    
    extension ViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return books.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as! FavoriteTableViewCell
            let book = books[indexPath.row]
            
            cell.titleLabel.text = book.title
            cell.subtitleLabel.text = book.author
            cell.itemImageView.image = UIImage(named: book.coverImage)
            
            return cell
        }
    }

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Действия при нажатии на ячейку
        tableView.deselectRow(at: indexPath, animated: true) // Снимаем выделение
    }
}



