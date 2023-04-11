//
//  URLTests.swift
//  
//
//  Created by Lennart Fischer on 09.04.23.
//

import Foundation
import XCTest

final class URLTests: XCTestCase {
    
    /// ToDo: We have to prevent that
    ///
    /// public var fullURL: URL? {
    ///     return "".addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)
    /// }
    func testURLWithUmlauts() throws {
        
        let urlString = "https://moers-festival.localhost/media/f321f0c8e46b901a4817b9a2054c298b/conversions/fördern-preview.jpg"
        
        let url = URL(string: urlString)
        
//        XCTAssertNotNil(url)
        
    }
    
}
