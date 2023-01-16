//
//  BookRead+CoreDataProperties.swift
//  BookMark
//
//  Created by 김유빈 on 2023/01/14.
//
//

import Foundation
import CoreData


extension BookRead {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BookRead> {
        return NSFetchRequest<BookRead>(entityName: "BookRead")
    }

    @NSManaged public var title: String
    @NSManaged public var image: String
    @NSManaged public var author: String
    @NSManaged public var publisher: String
    @NSManaged public var read: Bool

}

extension BookRead : Identifiable {

}
