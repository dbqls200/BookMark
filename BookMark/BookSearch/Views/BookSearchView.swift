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
    @State var showAddAlert: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(viewModel.bookList, id: \.self) { book in
                    Button {
                        self.showAddAlert.toggle()
                    } label: {
                        BookSearchRowView(book: book)
                    }
                    .alert("add alert".localized(), isPresented: $showAddAlert) {
                        
                        Button("add".localized(), role: .none) {
                            // 1/14 Add 누르면 my list에 추가 기능 추후 작업

                        }

                        Button("cancel".localized(), role: .cancel, action: { })
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
