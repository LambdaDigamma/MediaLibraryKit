//
//  RemoteMediaImage.swift
//  
//
//  Created by Lennart Fischer on 11.04.21.
//

import Foundation
import CoreGraphics
import Nuke

public struct RemoteMediaImage: MediaImageDisplayable {
    
    public let request: ImageRequestConvertible
    public let label: String?
    
    public init(request: ImageRequestConvertible, label: String? = nil) {
        self.request = request
        self.label = label
    }
    
    public func data(width: CGFloat) -> MediaImageDataType {
        return .remote(request: request)
    }
    
    public func accessibilityLabel() -> String? {
        return label
    }
    
//    public static func == (lhs: RemoteMediaImage, rhs: RemoteMediaImage) -> Bool {
//        return lhs.label == rhs.label
//            && lhs.request.asImageRequest().urlRequest.url == rhs.request.asImageRequest().urlRequest.url
//    }
//
//    public func hash(into hasher: inout Hasher) {
//        hasher.combine(label)
//        hasher.combine(request.asImageRequest().urlRequest.url)
//    }
    
}
