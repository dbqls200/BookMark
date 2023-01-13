//
//  BookSearchView.swift
//  BookMark
//
//  Created by 김유빈 on 2023/01/12.
//

import SwiftUI

struct BookSearchView: View {
    @StateObject private var viewModel = BookSearchViewModel.shared
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(viewModel.bookList, id: \.self) { book in
                    BookSearchRowView(title: book.title, author: book.author, publisher: book.publisher, imageURL: book.image)
                }
                .navigationTitle("📚 BookMark 북마크")
            }
        }
        .onAppear {
            viewModel.requestSearchBookList()
        }

    }
}

struct BookSearchView_Previews: PreviewProvider {
    static var previews: some View {
        BookSearchView()
    }
}
