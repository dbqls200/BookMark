//
//  BookSearchRowView.swift
//  BookMark
//
//  Created by 김유빈 on 2023/01/13.
//

import SwiftUI
import URLImage

struct BookSearchRowView: View {
    var title: String = ""
    var author: String = ""
    var publisher: String = ""
    var imageURL: String = ""
        
    var body: some View {
        ZStack {
            Image("backgroundRoundedRect")
                .resizable()
                .padding(.horizontal, 12)
                .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: 130)
            
            HStack(spacing: 12) {
                URLImage(url: URL(string: imageURL)!,
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
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(title)
                        .lineLimit(2)
                        .font(.system(size: 16, weight: .bold))
                    Text(author)
                        .lineLimit(1)
                        .font(.system(size: 14, weight: .semibold))
                    Text(publisher)
                        .lineLimit(1)
                        .font(.system(size: 12, weight: .thin))
                }
                .padding(.vertical, 12)
                
                Spacer()
            }
            .padding(.horizontal, 24)
        }
        .padding(.vertical, 4)
    }
}

struct BookListRowView_Previews: PreviewProvider {
    static var previews: some View {
        BookSearchRowView(title: "역행자 TEST", author: "자청 TEST", publisher: "웅진어쩌고 퍼블리셔 TEST", imageURL: "https://")
    }
}
