//
//  Meal.swift
//  FoodTracker
//
<<<<<<< HEAD
//  Created by Israel Flores on 8/24/16.
//  Copyright © 2016 Apple Inc. All rights reserved.
=======
//  Created by Jane Appleseed on 5/26/15.
//  Copyright © 2015 Apple Inc. All rights reserved.
//  See LICENSE.txt for this sample’s licensing information.
>>>>>>> origin/master
//

import UIKit

<<<<<<< HEAD
class Meal{
    
=======
class Meal {
>>>>>>> origin/master
    // MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
<<<<<<< HEAD
    
    
    // MARK: Initialization
    
    init?(name: String, photo: UIImage?, rating: Int){
=======

    // MARK: Initialization
    
    init?(name: String, photo: UIImage?, rating: Int) {
>>>>>>> origin/master
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.rating = rating
        
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
<<<<<<< HEAD
}
=======

}
>>>>>>> origin/master
