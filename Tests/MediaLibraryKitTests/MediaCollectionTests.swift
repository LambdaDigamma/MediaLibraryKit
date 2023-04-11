//
//  MediaCollectionTests.swift
//  
//
//  Created by Lennart Fischer on 26.03.22.
//

import XCTest
@testable import MediaLibraryKit

final class MediaCollectionTests: XCTestCase {
    
    func testBasicDecode() {
        
        let json = ##"""
        {
            "header": [
                {
                  "id": 362,
                  "model_type": "App\\Models\\Example",
                  "model_id": 114,
                  "uuid": "81323ce8-d6db-49e2-8715-2b5e58f97cbb",
                  "collection_name": "header",
                  "name": "example.png",
                  "file_name": "example.png",
                  "mime_type": "image/png",
                  "disk": "media",
                  "conversions_disk": "media",
                  "size": 381002,
                  "manipulations": [],
                  "custom_properties": [],
                  "alt": "",
                  "credits": "",
                  "caption": "",
                  "generated_conversions": {
                    "opengraph": true,
                    "thumbnail": true,
                    "preview": true
                  },
                  "responsive_images": {
                    "media_library_original": {
                      "urls": [
                        "media_library_original_1200_872.png",
                        "media_library_original_1003_728.png",
                        "media_library_original_839_609.png",
                        "media_library_original_702_510.png",
                        "media_library_original_587_426.png",
                        "media_library_original_491_356.png",
                        "media_library_original_411_298.png",
                        "media_library_original_344_249.png",
                        "media_library_original_288_209.png",
                        "media_library_original_241_175.png",
                        "media_library_original_201_146.png"
                      ],
                      "base64svg": "somedata"
                    }
                  },
                  "order_column": 0,
                  "created_at": "2021-05-17T18:55:01.000000Z",
                  "updated_at": "2021-05-17T18:55:21.000000Z",
                  "srcset": "https://example.org/responsive-images/media_library_original_1200_872.png 1200w",
                  "full_url": "https://example.org/media/c84a158a7ac7042f05ea6240f56a30d7/example.png",
                  "responsive_width": 1200,
                  "responsive_height": 872,
                  "preview_url": "https://example.org/media/c84a158a7ac7042f05ea6240f56a30d7/example.png"
                }
            ]
        }
        """##
        
        do {
            
            guard let data = json.data(using: .utf8) else { return XCTFail("Conversion to data failed.") }
            
            let decoder = MediaDecoder()
            let mediaCollection = try decoder.decode(MediaCollectionsContainer.self, from: data)
            
            guard let media = mediaCollection.getFirstMedia(for: "header") else {
                return XCTFail()
            }
            
            XCTAssertEqual(media.uuid?.uuidString, "81323CE8-D6DB-49E2-8715-2B5E58F97CBB")
            XCTAssertEqual(media.id, 362)
            XCTAssertEqual(media.collectionName, "header")
            
        } catch let error as DecodingError {
            print(error)
            XCTFail(error.failureReason ?? "")
        } catch {
            XCTFail(error.localizedDescription)
        }
        
    }
    
    func testEmptyCollectionArray() throws {
        
        let json = ##"""
            []
        """##
        
        do {
            
            guard let data = json.data(using: .utf8) else { return XCTFail("Conversion to data failed.") }
            
            let decoder = MediaDecoder()
            let mediaCollection = try decoder.decode(MediaCollectionsContainer.self, from: data)
            
            XCTAssertEqual(mediaCollection.collections, [:])
            
        } catch let error as DecodingError {
            print(error)
            XCTFail(error.failureReason ?? "")
        } catch {
            XCTFail(error.localizedDescription)
        }
        
    }
    
    func testEmptyCollectionObject() throws {
        
        let json = ##"""
        {
        }
        """##
        
        do {
            
            guard let data = json.data(using: .utf8) else { return XCTFail("Conversion to data failed.") }
            
            let decoder = MediaDecoder()
            let mediaCollection = try decoder.decode(MediaCollectionsContainer.self, from: data)
            
            XCTAssertEqual(mediaCollection.collections, [:])
            
        } catch let error as DecodingError {
            print(error)
            XCTFail(error.failureReason ?? "")
        } catch {
            XCTFail(error.localizedDescription)
        }
        
    }
    
    func testEncodeAndDecode() throws {
        
        let mediaCollection = MediaCollectionsContainer(collections: [
            "header": [
                Media(
                    id: 1,
                    modelType: "posts",
                    modelID: 1,
                    uuid: UUID(uuidString: "51F5406B-08EE-4517-AB1D-8ADFAF2D35F0"),
                    collectionName: "header",
                    fullURL: nil,
                    name: "posts1.png",
                    fileName: "posts1.png",
                    size: 1000,
                    alt: nil,
                    caption: nil,
                    credits: nil
                )
            ]
        ])
        
        let encoder = JSONEncoder()
        let encoded = try encoder.encode(mediaCollection)
        
        let decoder = JSONDecoder()
        let decodedMediaCollection = try decoder.decode(MediaCollectionsContainer.self, from: encoded)
        
        XCTAssertEqual(mediaCollection, decodedMediaCollection)
        
    }
    
    func testEdgeCase() throws {
        
        let json = ##"""
        {"insel":[{"alt":"","caption":"","collection_name":"insel","conversions_disk":"media","created_at":1636113551000,"credits":"","disk":"media","file_name":"post-3.jpg","full_url":"https:\/\/moers-festival.localhost\/media\/7001ac14172823c67b6d154943d8c820\/post-3.jpg","id":24,"mime_type":"image\/jpeg","model_id":3,"model_type":"App\\Models\\Post","name":"post-3","order_column":24,"responsive_height":1969,"responsive_images":{},"responsive_width":1969,"size":219668,"updated_at":1636113555000,"uuid":"812B557C-0A6B-4A07-9C86-1C39CC4F0662"}]}
        """##
        
        do {
            
            guard let data = json.data(using: .utf8) else { return XCTFail("Conversion to data failed.") }
            
            let decoder = JSONDecoder()
            let mediaCollection = try decoder.decode(MediaCollectionsContainer.self, from: data)
            
            print(mediaCollection)
            
            guard let media = mediaCollection.getFirstMedia(for: "insel") else {
                return XCTFail()
            }
            
            XCTAssertEqual(media.uuid?.uuidString, "812B557C-0A6B-4A07-9C86-1C39CC4F0662")
            XCTAssertEqual(media.id, 24)
            XCTAssertEqual(media.collectionName, "insel")
            
        } catch let error as DecodingError {
            print(error)
            XCTFail(error.failureReason ?? "")
        } catch {
            XCTFail(error.localizedDescription)
        }
        
    }
    
}
