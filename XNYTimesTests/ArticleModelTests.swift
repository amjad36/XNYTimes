//
//  XNYTimesTests.swift
//  XNYTimesTests
//
//  Created by Amjad Khan on 28/10/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import XCTest
@testable import XNYTimes

class XNYTimesTests: XCTestCase {

    var jsonString: String?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        jsonString = """
                   { "id": 100000006160692,
                                                "title": "Among the Ruins of Mexico Beach Stands One House",
                                                "abstract": "Hurricane Michael wrecked every other beachfront house on the block, but one came through the storm nearly pristine, as if protected by grace. How did it survive?",
                                 "type": "Article",
                                 "published_date": "2018-10-14",
                                 "byline": "By PATRICIA MAZZEI"}
        """
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        jsonString = nil
    }

    func testArticleModel() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        guard let data = jsonString?.data(using: .utf8) else {
            return
        }
        let article = try? JSONDecoder().decode(Article.self, from: data)
        XCTAssertNotNil(article)
        XCTAssertEqual(article?.title, "Among the Ruins of Mexico Beach Stands One House")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
