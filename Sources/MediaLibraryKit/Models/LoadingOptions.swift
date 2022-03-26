//
//  LoadingOptions.swift
//  
//
//  Created by Lennart Fischer on 04.01.21.
//

import Foundation

public struct LoadingOptions: OptionSet {
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public static let downloadOriginal = LoadingOptions(rawValue: 1 << 0)
    public static let downloadAllConversions = LoadingOptions(rawValue: 1 << 1)
    
    public static let all: LoadingOptions = [
        .downloadOriginal, .downloadAllConversions
    ]
}
