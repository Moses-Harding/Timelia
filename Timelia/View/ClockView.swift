//
//  ClockView.swift
//  Timelia
//
//  Created by Moses Harding on 3/7/21.
//

import UIKit


class ClockView: UIView {
    
    var topStack: UIStackView!
    var midStack: UIStackView!
    var bottomStack: UIStackView!
    var verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        return stack
    }()
    
    var topLeftView = UIView()
    var topMidView = UIView()
    var topRightView = UIView()
    var midLeftView = UIView()
    var midMidView = UIView()
    var midRightView = UIView()
    var bottomLeftView = UIView()
    var bottomMidView = UIView()
    var bottomRightView = UIView()
    
    init() {
        super.init(frame: CGRect.zero)
        
        self.constrainChild(verticalStack, exceptions: [.leading, .trailing])
        verticalStack.widthAnchor.constraint(equalTo: verticalStack.heightAnchor).isActive = true
        verticalStack.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        topStack = UIStackView(arrangedSubviews: [topLeftView, topMidView, topRightView])
        topStack.distribution = .fillEqually
        
        midStack = UIStackView(arrangedSubviews: [midLeftView, midMidView, midRightView])
        midStack.distribution = .fillEqually
        
        bottomStack = UIStackView(arrangedSubviews: [bottomLeftView, bottomMidView, bottomRightView])
        bottomStack.distribution = .fillEqually
        
        verticalStack.addArrangedSubview(topStack)
        verticalStack.addArrangedSubview(midStack)
        verticalStack.addArrangedSubview(bottomStack)
        
        topLeftView.backgroundColor = .blue
        
        /*
        topLeftView.isHidden = true
        topMidView.isHidden = true
        topRightView.isHidden = true
        midLeftView.isHidden = true
        //midMidView.isHidden = true
        midRightView.isHidden = true
        bottomLeftView.isHidden = true
        bottomMidView.isHidden = true
        bottomRightView.isHidden = true
        */
    }
    
    func drawShapes() {
  
        drawVerticalLine(topMidView)
        drawVerticalLine(bottomMidView)
        drawHorizontalLine(midLeftView)
        drawHorizontalLine(midRightView)
        
        drawRightDiagonal(topRightView)
        drawRightDiagonal(bottomLeftView)
        drawLeftDiagonal(topLeftView)
        drawLeftDiagonal(bottomRightView)
    }

    
    func drawVerticalLine(_ currentView: UIView) {
        
        let imageView = UIImageView(image: UIImage(named: "Line - Vertical"))
        
        imageView.contentMode = .scaleAspectFit
        currentView.constrainChild(imageView)
    }
    
    func drawHorizontalLine(_ currentView: UIView) {

        let imageView = UIImageView(image: UIImage(named: "Line - Horizontal"))
        
        imageView.contentMode = .scaleAspectFit
        currentView.constrainChild(imageView)
    }
    
    func drawRightDiagonal(_ currentView: UIView) {
        
        let imageView = UIImageView(image: UIImage(named: "Line - Ascending"))
        
        currentView.constrainChild(imageView)

    }
    
    func drawLeftDiagonal(_ currentView: UIView) {
        
        let imageView = UIImageView(image: UIImage(named: "Line - Descending"))
        
        currentView.constrainChild(imageView)
    }
    
    func animate() {

        let animate1 = {
            self.drawLeftDiagonal(self.topLeftView)
            self.topLeftView.isHidden = false
        }
        
        let animate2 = {
            self.drawVerticalLine(self.topMidView)
            self.topMidView.isHidden = false
        }
        
        let animate3 = {
            self.drawRightDiagonal(self.topRightView)
            self.topRightView.isHidden = false
        }
        
        let animate4 = {
            self.drawHorizontalLine(self.midRightView)
            self.midRightView.isHidden = false
        }
        
        let animate5 = {
            self.drawLeftDiagonal(self.bottomRightView)
            self.bottomRightView.isHidden = false
        }
        
        let animate6 = {
            self.drawVerticalLine(self.bottomMidView)
            self.bottomMidView.isHidden = false
        }
        
        let animate7 = {
            self.drawRightDiagonal(self.bottomLeftView)
            self.bottomLeftView.isHidden = false
        }
        
        let animate8 = {
            self.drawHorizontalLine(self.midLeftView)
            self.midLeftView.isHidden = false
        }
        
        let animations = [animate1, animate2, animate3, animate4, animate5, animate6, animate7, animate8]
        
        let duration: TimeInterval = 7
        let animationCount = Double(animations.count)
        let animationDuration = 1 / animationCount
        
        
        var iterator: Double = 0
        
        UIView.animateKeyframes(withDuration: duration, delay: 7, options: [.calculationModeCubic, .layoutSubviews]) {
            
            animations.forEach { animation in
                UIView.addKeyframe(withRelativeStartTime: iterator, relativeDuration: animationDuration, animations: animation)
                iterator += animationDuration
            }
        }
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
