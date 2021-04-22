//
//  MainView.swift
//  Timelia
//
//  Created by Moses Harding on 3/3/21.
//

import UIKit

class IntroView: UIView {
    
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
        
        button.addTarget(self, action: #selector(dismissAnimation), for: .touchUpInside)
        
        button.alpha = 0
        return button
    }()
    
    var clock: ClockView = ClockView()
    
    let spacer1 = UIView()
    let topLabelView = UIView()
    let spacer2 = UIView()
    let bottomLabelView = UIView()
    let clockView = UIView()
    let spacer3 = UIView()
    var mainButtonView = UIView()
    let spacer4 = UIView()
    
    var spacer1Constraint: NSLayoutConstraint!
    var topLabelConstraint: NSLayoutConstraint!
    var spacer2Constraint: NSLayoutConstraint!
    var bottomLabelConstraint: NSLayoutConstraint!
    var clockViewConstraint: NSLayoutConstraint!
    var spacer3Constraint: NSLayoutConstraint!
    var mainButtonViewConstraint: NSLayoutConstraint!
    var spacer4Constraint: NSLayoutConstraint!
    
    var spacer1Multiplier: CGFloat = 0.2
    var topLabelMultiplier: CGFloat = 0.1
    var spacer2Multiplier: CGFloat = 0.1
    var bottomLabelMultiplier: CGFloat = 0.1
    var clockViewMultiplier: CGFloat = 0.2
    var spacer3Multiplier: CGFloat = 0
    var mainButtonViewMultiplier: CGFloat = 0.1
    var spacer4Multiplier: CGFloat = 0.2
    
    
    init(parent: UIViewController) {
        super.init(frame: CGRect.zero)
        
        constrainTo(parent: parent.view)
        
        setUpMainView()
        //testActions()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func testActions() {
        spacer1.backgroundColor = .systemRed
        topLabelView.backgroundColor = .systemOrange
        spacer2.backgroundColor = .systemYellow
        bottomLabelView.backgroundColor = .systemGreen
        clockView.backgroundColor = .systemBlue
        mainButtonView.backgroundColor = .systemIndigo
        spacer4.backgroundColor = .systemPurple

    }
    
    //Set Up
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
        
        mainStack.addArrangedSubview(spacer1)
        mainStack.addArrangedSubview(topLabelView)
        mainStack.addArrangedSubview(spacer2)
        mainStack.addArrangedSubview(bottomLabelView)
        mainStack.addArrangedSubview(clockView)
        mainStack.addArrangedSubview(spacer3)
        mainStack.addArrangedSubview(mainButtonView)
        mainStack.addArrangedSubview(spacer4)

        topLabelView.constrainChild(topLabel)
        bottomLabelView.constrainChild(bottomLabel)
        mainButtonView.constrainAndScale(mainButton, widthScale: 0.9, heightScale: 0.9)
        
