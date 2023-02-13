//
//  CoreDataController.swift
//  CoreDataApp
//
//  Created by Bharat Silavat on 10/02/23.
//

import Foundation
// Import Core Data First -
import CoreData

//
//  CoreDataManager.swift
//  CoreDataDemo
//
//  Created by Amit Ninawe on 10/02/23.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreDataDemo")
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    private func save() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func save(volumeInfo: VolumeInfo?) -> Bool {
        guard let volumeInfo = volumeInfo else {return false}
        let cdVolumeInfo = CDVolumeInfo(context: persistentContainer.viewContext)
        cdVolumeInfo.title = volumeInfo.title
        cdVolumeInfo.authors = volumeInfo.authors.joined(separator: ",")
        cdVolumeInfo.pageCount = volumeInfo.pageCount ?? 0.0
        cdVolumeInfo.subtitle = volumeInfo.subtitle
        cdVolumeInfo.publisher = volumeInfo.publisher
        
        if let indusIdentifiers = volumeInfo.industryIdentifiers {
            for item in indusIdentifiers {
                let cdIndustryID = CDIndustryIdentifier(context: persistentContainer.viewContext)
                cdIndustryID.identifier = item.identifier
                cdIndustryID.type = item.type
                cdVolumeInfo.addToIndustryIdentifiers(cdIndustryID)
            }
        }
        return true
    }
    
    private func fetchData(by predicate: NSPredicate?) -> [CDVolumeInfo]? {
        let fetchRequest: NSFetchRequest<CDVolumeInfo> = CDVolumeInfo.fetchRequest()
        fetchRequest.predicate = predicate
        do {
            let books = try persistentContainer.viewContext.fetch(fetchRequest)
            return books
        } catch let error {
            print(error)
        }
        return nil
    }
    
    func searchBook(by text: String) -> [CDVolumeInfo] {
        let predicate1 = NSPredicate(format: "title CONTAINS[c] %@ ", text)
        let predicate2 = NSPredicate(format: "subtitle CONTAINS[c] %@ ", text)
        let predicate = NSCompoundPredicate(orPredicateWithSubpredicates: [predicate1, predicate2])
        if let bookArray = self.fetchData(by: predicate) {
            return bookArray
        }
        return []
    }
    
    func fetchAllBooks() -> [CDVolumeInfo] {
        if let bookArray = self.fetchData(by: nil) {
            return bookArray
        }
        return []
    }
    
}
