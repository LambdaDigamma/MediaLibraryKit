//
//  MediaDecoder.swift
//  
//
//  Created by Lennart Fischer on 04.01.21.
//

import Foundation

public class MediaDecoder: JSONDecoder {
    
    public override init() {
        super.init()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        
        self.dateDecodingStrategy = .formatted(formatter)
        
    }
    
}
