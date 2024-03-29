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
    
    public var collections: [String: [Media]]
    
    public init(collections: [String: [Media]] = [:]) {
        self.collections = collections
    }
    
    public init(from decoder: Decoder) throws {
        
        let container = try decoder.singleValueContainer()
        
        if let mediaArray = try? container.decode([Media].self), mediaArray.isEmpty {
            collections = [:]
        } else {
            collections = try container.decode([String: [Media]].self)
        }
        
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self.collections)
    }
    
    public func getMedia(for key: String = "default") -> [Media] {
        return collections[key] ?? []
    }
    
    public func getFirstMedia(for key: String = "default") -> Media? {
        return getMedia(for: key).first
    }
    
    public func allMedia() -> [Media] {
        
        return self
            .collections
            .map { $0.value }
            .reduce([], +)
        
    }
    
}
