//
//  MimeType.swift
//  
//
//  Created by Lennart Fischer on 04.01.21.
//

import Foundation

public enum MimeType: String, Codable {
    
    case imagePng = "image/png"
    case audioAac = "audio/aac"
    case imageBmp = "image/bmp"
    case doc = "application/msword"
    case docx = "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
    case imageGif = "image/gif"
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
    
}
