//
//  ViewController.swift
//  Rotating Images
//
//  Created by denver on 18.09.17.
//  Copyright © 2017 denver. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate{

    @IBOutlet weak var scrollView: UIScrollView!
    var images = [UIImage]()
    var imagesDict = [UIImageView:UIImage]()
    
    override func viewDidLoad() {
        
        scrollView.delegate = self
        
        super.viewDidLoad()
        images = [#imageLiteral(resourceName: "image1"), #imageLiteral(resourceName: "image3"), #imageLiteral(resourceName: "image2")]
        
        scrollView.frame = self.view.frame
        
        for i in 0..<images.count {
            
            let imageView = UIImageView()
            imageView.image = images[i]
            imageView.contentMode = .scaleAspectFit
            let width = scrollView.frame.width
            let height = scrollView.frame.height
            let x = width * CGFloat(i);
            let y = CGFloat(0)
            
            imageView.frame = CGRect(x: x, y: y, width: width, height: height)
            
            scrollView.addSubview(imageView)
            
            imagesDict[imageView] = images[i]
        }
        
        scrollView.contentSize.width = scrollView.frame.width * CGFloat(images.count)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        for imageView in imagesDict.keys {
            updateRotation(forImageView: imageView)
        }
    }
    
    func updateRotation(forImageView imageView:UIImageView){
        if let image = imagesDict[imageView]{
            let scrollX = scrollView.contentOffset.x
            let imageWidth = imageView.frame.width
            
            let shiftX = imageView.frame.minX - scrollX
            var angleInDegrees:CGFloat = 0.0
            if (shiftX > 0 && shiftX < imageWidth){
                angleInDegrees = (90.0 * shiftX)/320.0;
            }else if (shiftX < 0 && shiftX > -imageWidth){
                angleInDegrees = (90.0 * shiftX)/320.0;
            }
            
            imageView.image = image.imageRotatedByDegrees(degrees: angleInDegrees)
        }
    }

}

