//
//  MyBookListView.swift
//  BookMark
//
//  Created by 김유빈 on 2023/01/13.
//

import SwiftUI

struct MyBookListView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                
            }
            .navigationTitle("my list title".localized())
        }
    }
}

struct MyBookListView_Previews: PreviewProvider {
    static var previews: some View {
        MyBookListView()
    }
}
