//
//  MediaImageDisplayable.swift
//  
//
//  Created by Lennart Fischer on 06.02.21.
//

import Foundation
import Nuke

public enum MediaImageDataType {
    case local(image: PlatformImage)
    case remote(request: ImageRequestConvertible)
}

public protocol MediaImageDisplayable {
    
    func data() -> MediaImageDataType
    
    func accessibilityLabel() -> String?
    
}
