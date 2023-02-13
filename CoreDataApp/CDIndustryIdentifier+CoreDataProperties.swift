//
//  CDIndustryIdentifier+CoreDataProperties.swift
//  CoreDataApp
//
//  Created by Bharat Silavat on 10/02/23.
//
//

import Foundation
import CoreData


extension CDIndustryIdentifier {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDIndustryIdentifier> {
        return NSFetchRequest<CDIndustryIdentifier>(entityName: "CDIndustryIdentifier")
    }

    @NSManaged public var identifier: String?
    @NSManaged public var type: String?
    @NSManaged public var industryIdentifiers: CDIndustryIdentifier?

}

extension CDIndustryIdentifier : Identifiable {

}
