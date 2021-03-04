//
//  ViewController.swift
//  Timelia
//
//  Created by Moses Harding on 3/3/21.
//

import UIKit

class ViewController: UIViewController {
    
    var mainView: MainView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUpGradient()
        setUpMainView()
        
        mainView.animateView()
    }
    
    func setUpMainView() {
        
        mainView = MainView(parent: self)
        

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

