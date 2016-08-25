//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Israel Flores on 8/16/16.
//  Copyright © 2016 Apple Inc. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    // MARK: Properties
    var rating = 0 {
    // property observer
    didSet {
        // triggers a layout update every time the rating changes
        setNeedsLayout()
    }
    }
    
    var ratingButtons = [UIButton]()
    let spacing = 5
    let starCount = 5

    // MARK: Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let filledStarImage = UIImage(named: "filledStar")
        let emptyStarImage = UIImage(named: "emptyStar")
        
        for _ in 0..<starCount {
            // Before: let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
            // becuase we set button frames in layoutSubviews(), we no longer need to set them when we create the buttons.
            let button = UIButton()
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            // Occurs when the user in the process of tapping the button
            button.setImage(filledStarImage, forState: [.Highlighted, .Selected])
            
            // This makes sure the image doesn't show an additional highlight during the state change (tapping)
            button.adjustsImageWhenHighlighted = false
            
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(_:)), forControlEvents: .TouchDown)
            
            // each button created is added to the array of buttons to keep track of them
            ratingButtons += [button]
            
            addSubview(button)
        }
    }
    
    override func layoutSubviews() {
        // Set the button's width and height to a square the size of the frame's height.
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        // Offset each button's origin by the length of the button plus spacing.
        // Creates a for-in loop to iterate over all of the buttons to set their frames.
        // The enumerate() method returns a colletction that contains elements in the ratingButtons array paired with their indexes.
        for (index, button) in ratingButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
        
        updateButtonSelectionStates()
        
    }
    
    override func intrinsicContentSize() -> CGSize {
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize * starCount) + (spacing * (starCount - 1))
        
        return CGSize(width: width, height: buttonSize)
    }

    // MARK: Button Action
    func ratingButtonTapped(button: UIButton){
        rating = ratingButtons.indexOf(button)! + 1
        
        updateButtonSelectionStates()
    }
    
    // Helper used to update the selection states of the buttons
    func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerate() {
            // If the index of a button is less than the rating, that button should be selected.
            // makes sure that the star selection is linear from 0 stars to all stars
            button.selected = index < rating
        }
    }
}
