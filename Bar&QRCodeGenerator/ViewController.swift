//
//  ViewController.swift
//  Bar&QRCodeGenerator
//
//  Created by Abiu Roldan on 12/5/17.
//  Copyright © 2017 Abiu Roldan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dataField: UITextField!
    @IBOutlet weak var codeSelector: UISegmentedControl!
    @IBOutlet weak var desplayCodeView: UIImageView!
    
    var filter: CIFilter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func generatePressed(_ sender: UIButton) {
        
        if let text = dataField.text {
            
            let data = text.data(using: .ascii, allowLossyConversion: false)
            
            if codeSelector.selectedSegmentIndex == 0{
                filter = CIFilter(name: "CICode128BarCodeGenerator")
            }else{
                filter = CIFilter(name: "CIQRCodeGenerator")
            }
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            let image = UIImage(ciImage: filter.outputImage!.transformed(by: transform))
            
            desplayCodeView.image = image
        }
        
    }
}

