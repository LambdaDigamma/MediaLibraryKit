//
//  KeyedMediaCollections.swift
//  
//
//  Created by Lennart Fischer on 04.04.23.
//

import Foundation
import AVFoundation

public struct KeyedMediaCollections: Codable, Equatable {
    
    public let collections: [String: [Media]]
    
    public init(collections: [String: [Media]] = [:]) {
        self.collections = collections
    }
    
    public init(from decoder: Decoder) throws {
        
        do {
            self.collections = try decoder.singleValueContainer().decode([String: [Media]].self)
        } catch {
            collections = [:]
        }
        
    }
    
    public func get(_ key: String) -> [Media]? {
        if let media = collections[key] {
            return media
        }
        return nil
    }
    
}
