//
//  MediaImageDisplayable.swift
//  
//
//  Created by Lennart Fischer on 06.02.21.
//

import Foundation
import CoreGraphics
import Nuke

public enum MediaImageDataType {
    case local(image: PlatformImage)
    case remote(request: ImageRequestConvertible)
}

public protocol MediaImageDisplayable {
    
    func data(width: CGFloat) -> MediaImageDataType
    
//    func aspectRatio(for width: CGFloat) -> CGFloat
    
    func accessibilityLabel() -> String?
    
}
