//
//  ImageRotation.swift
//  Rotating Images
//
//  Created by denver on 18.09.17.
//  Copyright © 2017 denver. All rights reserved.
//

import UIKit

extension UIImage {
    public func imageRotatedByDegrees(degrees: CGFloat) -> UIImage {
        let degreesToRadians: (CGFloat) -> CGFloat = {
            return $0 / 180.0 * CGFloat(Double.pi)
        }
        
        let rotatedViewBox = UIView(frame: CGRect(origin: CGPoint(x: 0, y: 0 ), size: size))
        let transform = CGAffineTransform(rotationAngle: degreesToRadians(degrees));
        rotatedViewBox.transform = transform
        let rotatedSize = rotatedViewBox.frame.size
        
        UIGraphicsBeginImageContext(rotatedSize)
            let bitmap = UIGraphicsGetCurrentContext()

            bitmap!.translateBy(x: rotatedSize.width / 2.0, y: rotatedSize.height / 2.0);
            bitmap!.rotate(by: degreesToRadians(degrees));
            draw(in: CGRect(x:-size.width / 2, y:-size.height / 2, width:size.width, height:size.height))
            let rotatedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return rotatedImage!
    }
}
