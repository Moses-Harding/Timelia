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
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.alpha = 0
        return label
    }()
    var bottomLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.text = "Timelia helps you easily track time."
        label.font = UIFont.systemFont(ofSize: 24)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
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
    
    var clock: ClockView = ClockView()
    
    let spacer1 = UIView()
    let spacer2 = UIView()
    let spacer3 = UIView()
    let spacer4 = UIView()
    
    var topLabelConstraint: NSLayoutConstraint!
    var bottomLabelConstraint: NSLayoutConstraint!
    
    var spacer1Constraint: NSLayoutConstraint!
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

        mainButtonView.heightAnchor.constraint(equalTo: mainStack.heightAnchor, multiplier: 0.075).isActive = true
        mainButtonView.constrainAndScale(mainButton, widthScale: 0.9, heightScale: 0.9)
        
        topLabelConstraint = topLabel.heightAnchor.constraint(equalTo: mainStack.heightAnchor, multiplier: 0.1)
        bottomLabelConstraint = bottomLabel.heightAnchor.constraint(equalTo: mainStack.heightAnchor, multiplier: 0.1)
        
        topLabelConstraint.isActive = true
        bottomLabelConstraint.isActive = true
        
        spacer1Constraint = spacer1.heightAnchor.constraint(equalTo: mainStack.heightAnchor, multiplier: 0.2)
        spacer2Constraint = spacer2.heightAnchor.constraint(equalTo: mainStack.heightAnchor, multiplier: 0.1)
        spacer3Constraint = spacer3.heightAnchor.constraint(equalTo: mainStack.heightAnchor, multiplier: 0.2)
        spacer4Constraint = spacer4.heightAnchor.constraint(equalTo: mainStack.heightAnchor, multiplier: 0.2)
        
        spacer1Constraint.isActive = true
        spacer2Constraint.isActive = true
        spacer3Constraint.isActive = true
        spacer4Constraint.isActive = true
        
        self.layoutIfNeeded()
    }
    
    func animateView() {
        
        let animation1 = {
            self.layoutIfNeeded()
            self.topLabel.alpha = 1
        }
        
        let animation2 = {
            self.topLabel.alpha = 0
        }
        
        let animation3 = {
            self.bottomLabel.alpha = 1
        }
        
        let animation4 = {
            self.layoutIfNeeded()
        }
        
        let animation5 = {
            
            self.mainButton.alpha = 1
            
            self.topLabelConstraint.isActive = false

            self.spacer1Constraint = self.spacer1.heightAnchor.constraint(equalTo: self.mainStack.heightAnchor, multiplier: 0.1)
            self.spacer2Constraint = self.spacer2.heightAnchor.constraint(equalTo: self.mainStack.heightAnchor, multiplier: 0.05)
            self.spacer3Constraint = self.spacer3.heightAnchor.constraint(equalTo: self.mainStack.heightAnchor, multiplier: 0.3)
            self.spacer4Constraint = self.spacer4.heightAnchor.constraint(equalTo: self.mainStack.heightAnchor, multiplier: 0.3)
            
            self.spacer1Constraint.isActive = true
            self.spacer2Constraint.isActive = true
            self.spacer3Constraint.isActive = true
            self.spacer4Constraint.isActive = true
            
            self.layoutIfNeeded()
        }
        
        let animation6 = {
            
            self.spacer1Constraint = self.spacer1.heightAnchor.constraint(equalTo: self.mainStack.heightAnchor, multiplier: 0.1)
            self.spacer2Constraint = self.spacer2.heightAnchor.constraint(equalTo: self.mainStack.heightAnchor, multiplier: 0.025)
            self.spacer3Constraint = self.spacer3.heightAnchor.constraint(equalTo: self.mainStack.heightAnchor, multiplier: 0.25)
            self.spacer4Constraint = self.spacer4.heightAnchor.constraint(equalTo: self.mainStack.heightAnchor, multiplier: 0.3)
        
            self.spacer1Constraint.isActive = true
            self.spacer2Constraint.isActive = true
            self.spacer3Constraint.isActive = true
            self.spacer4Constraint.isActive = true
            
            self.layoutIfNeeded()
            
            _ = self.spacer3.constrainChild(self.clock, padding: 5)
        }
        
        let animation7 = {
            self.clock.topMidView.alpha = 1
        }
        
        let animation8 = {
            self.clock.topRightView.alpha = 1
        }
        
        let animation9 = {
            self.clock.midRightView.alpha = 1
        }
        
        let animation10 = {
            self.clock.bottomRightView.alpha = 1
        }
        
        let animation11 = {
            self.clock.bottomMidView.alpha = 1
        }
        
        let animation12 = {
            self.clock.bottomLeftView.alpha = 1
        }
        
        let animation13 = {
            self.clock.midLeftView.alpha = 1
        }
        
        let animation14 = {
            self.clock.topLeftView.alpha = 1
        }

        let duration: TimeInterval = 7
        let animations = [animation1, animation2, animation3, animation4, animation5, animation6, animation7, animation7, animation8, animation9, animation10,
        animation11, animation12, animation13, animation14]
        let durations = [0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.025, 0.025, 0.025, 0.025, 0.025, 0.025, 0.025, 0.025, 0.025, 0.025]
        
        let animationCount = Double(animations.count)
        
        var startTime: Double = 0
        var iterator = 0
        
        UIView.animateKeyframes(withDuration: duration, delay: 0, options: [.layoutSubviews]) {
            
            animations.forEach { animation in
                let relativeDuration: Double = durations[iterator]
                UIView.addKeyframe(withRelativeStartTime: startTime, relativeDuration: relativeDuration, animations: animation)
                startTime += relativeDuration
                iterator += 1
            }
        }
    }
}
