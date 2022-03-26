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
    
}
