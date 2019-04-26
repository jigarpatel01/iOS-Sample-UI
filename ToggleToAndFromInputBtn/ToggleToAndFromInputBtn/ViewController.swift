//
//  ViewController.swift
//  ToggleInputButton
//
//  Created by Jigar on 25/04/19.
//  Copyright © 2019 Jigar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var input1: UITextField!
    
    @IBOutlet weak var toggleBtn: UIButton!
    @IBOutlet weak var input2: UITextField!
    
    var toggle : Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func touchDown(_ sender: Any) {
        
        let input1Position : CGPoint = input1.frame.origin
        let input2Position : CGPoint = input2.frame.origin
        
        UIView.animate(withDuration: 0.5, animations: {
            self.input1.frame.origin = input2Position
            
        })
        
        UIView.animate(withDuration: 0.5, animations: {
            self.input2.frame.origin = input1Position
            
        })
        
        UIView.animate(withDuration: 0.5, animations: {
            if (self.toggle == false){
                self.toggleBtn.layer.transform = CATransform3DMakeRotation( CGFloat.pi, 0.0, 0.0, 1.0)
            }else{
                self.toggleBtn.layer.transform = CATransform3DMakeRotation( 2 * CGFloat.pi, 0.0, 0.0, 1.0)
            }
            self.toggle = !self.toggle
            
        })
        
    }
    
}

