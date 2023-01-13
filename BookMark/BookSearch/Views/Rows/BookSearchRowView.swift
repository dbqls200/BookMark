//
//  BookListRowView.swift
//  BookMark
//
//  Created by 김유빈 on 2023/01/13.
//

import SwiftUI

struct BookSearchRowView: View {
    var body: some View {
        Image("backgroundRoundedRect")
            .resizable()
            .padding(8)
            .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: 150)
    }
}

struct BookListRowView_Previews: PreviewProvider {
    static var previews: some View {
        BookSearchRowView()
    }
}
