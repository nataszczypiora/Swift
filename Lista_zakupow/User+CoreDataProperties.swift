//
//  User+CoreDataProperties.swift
//  Lista_zakupow
//
//  Created by Iga Łukiewska on 23/06/2020.
//  Copyright © 2020 Iga Łukiewska. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var zakupy: String

}
