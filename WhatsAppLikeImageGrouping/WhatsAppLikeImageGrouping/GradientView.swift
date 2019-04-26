//
//  GradientView.swift
//  WhatsAppLikeImageGrouping
//
//  Created by Jigar on 26/04/19.
//  Copyright © 2019 Jigar. All rights reserved.
//

import Foundation
import UIKit

class GradientView: UIView {
    var gradient:CAGradientLayer?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setGradient(startColor:UIColor,endColor:UIColor)
    {
        gradient?.colors = [startColor.cgColor, endColor.cgColor]
    }
    
    private func setupView() {
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        guard let _gradient:CAGradientLayer = self.layer as? CAGradientLayer else {
            return;
        }
        gradient = _gradient
        gradient?.locations = [0.7 , 1.0]
        gradient?.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradient?.endPoint = CGPoint(x: 0.5, y: 1.0)
        gradient?.frame = self.bounds
    }
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
}

