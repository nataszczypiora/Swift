//
//  PersistanceMenager.swift
//  Lista_zakupow
//
//  Created by Iga Łukiewska on 23/06/2020.
//  Copyright © 2020 Iga Łukiewska. All rights reserved.
//

import Foundation
import CoreData

final class PersistanceMenager
{
    public init() {}
    static let shared = PersistanceMenager()
    
    lazy var persistentContainer: NSPersistentContainer = {
          let container = NSPersistentContainer(name: "Lista_zakupow")
          container.loadPersistentStores(completionHandler: { (storeDescription, error) in
              if let error = error as NSError? {
                  fatalError("Unresolved error \(error), \(error.userInfo)")
              }
          })
          return container
      }()
    lazy var context = persistentContainer.viewContext
    func save()
    {
        if context.hasChanges {
            do {
                try context.save()
                print("saved successfully")
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetch<T: NSManagedObject>(_ objectType: T.Type) -> [T]
    {
        let entityName = String(describing: objectType)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        do{
            let fetchedObjects = try context.fetch(fetchRequest) as?[T]
            return fetchedObjects ?? [T]()
        }catch {
            print(error)
            return [T]()
        }
    }
    
}
