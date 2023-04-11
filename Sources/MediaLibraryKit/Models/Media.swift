//
//  Media.swift
//  
//
//  Created by Lennart Fischer on 04.01.21.
//

import Foundation
import Nuke
import CoreGraphics
import SwiftUI

public protocol BaseMedia: Codable, Equatable {
    
//    func getImage(width: CGFloat, height: CGFloat, callback: ((PlatformImage) -> Void))
    
}

public struct Media: BaseMedia, Equatable, MediaImageDisplayable, Hashable, Identifiable {
    
    public var id: Int
    public var modelType: String
    public var modelID: Int
    public var uuid: UUID?
    public var collectionName: String
    public var name: String
    public var fileName: String
    public var mimeType: MimeType?
    public var disk: String
    public var conversionsDisk: String?
//    public var responsiveImages: ResponsiveImages?
    public var size: Int
    public var order: Int?
    public var alt: String?
    public var caption: String?
    public var credits: String?
    public var responsiveWidth: Int?
    public var responsiveHeight: Int?
    public var createdAt: Date? = Date()
    public var updatedAt: Date? = Date()
    
    public var fullURL: URL?
    
    public init(
        id: Int,
        modelType: String,
        modelID: Int,
        uuid: UUID?,
        collectionName: String,
        fullURL: URL?,
        name: String,
        fileName: String,
        mimeType: MimeType? = nil,
        disk: String = "default",
        conversionsDisk: String? = nil,
        size: Int,
        order: Int? = nil,
        alt: String?,
        caption: String?,
        credits: String?,
        createdAt: Date? = Date(),
        updatedAt: Date? = Date()
    ) {
        self.id = id
        self.modelType = modelType
        self.modelID = modelID
        self.uuid = uuid
        self.collectionName = collectionName
        self.fullURL = fullURL
        self.name = name
        self.fileName = fileName
        self.disk = disk
        self.conversionsDisk = conversionsDisk
        self.size = size
        self.order = order
        self.alt = alt
        self.caption = caption
        self.credits = credits
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
    
    public enum CodingKeys: String, CodingKey {
        case id = "id"
        case modelType = "model_type"
        case modelID = "model_id"
        case uuid = "uuid"
        case collectionName = "collection_name"
        case name = "name"
        case fileName = "file_name"
        case mimeType = "mime_type"
        case disk = "disk"
        case conversionsDisk = "conversions_disk"
//        case responsiveImages = "responsive_images"
        case size = "size"
        case order = "order_column"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case alt = "alt"
        case caption = "caption"
        case credits = "credits"
        case fullURL = "full_url"
        case responsiveWidth = "responsive_width"
        case responsiveHeight = "responsive_height"
    }
    
    public var humanReadableSize: String {
        
        let sizeInBytes = Measurement(value: Double(size), unit: UnitInformationStorage.bytes)
        
        let numberFormatter = NumberFormatter()
        let formatter = MeasurementFormatter()
        
        numberFormatter.maximumFractionDigits = 1
        
        formatter.unitStyle = .short
        formatter.unitOptions = .naturalScale
        formatter.numberFormatter = numberFormatter
        formatter.locale = Locale.autoupdatingCurrent
        
        return formatter.string(from: sizeInBytes)
        
    }
    
    public func getImage(width: CGFloat, height: CGFloat, callback: ((PlatformImage) -> Void)) {
        callback(PlatformImage())
    }
    
    public func data(width: CGFloat) -> MediaImageDataType {
        
        if let fullURL = fullURL {
            return .remote(request: ImageRequest(url: fullURL))
        } else {
            return .local(image: PlatformImage())
        }
        
    }
    
    public func accessibilityLabel() -> String? {
        return alt
    }
    
//    public struct ResponsiveImages: Codable, Equatable, Hashable {
//
//        public let base64svg: String?
//
//        public enum CodingKeys: String, CodingKey {
//            case base64svg = "base64svg"
//        }
//
//        public init(from decoder: Decoder) throws {
//
//            let container: KeyedDecodingContainer<Media.ResponsiveImages.CodingKeys> = try decoder.container(keyedBy: Media.ResponsiveImages.CodingKeys.self)
//            self.base64svg = try container.decodeIfPresent(String.self, forKey: Media.ResponsiveImages.CodingKeys.base64svg)
//        }
//
//        func encode(to encoder: Encoder) throws {
//            var container = encoder.container(keyedBy: Media.ResponsiveImages.CodingKeys.self)
//            try container.encodeIfPresent(self.base64svg, forKey: Media.ResponsiveImages.CodingKeys.base64svg)
//        }
//    }
    
}
