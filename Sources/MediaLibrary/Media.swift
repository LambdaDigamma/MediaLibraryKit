//
//  Media.swift
//  
//
//  Created by Lennart Fischer on 04.01.21.
//

import Foundation

public struct Media: Codable {
    
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
    public var size: Int
    public var order: Int?
    public var createdAt: Date? = Date()
    public var updatedAt: Date? = Date()
    
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
        case size = "size"
        case order = "order_column"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
    
    public var humanReadableSize: String {
        
        let test = Measurement(value: Double(size), unit: UnitInformationStorage.bytes)
        
        let numberFormatter = NumberFormatter()
        let formatter = MeasurementFormatter()
        
        numberFormatter.maximumFractionDigits = 1
        
        formatter.unitStyle = .short
        formatter.unitOptions = .naturalScale
        formatter.numberFormatter = numberFormatter
        formatter.locale = Locale.autoupdatingCurrent
        
        return formatter.string(from: test)
        
    }
    
}
