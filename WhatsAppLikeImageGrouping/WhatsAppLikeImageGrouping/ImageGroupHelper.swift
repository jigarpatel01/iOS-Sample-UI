//
//  groupImage.swift
//  CGClockSwift
//
//  Created by Jigar on 10/04/19.
//  Copyright © 2019 Jigar. All rights reserved.
//

import Foundation
import UIKit


class CreateGroupImageView : UIView {
    
    var imageViews : [ImageView] = []
    var imageCount = 0
    var dimmingView : DimmingView?
    
    init(images : listOfImages) {
        super.init(frame: CGRect.zero)
        self.imageCount = images.imageNameList.count
        createAndLayoutImages(images: images)
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createAndLayoutImages(images : listOfImages) -> Void {
        for i in 0..<4 {
            let imgObj = ImageView(image: images.imageNameList[i], size: CGSize(width: 100, height: 100))
            imageViews.append(imgObj)
            self.addSubview(imgObj)
        }
        dimmingView = DimmingView()
        self.addSubview(dimmingView!)
    }
    
    func updateImagePosition() -> Void {
        let viewSize : CGRect = self.frame.insetBy(dx: 2.5, dy: 2.5)
        let time = "3.20 pm"
        imageViews[0].frame = CGRect(x: 0, y: 0, width: viewSize.height/2, height: viewSize.width/2)
        let gradientView1 = GradientView(frame: self.imageViews[0].bounds)
        gradientView1.setGradient(startColor: UIColor.init(white: 0, alpha: 0.0), endColor: UIColor.init(white: 1, alpha: 0.8))
        imageViews[0].addSubview(gradientView1)
        imageViews[0].showMessage(message: time)
        
        imageViews[1].frame = CGRect(x: viewSize.height/2 , y: 0, width: viewSize.height/2, height: viewSize.width/2)
        let gradientView2 = GradientView(frame: self.imageViews[1].bounds)
        gradientView2.setGradient(startColor: UIColor.init(white: 0, alpha: 0.0), endColor: UIColor.init(white: 1, alpha: 0.8))
        imageViews[1].addSubview(gradientView2)
        imageViews[1].showMessage(message: time)
        
        imageViews[2].frame = CGRect(x: 0, y: viewSize.height/2, width: viewSize.height/2, height: viewSize.width/2)
        let gradientView3 = GradientView(frame: self.imageViews[2].bounds)
        gradientView3.setGradient(startColor: UIColor.init(white: 0, alpha: 0.0), endColor: UIColor.init(white: 1, alpha: 0.8))
        imageViews[2].addSubview(gradientView3)
        imageViews[2].showMessage(message: time)
        
        imageViews[3].frame = CGRect(x: viewSize.height/2, y: viewSize.height/2, width: viewSize.height/2, height: viewSize.width/2)
        
        dimmingView?.frame = CGRect(x: viewSize.height/2, y: viewSize.height/2, width: viewSize.height/2, height: viewSize.width/2)
        dimmingView?.showMessage(message: "+10")
        
    }
    
    
    
    
}

class DimmingView : UIView {
    
    
    init() {
        super.init(frame: CGRect.zero)
    }
    
    override var frame: CGRect {
        didSet {
            self.layer.backgroundColor = UIColor.init(white: 0, alpha: 0.4).cgColor
        }
    }
    
    fileprivate func showMessage(message : String) -> Void {
        
        let descLabel = UILabel()
        descLabel.text = "  " + message + "  "
        descLabel.textAlignment = .center
        descLabel.backgroundColor = UIColor.black.withAlphaComponent(0.0)
        self.addSubview(descLabel)
        descLabel.textColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 202.0/255.0, alpha: 1)
        descLabel.translatesAutoresizingMaskIntoConstraints = false
        let xConstraint = NSLayoutConstraint(item: descLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)
        
        let yConstraint = NSLayoutConstraint(item: descLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([xConstraint,yConstraint])
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


class ImageView : UIView {
    
    var image : UIImage?
    var imageUISize : CGSize?
    var imageview : UIImageView?
    override var frame: CGRect {
        didSet {
            imageview?.frame = self.bounds.insetBy(dx: 2, dy: 2)
        }
    }
    
    init(image : String , size : CGSize) {
        super.init(frame: CGRect.zero)
        let image  = UIImage(named: image)!
        imageview = UIImageView(image: image);
        imageview?.frame.size = size
        self.addSubview(imageview!)
        self.layer.cornerRadius = 5
    }
    
    fileprivate func showMessage(message : String) -> Void {
        let descLabel = UILabel()
        descLabel.text = "  " + message + "  "
        descLabel.textAlignment = .center
        descLabel.backgroundColor = UIColor.black.withAlphaComponent(0.0)
        descLabel.font = descLabel.font.withSize(13)
        self.addSubview(descLabel)
        descLabel.textColor = UIColor.white
        descLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let xConstraint = NSLayoutConstraint(item: descLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -30)
        
        let yConstraint = NSLayoutConstraint(item: descLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -15)
        
        NSLayoutConstraint.activate([xConstraint,yConstraint])
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
