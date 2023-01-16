//
//  CoreDataManager.swift
//  BookMark
//
//  Created by 김유빈 on 2023/01/14.
//

import CoreData

class CoreDataManager: ObservableObject {
    let container: NSPersistentContainer
    static let shared = CoreDataManager()

    @Published var savedEntities = [BookRead]()
    
    init() {
        container = NSPersistentContainer(name: "BookModel")
        container.loadPersistentStores { description, error in
            if let error = error { print("❌ ERROR LOADING CORE DATA :: \(error)") }
        }
        fetchBooks()
    }
    
    func fetchBooks() {
        let request = NSFetchRequest<BookRead>(entityName: "BookRead")
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch {
            print("❌ FETCHING CORE DATA :: ERROR")
        }
    }
    
    func addBook(title: String, image: String, author: String, publisher: String) {
        let book = BookRead(context: container.viewContext)
        book.title = title
        book.image = image
        book.author = author
        book.publisher = publisher
        saveData()
    }
    
    func deleteBook(book: BookRead) {
        container.viewContext.delete(book)
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchBooks()
        } catch {
            print("❌ SAVING CORE DATA :: ERROR")
        }
    }
    
    func updateBook(entity: BookRead, title: String, image: String, author: String, publisher: String) {
        entity.title = title
        entity.image = image
        entity.author = author
        entity.publisher = publisher
        saveData()
    }
}
