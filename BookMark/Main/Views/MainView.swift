//
//  MainView.swift
//  BookMark
//
//  Created by 김유빈 on 2023/01/13.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            BookSearchView()
                .tabItem {
                    Label("search tab".localized(), systemImage: "magnifyingglass")
                }
            
            MyBookListView()
                .tabItem {
                    Label("my list tab".localized(), systemImage: "books.vertical.fill")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
