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
    @State var showAddAlert: Bool = true
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(viewModel.bookList, id: \.self) { book in
                    NavigationLink {
                        BookSearchDetailView(book: book)
                            .environmentObject(viewModel)
                    } label: {
                        BookSearchRowView(book: book)
                    }
                }
                .searchable(text: $searchKeyword, prompt: "search keyword".localized())
                .navigationTitle("search title".localized())
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
        BookSearchView(searchKeyword: "")
    }
}
