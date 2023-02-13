//
//  ServiceModel.swift
//  MistriWala
//
//  Created by Bharat Silavat on 06/02/23.
//

import Foundation

struct Service: Codable {
    
    var name: String?
    var thumbnailImageUrl: String?
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.thumbnailImageUrl, forKey: .thumbnailImageUrl)
    }
    enum CodingKeys: CodingKey {
        case name
        case thumbnailImageUrl
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.thumbnailImageUrl = try container.decodeIfPresent(String.self, forKey: .thumbnailImageUrl)
    }
}
