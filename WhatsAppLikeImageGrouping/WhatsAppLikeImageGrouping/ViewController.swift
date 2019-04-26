//
//  ViewController.swift
//  WhatsAppLikeImageGrouping
//
//  Created by Jigar on 26/04/19.
//  Copyright © 2019 Jigar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let imageList = listOfImages(imageNameList: ["img1","img2","img3","img4"])
        loadGroupImages(images: imageList)
    }
    
    
    func loadGroupImages(images : listOfImages) -> Void {
        let groupImage = CreateGroupImageView(images: images)
        groupImage.frame = CGRect(x: 50, y: 50, width: 200, height: 200)
        groupImage.updateImagePosition()
        self.view.addSubview(groupImage)
    }


}

