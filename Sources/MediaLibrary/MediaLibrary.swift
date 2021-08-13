//
//  MediaLibrary.swift
//
//
//  Created by Lennart Fischer on 04.01.21.
//

import Foundation
import Nuke
import OSLog
import Combine

#if !os(macOS)
import UIKit
#endif

public enum DownloadError: Error {
    case noFullURL
    case resourceNotFound
    case serverError
}

public class MediaLibrary {
    
    public static var shared: MediaLibrary = MediaLibrary()
    
    public private(set) var session: URLSession
    public private(set) var uploadEndpoint: UploadEndpoint
    private let logger: Logger
    private let fileManager: FileManager
    
    init(
        session: URLSession = .shared,
        uploadEndpoint: UploadEndpoint = .default,
        logger: Logger = Logger(subsystem: "com.lambdadigamma.medialibrary", category: "MediaLibrary"),
        fileManager: FileManager = .default
    ) {
        self.session = session
        self.uploadEndpoint = uploadEndpoint
        self.logger = logger
        self.fileManager = fileManager
    }
    
    public func download(url: URL) -> AnyPublisher<String, URLError> {
        return session.downloadTaskPublisher(for: url)
            .eraseToAnyPublisher()
            .map({ (url: URL, response: URLResponse) in
                
                if let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                    let fileUrl = documents
                        .appendingPathComponent("media")
//                        .appendingPathComponent("media", isDirectory: true)
                        .appendingPathComponent((UUID().uuidString))
                    
                    try? FileManager.default.createDirectory(
                        at: documents.appendingPathComponent("media", isDirectory: true),
                        withIntermediateDirectories: true,
                        attributes: nil
                    )
                    
                    try? FileManager.default.moveItem(atPath: url.path, toPath: fileUrl.path)
                    return fileUrl.absoluteString
                }
                
                return url.absoluteString
                
            })
            .eraseToAnyPublisher()
    }
    
    public func download(
        media: Media,
        loadingOptions: LoadingOptions = [.downloadOriginal]
    ) -> AnyPublisher<String, URLError> {
        
        if let fullURL = media.fullURL {
            return session.downloadTaskPublisher(for: fullURL)
                .eraseToAnyPublisher()
                .map(\.url)
                .map(\.absoluteString)
                .eraseToAnyPublisher()
        }
        
        return Fail<String, URLError>(error: URLError(.cancelled)).eraseToAnyPublisher()
        
    }
    
    
    /// Media file structure
    ///
    /// `documents`
    ///
    public func loadFromDisk() {
        
        
        
    }
    
    private func documentDirectory() -> URL {
        return fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    /// Media file structure
    ///
    /// `documents`
    ///   `media`
    ///     `id`
    ///       `filename.extension`
    ///     `conversions`
    
}

public typealias UploadEndpoint = String

public extension UploadEndpoint {
    static var `default` = "/media-library-pro/uploads"
    static var vapor = "/media-library-pro/post-s3"
}
