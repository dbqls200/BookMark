//
//  BookSearchRowView.swift
//  BookMark
//
//  Created by 김유빈 on 2023/01/13.
//

import SwiftUI
import URLImage

struct BookSearchRowView: View {
    var book: Book
        
    var body: some View {
        ZStack {
            Image("backYellowRoundedRect")
                .resizable()
                .padding(.horizontal, 12)
                .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: 130)
            
            HStack(spacing: 12) {
                createImage(url: book.image)
                                
                VStack(alignment: .leading, spacing: 8) {
                    Text(book.title)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 16, weight: .bold))
                    
                    Text(book.author)
                        .lineLimit(1)
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text(book.publisher)
                        .lineLimit(1)
                        .font(.system(size: 12, weight: .thin))
                }
                .foregroundColor(.black)
                
                Spacer()
            }
            .padding(.horizontal, 24)
        }
        .padding(.vertical, 4)
    }
}

func createImage(url: String) -> some View {
    URLImage(url: URL(string: url)!,
             inProgress: { progress in
                ProgressView()
                    .progressViewStyle(.circular)
                    .frame(width: 75, height: 105) },
             failure: { error,retry in
                Rectangle()
                    .foregroundColor(.lightGray)
                    .frame(width: 75, height: 105)
                    .overlay(content: {
                        Text("sorry".localized())
                            .foregroundColor(.white)
                            .font(.system(size: 12, weight: .semibold))
                    }) },
             content: { image in
                image
                    .resizable()
                    .frame(width: 75, height: 105)
            })

}

struct BookListRowView_Previews: PreviewProvider {
    static var previews: some View {
        let book: Book = Book(title: "역행자",
                              image: "https://shopping-phinf.pstatic.net/main_3255028/32550285396.20221004114149.jpg",
                              author: "자청 TEST",
                              publisher: "웅진지식하우스 TEST",
                              description: "Description TEST")
        
        BookSearchRowView(book: book)
    }
}
