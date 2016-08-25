//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Jane Appleseed on 5/23/15.
//  Copyright © 2015 Apple Inc. All rights reserved.
//

import XCTest

class FoodTrackerTests: XCTestCase {
    
    // MARK: FoodTracker Tests
<<<<<<< HEAD
    // Tests to confirm that the Meal initializer returns when no name or a negarive rating is provided.
=======

    // Tests to confirm that the Meal initializer returns nil when no name or a negative rating is provided.
>>>>>>> origin/master
    func testMealInitialization() {
        // Success case.
        let potentialItem = Meal(name: "Newest meal", photo: nil, rating: 5)
        XCTAssertNotNil(potentialItem)
        
        // Failure cases.
        let noName = Meal(name: "", photo: nil, rating: 0)
        XCTAssertNil(noName, "Empty name is invalid")
        
        let badRating = Meal(name: "Really bad rating", photo: nil, rating: -1)
<<<<<<< HEAD
        XCTAssertNil(badRating, "Negative ratings are invalid, be positive")
=======
        XCTAssertNil(badRating)
>>>>>>> origin/master
    }
}