        adjustConstraints(label: "Set Up Main View", spacer1: 0.2, topLabel: 0.1, spacer2: 0.1, bottomLabel: 0.1, clockView: 0.2, mainButtonView: 0.1, spacer4: 0.2)
    }
    
    func adjustConstraints(label: String, spacer1: CGFloat? = nil, topLabel: CGFloat? = nil, spacer2: CGFloat? = nil, bottomLabel: CGFloat? = nil, clockView: CGFloat? = nil, spacer3: CGFloat? = nil, mainButtonView: CGFloat? = nil, spacer4: CGFloat? = nil) {
        
        spacer1Constraint?.isActive = false
        topLabelConstraint?.isActive = false
        spacer2Constraint?.isActive = false
        bottomLabelConstraint?.isActive = false
        clockViewConstraint?.isActive = false
        spacer3Constraint?.isActive = false
        mainButtonViewConstraint?.isActive = false
        spacer4Constraint?.isActive = false
        
        self.layoutIfNeeded()

        spacer1Multiplier = spacer1 ?? spacer1Multiplier
        topLabelMultiplier = topLabel ?? topLabelMultiplier
        spacer2Multiplier = spacer2 ?? spacer2Multiplier
        bottomLabelMultiplier = bottomLabel ?? bottomLabelMultiplier
        clockViewMultiplier = clockView ?? clockViewMultiplier
        spacer3Multiplier = spacer3 ?? spacer3Multiplier
        mainButtonViewMultiplier = mainButtonView ?? mainButtonViewMultiplier
        spacer4Multiplier = spacer4 ?? spacer4Multiplier
        
        /*
        guard (spacer1Multiplier + topLabelMultiplier + spacer2Multiplier + bottomLabelMultiplier + clockViewMultiplier + mainButtonViewMultiplier + spacer4Multiplier) == 1 else {
            let message = """
            _________________________
            Stopped At - \(label)
            total - \(spacer1Multiplier + topLabelMultiplier + spacer2Multiplier + bottomLabelMultiplier + clockViewMultiplier + mainButtonViewMultiplier + spacer4Multiplier)

            s1 - \(spacer1Multiplier)
            top label - \(topLabelMultiplier)
            s2 - \(spacer2Multiplier)
            bottom label - \(bottomLabelMultiplier)
            clock view - \(clockViewMultiplier)
            main button - \(mainButtonViewMultiplier)
            s4 - \(spacer4Multiplier)

            """
            fatalError(message)
        }
        */
        
        spacer1Constraint = self.spacer1.heightAnchor.constraint(equalTo: mainStack.heightAnchor, multiplier: spacer1Multiplier)
        topLabelConstraint = self.topLabelView.heightAnchor.constraint(equalTo: mainStack.heightAnchor, multiplier: topLabelMultiplier)
        spacer2Constraint = self.spacer2.heightAnchor.constraint(equalTo: mainStack.heightAnchor, multiplier: spacer2Multiplier)
        bottomLabelConstraint = self.bottomLabelView.heightAnchor.constraint(equalTo: mainStack.heightAnchor, multiplier: bottomLabelMultiplier)
        clockViewConstraint = self.clockView.heightAnchor.constraint(equalTo: mainStack.heightAnchor, multiplier: clockViewMultiplier)
        spacer3Constraint = self.spacer3.heightAnchor.constraint(equalTo: mainStack.heightAnchor, multiplier: spacer3Multiplier)
        mainButtonViewConstraint = self.mainButtonView.heightAnchor.constraint(equalTo: mainStack.heightAnchor, multiplier: mainButtonViewMultiplier)
        spacer4Constraint = self.spacer4.heightAnchor.constraint(equalTo: mainStack.heightAnchor, multiplier: spacer4Multiplier)
        
        spacer1Constraint.isActive = true
        topLabelConstraint.isActive = true
        spacer2Constraint.isActive = true
        bottomLabelConstraint.isActive = true
        clockViewConstraint.isActive = true
        spacer3Constraint.isActive = true
        mainButtonViewConstraint.isActive = true
        spacer4Constraint.isActive = true
        
        self.layoutIfNeeded()
    }
}

//introView animations
extension IntroView {
    
    //Initial animations
    func introAnimation() {
        
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

            self.adjustConstraints(label: "animation 5", spacer1: 0.1, spacer4: 0.3)
        }
        
        let animation6 = {
            
            self.adjustConstraints(label: "animation 6", spacer1: 0.05, clockView: 0.25, spacer3: 0.05, spacer4: 0.25)
            
            self.clockView.constrainChild(self.clock, padding: 5)
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
        let durations = [0.1, 0.1, 0.1, 0.1, 0.125, 0.125, 0.025, 0.025, 0.025, 0.025, 0.025, 0.025, 0.025, 0.025, 0.025, 0.025]
        
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
    
    @objc func dismissAnimation() {
        
        print("dismiss")
        
        let animation1 = {
            self.spacer1Constraint.isActive = false
            self.mainStack.removeArrangedSubview(self.spacer1)
        }
        
        let animation2 = {
            self.topLabelConstraint.isActive = false
            self.mainStack.removeArrangedSubview(self.topLabel)
        }
        
        let animation3 = {
            self.mainStack.removeArrangedSubview(self.spacer2)
        }
        
        let animation4 = {
            self.mainStack.removeArrangedSubview(self.bottomLabel)
        }
        
        let animation5 = {
            self.mainStack.removeArrangedSubview(self.clockView)
        }
        
        let animation6 = {
            

        }
        
        let animation7 = {

        }
        
        let animation8 = {

        }
        
        let animation9 = {

        }
        
        let animation10 = {
      
        }
        
        let animation11 = {
        
        }
        
        let animation12 = {
           
        }
        
        let animation13 = {
          
        }
        
        let animation14 = {
           
        }

        let duration: TimeInterval = 10
        //let animations = [animation1, animation2, animation3, animation4, animation5, animation6, animation7, animation7, animation8, animation9, animation10,
        //animation11, animation12, animation13, animation14]
        let animations = [animation1, animation2, animation3, animation4, animation5]
        let durations = [0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.025, 0.025, 0.025, 0.025, 0.025, 0.025, 0.025, 0.025, 0.025, 0.025]
        
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
