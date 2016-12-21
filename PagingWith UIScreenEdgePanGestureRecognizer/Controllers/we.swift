////
////  we.swift
////  PagingWith UIScreenEdgePanGestureRecognizer
////
////  Created by LOGIN on 2016-12-20.
////  Copyright © 2016 Intelligrape. All rights reserved.
////
//
//import UIKit
//
//class we: UIView {
//
////    protocol TableViewCellDelegate {
////        func something()
////    }
////    
//    class TableViewCell: UITableViewCell {
//        
//        var startSegue = false
//        var label: UILabel                      // Or UIView, whatever you want to show
//        var delegate: TableViewCellDelegate?    // Delegate to your ViewController to perform the segue
//        
//        required init(coder aDecoder: NSCoder) {
//            fatalError("NSCoding not supported")
//        }
//        
//        override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
//            
//            // Utility method for creating the label / view
//            func createLabel() -> UILabel {
//                let label = UILabel(frame: CGRect.nullRect)
//                
//                // Add label customization here
//                
//                return label
//            }
//            
//            // Create "check" & "cross" labels for context cues
//            label = createLabel()        // Create the label
//            label.text = "\u{2713}"      // Add check symbol as text
//            
//            super.init(style: style, reuseIdentifier: reuseIdentifier)
//            
//            addSubview(label)
//            
//            // Add a pan recognizer
//            var recognizer = UIPanGestureRecognizer(target: self, action: "handleSwipe:")
//            recognizer.delegate = self
//            addGestureRecognizer(recognizer)
//        }
//        
//        let cueMargin: CGFloat = 10.0, cueWidth: CGFloat = 50.0
//        
//        override func layoutSubviews() {
//            
//            // The label starts out of view
//            label.frame = CGRect(x: bounds.size.width + cueMargin, y: 0, width: cueWidth, height: bounds.size.height)
//        }
//        
//        func handleSwipe(recognizer: UIPanGestureRecognizer) {
//            let translation = recognizer.translation(in: self)
//            
//            if recognizer.state == .changed {
//                center = CGPointMake(center.x + translation.x, center.y)
//                startSegue = frame.origin.x < -frame.size.width / 2.0                       // If swiped over 50%, return true
//                label.textColor = startSegue ? UIColor.redColor() : UIColor.whiteColor()    // If swiped over 50%, become red
//                recognizer.setTranslation(CGPointZero, inView: self)
//            }
//            if recognizer.state == .Ended {
//                let originalFrame = CGRect(x: 0, y: frame.origin.y, width: bounds.size.width, height: bounds.size.height)
//                if delegate != nil {
//                    startSegue ? delegate!.something() : UIView.animateWithDuration(0.2) { self.frame = originalFrame }
//                }
//            }
//        }
//        
//        // Need this to handle the conflict between vertical swipes of tableviewgesture and pangesture
//        override func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
//            if let panGestureRecognizer = gestureRecognizer as? UIPanGestureRecognizer {
//                let velocity = panGestureRecognizer.velocityInView(superview!)
//                if fabs(velocity.x) >= fabs(velocity.y) { return true }
//                return false
//            }
//            return false
//        }
//    }
//
//}
