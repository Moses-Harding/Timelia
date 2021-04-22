//
//  MainViewController.swift
//  Timelia
//
//  Created by Moses Harding on 4/20/21.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUpGradient()
    }
    
    func setUpGradient() {
        
        let gradient = CAGradientLayer()

        guard let color1 = UIColor("#ea5959")?.cgColor, let color2 = UIColor("#f98b60")?.cgColor, let color3 = UIColor("#ffc057")?.cgColor else {
            fatalError("No Color found")
        }
        
        gradient.colors = [color1, color2, color3]
        gradient.frame = self.view.frame
        
        self.view.layer.addSublayer(gradient)
    }
}
