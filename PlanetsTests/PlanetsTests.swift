//
//  PlanetsTests.swift
//  PlanetsTests
//
//  Created by Huseyin Yolasigmazoglu on 24/01/2021.
//

import XCTest
@testable import Planets

class PlanetsTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testPlanetWebService_WhenPlanetWebServiceCalled_ShouldNotReturnNil()  {
        
        let expectation = self.expectation(description: "WaitForWebService")
        
        let test = PlanetWebService()
        var result : [Planet?]?
        
        test.getAllPlanets { (planets) in
            
            result = planets
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 2, handler: nil)
        XCTAssertNotNil(result)
    }
    
    func testPlanetWebService_WhenPlanetWebServiceCalled_ShouldReturnMoreThenZero()  {
        
        let expectation = self.expectation(description: "WaitForWebService")
        
        let test = PlanetWebService()
        var result : [Planet?]?
        
        test.getAllPlanets { (planets) in
            
            result = planets
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 2, handler: nil)
        XCTAssertTrue(result?.count ?? 0 > 0)
    }
    
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
