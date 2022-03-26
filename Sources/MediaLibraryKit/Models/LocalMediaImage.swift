//
//  LocalImage.swift
//  
//
//  Created by Lennart Fischer on 06.02.21.
//

import Foundation
import CoreGraphics
import Nuke

public struct LocalMediaImage: MediaImageDisplayable {
    
    public let image: PlatformImage
    public let label: String?
    
    public init(image: PlatformImage, label: String? = nil) {
        self.image = image
        self.label = label
    }
    
    public init(imageName: String, label: String? = nil) {
        self.init(image: PlatformImage(named: imageName) ?? PlatformImage(), label: label)
    }
    
    public func data(width: CGFloat) -> MediaImageDataType {
        return .local(image: image)
    }
    
    public func accessibilityLabel() -> String? {
        return label
    }
    
}
