//
//  MimeType.swift
//  
//
//  Created by Lennart Fischer on 04.01.21.
//

import Foundation


/// Represents a list of the most common mime types
public enum MimeType: String, Codable, Hashable {
    
    case png = "image/png"
    case audio = "audio/aac"
    case bmp = "image/bmp"
    case doc = "application/msword"
    case docx = "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
    case gif = "image/gif"
    case html = "text/html"
    case jpg = "image/jpeg"
    case json = "application/json"
    case jsonld = "application/ld+json"
    case midi = "audio/midi"
    case xmidi = "audio/x-midi"
    case mp3 = "audio/mpeg"
    case mpeg = "video/mpeg"
    case odp = "application/vnd.oasis.opendocument.presentation"
    case odt = "application/vnd.oasis.opendocument.text"
    case ods = "application/vnd.oasis.opendocument.spreadsheet"
    case oga = "audio/ogg"
    case ogv = "video/ogg"
    case pdf = "application/pdf"
    case ppt = "application/vnd.ms-powerpoint"
    case pptx = "application/vnd.openxmlformats-officedocument.presentationml.presentation"
    case rtf = "application/rtf"
    case svg = "image/svg+xml"
    case tif = "image/tiff"
    case txt = "text/plain"
    case wav = "audio/wav"
    case weba = "audio/webm"
    case webm = "video/webm"
    case webp = "image/webp"
    case xls = "application/vnd.ms-excel"
    case xlsx = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
    case zip = "application/zip"
    
    public static let imageMimeTypes: [MimeType] = [
        .png,
        .bmp,
        .jpg,
        .tif,
        .webp,
        .svg
    ]
    
    public static let displayableByImageProcessingPipeline: [MimeType] = [
        .png,
        .jpg
    ]
    
    public var isImageMimeType: Bool {
        return MimeType.imageMimeTypes.contains(self)
    }
    
}
