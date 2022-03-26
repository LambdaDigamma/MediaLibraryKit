import XCTest
@testable import MediaLibraryKit

final class MediaTests: XCTestCase {
    
    func testBasicDecode() {
        
        let json = ##"""
        {
            "id": 2,
            "model_type": "App\\Models\\SomeModel",
            "model_id": 1,
            "uuid": "15b010ea-1f12-48fd-a091-c2372a754bbb",
            "collection_name": "header",
            "name": "some-image.png",
            "file_name": "some-filename.png",
            "mime_type": "image/png",
            "disk": "public",
            "conversions_disk": "public",
            "size": 157787,
            "manipulations": [],
            "custom_properties": [],
            "order_column": 0,
            "created_at": "2020-11-30T13:17:36.000000Z",
            "updated_at": "2020-11-30T15:01:28.000000Z"
        }
        """##
        
        do {
            
            guard let data = json.data(using: .utf8) else { return XCTFail("Conversion to data failed.") }
            
            let decoder = MediaDecoder()
            let media = try decoder.decode(Media.self, from: data)
            
            XCTAssertEqual(media.id, 2)
            XCTAssertEqual(media.modelType, "App\\Models\\SomeModel")
            XCTAssertEqual(media.modelID, 1)
            XCTAssertEqual(media.uuid, UUID(uuidString: "15b010ea-1f12-48fd-a091-c2372a754bbb"))
            XCTAssertEqual(media.collectionName, "header")
            XCTAssertEqual(media.name, "some-image.png")
            XCTAssertEqual(media.fileName, "some-filename.png")
            XCTAssertEqual(media.mimeType, .png)
            XCTAssertEqual(media.disk, "public")
            XCTAssertEqual(media.conversionsDisk, "public")
            XCTAssertEqual(media.size, 157787)
            XCTAssertEqual(media.order, 0)
            XCTAssertNotNil(media.createdAt)
            XCTAssertNotNil(media.updatedAt)
            
//            XCTAssertEqual(media.humanReadableSize, "157,8 kB")
            
        } catch let error as DecodingError {
            print(error)
            XCTFail(error.failureReason ?? "")
        } catch {
            XCTFail(error.localizedDescription)
        }
        
    }
    
}
