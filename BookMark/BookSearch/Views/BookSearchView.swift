//
//  BookSearchView.swift
//  BookMark
//
//  Created by 김유빈 on 2023/01/12.
//

import SwiftUI

struct BookSearchView: View {
    @StateObject private var viewModel = BookSearchViewModel.shared
    @State var searchKeyword: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(viewModel.bookList, id: \.self) { book in
                    BookSearchRowView(title: book.title, author: book.author, publisher: book.publisher, imageURL: book.image)
                }
                .searchable(text: $searchKeyword, prompt: "검색어를 입력하세요")
                .navigationTitle("📚 BookMark 북마크")
            }
            .scrollDismissesKeyboard(.immediately)
            
        }
        .onChange(of: searchKeyword, perform: { _ in
            viewModel.requestSearchBookList(query: searchKeyword)
        })

    }
}

struct BookSearchView_Previews: PreviewProvider {
    static var previews: some View {
        BookSearchView(searchKeyword: "역행자")
    }
}
