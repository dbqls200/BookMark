//
//  BookSearchDetailView.swift
//  BookMark
//
//  Created by 김유빈 on 2023/01/16.
//

import SwiftUI

struct BookSearchDetailView: View {
    @EnvironmentObject var viewModel: BookSearchViewModel
    
    var book: Book
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                ScrollView {
                    BookSearchRowView(book: book)
                    
                    HStack {
                        Text("description".localized())
                            .font(.system(size: 24, weight: .bold))
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 4, trailing: 16))
                    
                    HStack {
                        Text(book.description)
                            .font(.system(size: 16, weight: .regular))
                            .multilineTextAlignment(.leading)
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
                        Spacer()
                    }
                }
            }
            .toolbar {
                Button("add".localized()) {
                    CoreDataManager.shared.addBook(title: book.title, image: book.image, author: book.author, publisher: book.publisher)
                    HapticManager.shared.notification(type: .success)
                }
            }
        }
    }
}

struct BookSearchDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let book: Book = Book(title: "역행자",
                              image: "https://shopping-phinf.pstatic.net/main_3255028/32550285396.20221004114149.jpg",
                              author: "자청 TEST",
                              publisher: "웅진지식하우스 TEST",
                              description: "Description TEST")
        
        BookSearchDetailView(book: book)
    }
}
