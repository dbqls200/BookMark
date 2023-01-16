//
//  MyBookListView.swift
//  BookMark
//
//  Created by 김유빈 on 2023/01/13.
//

import SwiftUI

struct MyBookListView: View {
    @StateObject private var coreDataManager = CoreDataManager.shared
    @State private var showAlert: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                if !coreDataManager.savedEntities.isEmpty {
                    numberOfBooksView
                    
                    ScrollView {
                        ForEach(coreDataManager.savedEntities, id: \.self) { entity in
                            Button {
                                coreDataManager.deleteBook(book: entity)
                                HapticManager.shared.notification(type: .warning)
                            } label: {
                                    MyBookRowView(book: entity)
                                }
                        }
                    }
                } else {
                    emptyView
                }
            }
            .navigationTitle("my list title".localized())
        }
    }
    
    var emptyView: some View {
        VStack {
            HStack {
                numberOfBooksView
                Spacer()
            }
            Spacer()
            Text("no read books".localized())
            Spacer()
        }
    }
    
    var numberOfBooksView: some View {
        Text(String(format: "number of books".localized(), coreDataManager.savedEntities.count))
            .font(.system(size: 20, weight: .bold))
            .padding(.horizontal, 16)
    }
}

struct MyBookListView_Previews: PreviewProvider {
    static var previews: some View {
        MyBookListView()
    }
}
