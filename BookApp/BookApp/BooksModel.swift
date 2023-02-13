//
//  BooksModel.swift
//  BookApp
//
//  Created by Bharat Silavat on 07/02/23.
//

import Foundation

struct Response: Codable {
    
    var kind: String?
    var totalItems: Double?
    var items: [Book]
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.kind, forKey: .kind)
        try container.encodeIfPresent(self.totalItems, forKey: .totalItems)
        try container.encode(self.items, forKey: .items)
    }
    
    enum CodingKeys: CodingKey {
        case kind
        case totalItems
        case items
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.kind = try container.decodeIfPresent(String.self, forKey: .kind)
        self.totalItems = try container.decodeIfPresent(Double.self, forKey: .totalItems)
        self.items = try container.decode([Book].self, forKey: .items)
    }
 
}


struct Book: Codable {
    var kind: String?
    var id: String?
    var etag: String?
    var selfLink: String?
    var volumeInfo: VolumeInfo?
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.kind, forKey: .kind)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeIfPresent(self.etag, forKey: .etag)
        try container.encodeIfPresent(self.selfLink, forKey: .selfLink)
        try container.encodeIfPresent(self.volumeInfo, forKey: .volumeInfo)
        
    }
    
    enum CodingKeys: CodingKey {
        case kind
        case id
        case etag
        case selfLink
        case volumeInfo
        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.kind = try container.decodeIfPresent(String.self, forKey: .kind)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.etag = try container.decodeIfPresent(String.self, forKey: .etag)
        self.selfLink = try container.decodeIfPresent(String.self, forKey: .selfLink)
        self.volumeInfo = try container.decodeIfPresent(VolumeInfo.self, forKey: .volumeInfo)

    }
}
struct VolumeInfo: Codable{
    var title: String?
    var subtitle: String?
    var authors: [String]
    var publisher: String?
    var publishedDate: String?
    var description: String?
    var industryIdentifiers: [IndustryIdenetifier]?
    var readingModes: ReadingModes?
    var pageCount: Double?
    var printType: String?
    var categories: [String]?
    var averageRating: Double?
    var ratingsCount: Double?
    var maturityRating: String?
    var allowAnonLogging: Bool?
    var contentVersion: String?
    var panelizationSummary: panelizationSummery?
    var imageLinks: ImageLink?
    var language: String?
    var previewLink: String?
    var infoLink: String?
    var canonicalVolumeLink: String?

    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.title, forKey: .title)
        try container.encodeIfPresent(self.subtitle, forKey: .subtitle)
        try container.encode(self.authors, forKey: .authors)
        try container.encodeIfPresent(self.publisher, forKey: .publisher)
        try container.encodeIfPresent(self.publishedDate, forKey: .publishedDate)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.industryIdentifiers, forKey: .industryIdentifiers)
        try container.encodeIfPresent(self.readingModes, forKey: .readingModes)
        try container.encodeIfPresent(self.pageCount, forKey: .pageCount)
        try container.encodeIfPresent(self.printType, forKey: .printType)
        try container.encodeIfPresent(self.categories, forKey: .categories)
        try container.encodeIfPresent(self.averageRating, forKey: .averageRating)
        try container.encodeIfPresent(self.ratingsCount, forKey: .ratingsCount)
        try container.encodeIfPresent(self.maturityRating, forKey: .maturityRating)
        try container.encodeIfPresent(self.allowAnonLogging, forKey: .allowAnonLogging)
        try container.encodeIfPresent(self.contentVersion, forKey: .contentVersion)
        try container.encodeIfPresent(self.panelizationSummary, forKey: .panelizationSummary)
        try container.encodeIfPresent(self.imageLinks, forKey: .imageLinks)
        try container.encodeIfPresent(self.language, forKey: .language)
        try container.encodeIfPresent(self.previewLink, forKey: .previewLink)
        try container.encodeIfPresent(self.infoLink, forKey: .infoLink)
        try container.encodeIfPresent(self.canonicalVolumeLink, forKey: .canonicalVolumeLink)
    }
    
    enum CodingKeys: CodingKey {
        case title
        case subtitle
        case authors
        case publisher
        case publishedDate
        case description
        case industryIdentifiers
        case readingModes
        case pageCount
        case printType
        case categories
        case averageRating
        case ratingsCount
        case maturityRating
        case allowAnonLogging
        case contentVersion
        case panelizationSummary
        case imageLinks
        case language
        case previewLink
        case infoLink
        case canonicalVolumeLink
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.subtitle = try container.decodeIfPresent(String.self, forKey: .subtitle)
        self.authors = try container.decode([String].self, forKey: .authors)
        self.publisher = try container.decodeIfPresent(String.self, forKey: .publisher)
        self.publishedDate = try container.decodeIfPresent(String.self, forKey: .publishedDate)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.industryIdentifiers = try container.decodeIfPresent([IndustryIdenetifier].self, forKey: .industryIdentifiers)
        self.readingModes = try container.decodeIfPresent(ReadingModes.self, forKey: .readingModes)
        self.pageCount = try container.decodeIfPresent(Double.self, forKey: .pageCount)
        self.printType = try container.decodeIfPresent(String.self, forKey: .printType)
        self.categories = try container.decodeIfPresent([String].self, forKey: .categories)
        self.averageRating = try container.decodeIfPresent(Double.self, forKey: .averageRating)
        self.ratingsCount = try container.decodeIfPresent(Double.self, forKey: .ratingsCount)
        self.maturityRating = try container.decodeIfPresent(String.self, forKey: .maturityRating)
        self.allowAnonLogging = try container.decodeIfPresent(Bool.self, forKey: .allowAnonLogging)
        self.contentVersion = try container.decodeIfPresent(String.self, forKey: .contentVersion)
        self.panelizationSummary = try container.decodeIfPresent(panelizationSummery.self, forKey: .panelizationSummary)
        self.imageLinks = try container.decodeIfPresent(ImageLink.self, forKey: .imageLinks)
        self.language = try container.decodeIfPresent(String.self, forKey: .language)
        self.previewLink = try container.decodeIfPresent(String.self, forKey: .previewLink)
        self.infoLink = try container.decodeIfPresent(String.self, forKey: .infoLink)
        self.canonicalVolumeLink = try container.decodeIfPresent(String.self, forKey: .canonicalVolumeLink)
    }
  
}


