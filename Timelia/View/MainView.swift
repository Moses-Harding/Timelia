//
//  MainView.swift
//  Timelia
//
//  Created by Moses Harding on 3/3/21.
//

import UIKit

class MainView: UIView {
    
    //Main body
    var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        return stack
    }()
    var topLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.text = "Welcome to Timelia."
        label.font = UIFont.systemFont(ofSize: 24)
        label.alpha = 0
        return label
    }()
    var bottomLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.text = "Welcome to Timelia."
        label.font = UIFont.systemFont(ofSize: 24)
        label.alpha = 0
        return label
    }()
    var mainButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        
        button.setTitle("Let's get tracking!", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        button.alpha = 0
        return button
    }()
    
    
    let spacer1 = UIView()
    let spacer2 = UIView()
    let spacer3 = UIView()
    let spacer4 = UIView()
    
    var spacer2Constraint: NSLayoutConstraint!
    var spacer3Constraint: NSLayoutConstraint!
    var spacer4Constraint: NSLayoutConstraint!
    
    init(parent: UIViewController) {
        super.init(frame: CGRect.zero)
        
        constrainTo(parent: parent.view)
        
        setUpMainView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func constrainTo(parent: UIView) {
        
        let padding: CGFloat = 0
        //let safeArea = parent.safeAreaLayoutGuide
        let safeArea = parent
        
        parent.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let leadingConstraint = self.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: padding)
        let trailingConstraint = self.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -padding)
        let topConstraint = self.topAnchor.constraint(equalTo: safeArea.topAnchor)
        let bottomConstraint = self.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        
        let constraints = [leadingConstraint, trailingConstraint, topConstraint, bottomConstraint]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func setUpMainView() {
        self.constrainChild(mainStack)
        
        let mainButtonView = UIView()
        
        mainStack.addArrangedSubview(spacer1)
        mainStack.addArrangedSubview(topLabel)
        mainStack.addArrangedSubview(spacer2)
        mainStack.addArrangedSubview(bottomLabel)
        mainStack.addArrangedSubview(spacer3)
        mainStack.addArrangedSubview(mainButtonView)
        mainStack.addArrangedSubview(spacer4)
        
        spacer1.heightAnchor.constraint(equalTo: mainStack.heightAnchor, multiplier: 0.2).isActive = true
        spacer2Constraint = spacer2.heightAnchor.constraint(equalTo: mainStack.heightAnchor, multiplier: 0.1)
        spacer3Constraint = spacer3.heightAnchor.constraint(equalTo: mainStack.heightAnchor, multiplier: 0.1)
        spacer4Constraint = spacer4.heightAnchor.constraint(equalTo: mainStack.heightAnchor, multiplier: 0.1)
        topLabel.heightAnchor.constraint(equalTo: mainStack.heightAnchor, multiplier: 0.1).isActive = true
        mainButtonView.heightAnchor.constraint(equalTo: mainStack.heightAnchor, multiplier: 0.075).isActive = true
        mainButtonView.constrainAndScale(mainButton, widthScale: 0.9, heightScale: 0.9)
        
        spacer2Constraint.isActive = true
        spacer3Constraint.isActive = true
        
        self.layoutIfNeeded()
    }
    
    func animateView() {
        
        let animation1 = { [self] in
            self.layoutIfNeeded()
            topLabel.alpha = 1
        }
        
        let animation2 = {
            self.topLabel.alpha = 0
        }
        
        let animation3 = {
            self.bottomLabel.text = "Timelia helps you easily track time."
            self.bottomLabel.alpha = 1
        }
        
        let animation4 = {
            //self.bottomLabel.alpha = 0
            
            self.layoutIfNeeded()
        }
        
        let animation5 = {
            self.spacer2Constraint.isActive = false
            self.spacer3Constraint.isActive = false
            self.spacer4Constraint.isActive = false
            self.layoutIfNeeded()
            
            self.spacer4Constraint = self.spacer4.heightAnchor.constraint(equalTo: self.mainStack.heightAnchor, multiplier: 0.3)
            self.spacer3Constraint = self.spacer3.heightAnchor.constraint(equalTo: self.mainStack.heightAnchor, multiplier: 0.3)
            self.spacer3Constraint.isActive = true
            self.spacer4Constraint.isActive = true
            self.layoutIfNeeded()
            
            self.mainButton.alpha = 1
        }
        
        UIView.animate(withDuration: 0.2, delay: 0.2, animations: animation1,
                       completion: { (Bool) in
                        UIView.animate(withDuration: 0.2, animations: animation2,
                                       completion: { (Bool) in
                                        UIView.animate(withDuration: 0.2, animations: animation3,
                                                       completion: { Bool in
                                                        UIView.animate(withDuration: 0.2, animations: animation4,
                                                                       completion: { Bool in
                                                                        UIView.animate(withDuration: 0.3, animations: animation5)
                                                                       })
                                                       })
                                       })
                        
                        
                       })
    }
}
