//
//  MediaCollections.swift.swift
//  
//
//  Created by Lennart Fischer on 26.03.22.
//

import Foundation

/// A container type for keyed media collections
/// You can get the default or specific media collections from this container.
public struct MediaCollectionsContainer: Codable, Equatable {
    
    public let collections: [String: [Media]]
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        collections = (try? container.decode([String: [Media]].self)) ?? [:]
    }
    
    public func getMedia(for key: String = "default") -> [Media] {
        return collections[key] ?? []
    }
    
    public func getFirstMedia(for key: String = "default") -> Media? {
        return getMedia(for: key).first
    }
    
}
