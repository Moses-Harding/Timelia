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
        
        self.drawShapes()
        
        
        topLeftView.alpha = 0
        topMidView.alpha = 0
        topRightView.alpha = 0
        midLeftView.alpha = 0
        midRightView.alpha = 0
        bottomLeftView.alpha = 0
        bottomMidView.alpha = 0
        bottomRightView.alpha = 0
        
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
    
    func animate(_ delay: TimeInterval) {
        
    }
    
    func animate(with delay: TimeInterval) {
        
        let animate1 = {
            //
        }
        
        let animate2 = {
            self.topMidView.alpha = 1
        }
        
        let animate3 = {
            self.topRightView.alpha = 1
        }
        
        let animate4 = {
            self.midRightView.alpha = 1
        }
        
        let animate5 = {
            self.bottomRightView.alpha = 1
        }
        
        let animate6 = {
            self.bottomMidView.alpha = 1
        }
        
        let animate7 = {
            self.bottomLeftView.alpha = 1
        }
        
        let animate8 = {
            self.midLeftView.alpha = 1
        }
        
        let animate9 = {
            self.topLeftView.alpha = 1
        }
        
        /*
         let animations = [animate2, animate3, animate4, animate5, animate6, animate7, animate8, animate9]
         
         let duration: TimeInterval = 0.1
         let animationCount = Double(animations.count)
         let animationDuration = 1 / animationCount
         
         var iterator: Double = 0
         
         UIView.animateKeyframes(withDuration: duration, delay: delay, options: [.layoutSubviews]) {
         
         animations.forEach { animation in
         UIView.addKeyframe(withRelativeStartTime: iterator, relativeDuration: animationDuration, animations: animation)
         iterator += animationDuration
         }
         }
         */
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
