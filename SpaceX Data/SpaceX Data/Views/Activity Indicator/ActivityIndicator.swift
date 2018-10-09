//
//  ActivityIndicator.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 10/2/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation
import UIKit

class ActivityIndicator {
    
    @available(*, unavailable)
    init() {
        
    }
    
    private static var activityIndicatorView: UIView = {
        let screenBounds = UIScreen.main.bounds
        
        let view = UIView(frame: screenBounds)
        
        let rectangleView = UIView(frame: CGRect(x: 0, y: 0, width: screenBounds.width * 0.35, height: screenBounds.width * 0.35))
        rectangleView.center = screenBounds.midPoint
        rectangleView.layer.cornerRadius = 15
        rectangleView.backgroundColor = UIColor.lightGray
        
        let activityIndicatorView = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicatorView.startAnimating()
        activityIndicatorView.center = CGPoint(x:screenBounds.width * 0.175, y: screenBounds.width * 0.175)
        activityIndicatorView.color = UIColor.spaceXDarkGray
        
        rectangleView.addSubview(activityIndicatorView)
        
        view.addSubview(rectangleView)
        
        return view
    }()
    
    static func show() {
        UIApplication.shared.keyWindow?.addSubview(activityIndicatorView)
    }
    
    static func hide() {
        DispatchQueue.main.async {
            activityIndicatorView.removeFromSuperview()
        }
    }
    
}

fileprivate extension CGRect {
    
    var midPoint: CGPoint {
        return CGPoint(x: midX, y: midY)
    }
    
}
