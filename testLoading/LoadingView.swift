//
//  LoadingView.swift
//  testLoading
//
//  Created by Nicky on 7/3/17.
//  Copyright © 2017 Nicky. All rights reserved.
//

import Foundation
import UIKit

class LoadingView: UIView {
    fileprivate var progressBarIndicator: UIView!
    fileprivate var screenSize: CGRect = UIScreen.main.bounds
    var isAnimationRunning = false
    var height : CGFloat = 2
    var intialWidth : CGFloat = 10
    public init(){
        super.init(frame: CGRect(x: 0, y: 64, width: screenSize.width, height: 0))
         self.progressBarIndicator = UIView(frame: CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: 0, height: height)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        screenSize = UIScreen.main.bounds
        
        if (UIDeviceOrientationIsPortrait(UIDevice.current.orientation)) {
             self.frame = CGRect(origin: CGPoint(x: self.frame.origin.x,y :self.frame.origin.y), size: CGSize(width: screenSize.width, height: self.frame.height))
        }
        if (UIDeviceOrientationIsLandscape(UIDevice.current.orientation)) {
           self.frame = CGRect(origin: CGPoint(x: self.frame.origin.x,y :self.frame.origin.y), size: CGSize(width: screenSize.width, height: self.frame.height))
        }
    }
    

    open func startAnimating() {
        
        self.backgroundColor = UIColor(red:0.73, green:0.87, blue:0.98, alpha:1.0)
        self.progressBarIndicator.backgroundColor = UIColor(red:0.12, green:0.53, blue:0.90, alpha:1.0)
        self.layoutIfNeeded()
    
        show()

        if !isAnimationRunning {
            self.isAnimationRunning = true
            
            UIView.animate(withDuration: 0.5, delay:0, options: [], animations: {
                self.frame = CGRect(x: 0, y: self.frame.origin.y, width: self.screenSize.width, height: self.height)
            }, completion: { animationFinished in
                self.addSubview(self.progressBarIndicator)
                self.configureAnimation()
            })
        }
        
    
    }
    
    open func stopAnimation(){
        
        isAnimationRunning = false
        
        UIView.animate(withDuration: 0.5, animations: {
            self.progressBarIndicator.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
            self.frame = CGRect(x: 0, y: self.frame.origin.y, width: 0, height: 0)
        })
        
    }
    
    
    
   fileprivate func show() {
        
        // Only show once
        if self.superview != nil {
            return
        }
        
        // Find current top viewcontroller
        if let topController = getTopViewController() {
            let superView: UIView = topController.view
            superView.addSubview(self)
        }
    }
    
    
    fileprivate func configureAnimation() {
        
        guard let superview = self.superview else {
            stopAnimation()
            return
        }
        
        self.progressBarIndicator.frame = CGRect(origin: CGPoint(x: 0, y :0), size: CGSize(width: intialWidth, height: height))
        
        UIView.animateKeyframes(withDuration: 1.0, delay: 0, options: [.repeat,.autoreverse], animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5, animations: {
                self.progressBarIndicator.frame = CGRect(x: superview.frame.width/2-self.intialWidth*6, y: 0, width: self.intialWidth*6, height: self.height)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5, animations: {
                self.progressBarIndicator.frame = CGRect(x: superview.frame.width-self.intialWidth, y: 0, width: self.intialWidth, height: self.height)
                
            })
            
            
        }) { (completed) in
            if (self.isAnimationRunning){
                self.configureAnimation()
            }
        }
    }
    
    
    fileprivate func getTopViewController() -> UIViewController? {
        var topController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController
        while topController?.presentedViewController != nil {
            topController = topController?.presentedViewController
        }
        return topController
    }
    
}

