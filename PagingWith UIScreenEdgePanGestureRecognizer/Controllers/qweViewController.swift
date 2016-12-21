////
////  qweViewController.swift
////  PagingWith UIScreenEdgePanGestureRecognizer
////
////  Created by LOGIN on 2016-12-20.
////  Copyright © 2016 Intelligrape. All rights reserved.
////
//
//import UIKit
//
//class qweViewController: UIViewController {
//    
//    var centerProfileView: UIViewController!
//    var leftProfileView:   UIViewController!
//    var rightProfileView:  UIViewController!
//
//    func handleRightEdgeGesture(_ gesture: UIScreenEdgePanGestureRecognizer) {


//        var translation = gesture.translation(in: gesture.view)
//        var width: CGFloat = self.view.frame.size.width
//        var percent: CGFloat = max(-gesture.translation(in: self.view).x, 0) / width

//        switch gesture.state {

//        case .began:
////            if currentIndex += 1 >= photosUrlArray.count {
////                return
////            }
////          rightProfileView = ProfileView(frame: CGRect(x: CGFloat(screenWidth), y: CGFloat(0), width: CGFloat(screenWidth), height: CGFloat(screenHeight)), with: photosUrlArray, currentIndex: currentIndex)
//            self.view.addSubview(rightProfileView)
//            var shadowPath = UIBezierPath(rect: rightProfileView.bounds)
//            rightProfileView.layer.masksToBounds = false
//            rightProfileView.layer.shadowColor! = UIColor.black.cgColor
//            rightProfileView.layer.shadowOffset = CGSize(width: CGFloat(0.0), height: CGFloat(5.0))
//            rightProfileView.layer.shadowOpacity = 1
//            rightProfileView.layer.shadowPath = shadowPath.cgPath



//            
//        case .changed:
//            if currentIndex >= photosUrlArray.count {
//                return
//            }
//            centerProfileView.frame = CGRect(x: CGFloat(0 + translation.x / 3), y: CGFloat(0), width: CGFloat(screenWidth), height: CGFloat(480))
//            rightProfileView.frame = CGRect(x: CGFloat(screenWidth + translation.x), y: CGFloat(0), width: CGFloat(screenWidth), height: CGFloat(480))
//            rightProfileView.userInteractionEnabled = false
//            self.view.isUserInteractionEnabled = false




//        case .ended:
//            if currentIndex >= photosUrlArray.count {
//                currentIndex = photosUrlArray.count - 1
//                return
//            }
//            if percent > 0.5 || fabs(gesture.velocity(in: self.view).x) > 1000 {
//                UIView.animate(withDuration: 0.2, delay: 0.0, options: .transitionNone, animations: {() -> Void in
//                    centerProfileView.frame = CGRect(x: CGFloat(-screenWidth), y: CGFloat(self.view.frame.origin.y), width: CGFloat(screenWidth), height: CGFloat(screenHeight))
//                    rightProfileView.frame = CGRect(x: CGFloat(0), y: CGFloat(self.view.frame.origin.y), width: CGFloat(screenWidth), height: CGFloat(screenHeight))
//                }, completion: {(_ completed: Bool) -> Void in
//                    centerProfileView.removeFromSuperview()
//                    self.centerProfileView = self.rightProfileView
//                })
//            }
//            else {
//                UIView.animate(withDuration: 0.2, delay: 0.0, options: .transitionNone, animations: {() -> Void in
//                    centerProfileView.frame = CGRect(x: CGFloat(0), y: CGFloat(self.view.frame.origin.y), width: CGFloat(screenWidth), height: CGFloat(screenHeight))
//                    rightProfileView.frame = CGRect(x: CGFloat(screenWidth), y: CGFloat(self.view.frame.origin.y), width: CGFloat(screenWidth), height: CGFloat(screenHeight))
//                }, completion: {(_ completed: Bool) -> Void in
//                    rightProfileView.removeFromSuperview()
//                    rightProfileView = { _ in }
//                    currentIndex -= 1
//                })
//            }
//            rightProfileView.userInteractionEnabled = true
//            self.view.isUserInteractionEnabled = true
//        default:
//            break




//        }
//        
//    }
//
//}
