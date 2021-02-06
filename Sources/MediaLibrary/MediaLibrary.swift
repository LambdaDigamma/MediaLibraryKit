//
//  MediaLibrary.swift
//
//
//  Created by Lennart Fischer on 04.01.21.
//

import Foundation
import Nuke

#if !os(macOS)
import UIKit
#endif

public class MediaLibrary {
    
    public static var shared: MediaLibrary = MediaLibrary()
    
    public private(set) var session: URLSession
    public private(set) var uploadEndpoint: UploadEndpoint
    
    init(session: URLSession = .shared, uploadEndpoint: UploadEndpoint = .default) {
        self.session = session
        self.uploadEndpoint = uploadEndpoint
    }
    
    #if !os(macOS)
    
    public func loadInto(_ imageView: UIImageView) {
        
//        Nuke.loadImage(with: T##ImageRequestConvertible, into: ImageDisplayingView)
        
    }
    
    #endif
    
    public func download(media: Media, loadingOptions: LoadingOptions = [.downloadOriginal]) {
        
        if loadingOptions.contains(.downloadOriginal) {
            
            
            
        }
        
        
    }
    
    
    
}

public typealias UploadEndpoint = String

public extension UploadEndpoint {
    static var `default` = "/media-library-pro/uploads"
    static var vapor = "/media-library-pro/post-s3"
}
