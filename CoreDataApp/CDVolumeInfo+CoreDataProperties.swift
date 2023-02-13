//
//  CDVolumeInfo+CoreDataProperties.swift
//  CoreDataApp
//
//  Created by Bharat Silavat on 10/02/23.
//
//

import Foundation
import CoreData


extension CDVolumeInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDVolumeInfo> {
        return NSFetchRequest<CDVolumeInfo>(entityName: "CDVolumeInfo")
    }

    @NSManaged public var authors: String?
    @NSManaged public var pageCount: Double
    @NSManaged public var publisher: String?
    @NSManaged public var subtitle: String?
    @NSManaged public var title: String?
    @NSManaged public var volumeInfo: CDVolumeInfo?

}

extension CDVolumeInfo : Identifiable {

    @objc(addIndustryIdentifiersObject:)
    @NSManaged public func addToIndustryIdentifiers(_ value: CDIndustryIdenetifier)

    @objc(removeIndustryIdentifiersObject:)
    @NSManaged public func removeFromIndustryIdentifiers(_ value: CDIndustryIdenetifier)

    @objc(addIndustryIdentifiers:)
    @NSManaged public func addToIndustryIdentifiers(_ values: NSSet)

    @objc(removeIndustryIdentifiers:)
    @NSManaged public func removeFromIndustryIdentifiers(_ values: NSSet)

    
}
