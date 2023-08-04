//
//  MyBookRowView.swift
//  BookMark
//
//  Created by 김유빈 on 2023/01/14.
//

import SwiftUI

import URLImage

struct MyBookRowView: View {
    var book: BookRead
        
    var body: some View {
        ZStack {
            Image("backBlueRoundedRect")
                .resizable()
                .padding(.horizontal, 12)
                .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: 130)
            
            HStack(spacing: 12) {
                fetchImage(url: book.image)
                                
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

struct MyBookRowView_Previews: PreviewProvider {
    static var previews: some View {
        let book: BookRead = CoreDataManager.shared.savedEntities[0]

        MyBookRowView(book: book)
    }
}