struct ListOfferPrice: Codable{
    var amountInMicros: Double?
    var currencyCode: String?
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.amountInMicros, forKey: .amountInMicros)
        try container.encodeIfPresent(self.currencyCode, forKey: .currencyCode)
    }
    enum CodingKeys: CodingKey {
        case amountInMicros
        case currencyCode
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amountInMicros = try container.decodeIfPresent(Double.self, forKey: .amountInMicros)
        self.currencyCode = try container.decodeIfPresent(String.self, forKey: .currencyCode)
    }
    
}
struct RetailOfferPrice: Codable{
    var amountInMicros: Double?
    var currencyCode: String?
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.amountInMicros, forKey: .amountInMicros)
        try container.encodeIfPresent(self.currencyCode, forKey: .currencyCode)
    }
    enum CodingKeys: CodingKey {
        case amountInMicros
        case currencyCode
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amountInMicros = try container.decodeIfPresent(Double.self, forKey: .amountInMicros)
        self.currencyCode = try container.decodeIfPresent(String.self, forKey: .currencyCode)
    }
}


struct IndustryIdenetifier : Codable {
    var type: String?
    var identifier: String?
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.identifier, forKey: .identifier)
    }
    enum CodingKeys: CodingKey {
        case type
        case identifier
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.identifier = try container.decodeIfPresent(String.self, forKey: .identifier)
    }
}
struct ReadingModes: Codable{
    var text: Bool
    var image: Bool
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.text, forKey: .text)
        try container.encode(self.image, forKey: .image)
    }
    enum CodingKeys: CodingKey {
        case text
        case image
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.text = try container.decode(Bool.self, forKey: .text)
        self.image = try container.decode(Bool.self, forKey: .image)
    }
}
struct panelizationSummery: Codable {
    var containsEpubBubbles: Bool?
    var containsImageBubbles: Bool?
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.containsEpubBubbles, forKey: .containsEpubBubbles)
        try container.encodeIfPresent(self.containsImageBubbles, forKey: .containsImageBubbles)
    }
    enum CodingKeys: CodingKey {
        case containsEpubBubbles
        case containsImageBubbles
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.containsEpubBubbles = try container.decodeIfPresent(Bool.self, forKey: .containsEpubBubbles)
        self.containsImageBubbles = try container.decodeIfPresent(Bool.self, forKey: .containsImageBubbles)
    }
}
struct ImageLink: Codable{
    var smallThumbnail: String?
    var thumbnail: String?
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.smallThumbnail, forKey: .smallThumbnail)
        try container.encodeIfPresent(self.thumbnail, forKey: .thumbnail)
    }
    enum CodingKeys: CodingKey {
        case smallThumbnail
        case thumbnail
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.smallThumbnail = try container.decodeIfPresent(String.self, forKey: .smallThumbnail)
        self.thumbnail = try container.decodeIfPresent(String.self, forKey: .thumbnail)
    }
}

