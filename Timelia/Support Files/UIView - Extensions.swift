//
//  UIView - Extensions.swift
//  Timelia
//
//  Created by Moses Harding on 3/3/21.
//

import Foundation
import UIKit

enum ConstraintException {
    case leading, trailing, top, bottom
}

extension UIView {
    
    @discardableResult
    func constrainChild(_ child: UIView, padding: CGFloat = 0, exceptions: [ConstraintException] = []) -> (NSLayoutConstraint, NSLayoutConstraint, NSLayoutConstraint, NSLayoutConstraint) {
        
        self.addSubview(child)
        child.translatesAutoresizingMaskIntoConstraints = false
        
        let leadingConstraint = child.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding)
        let trailingConstraint = child.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding)
        let topConstraint = child.topAnchor.constraint(equalTo: self.topAnchor, constant: padding)
        let bottomConstraint = child.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -padding)
        
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        topConstraint.isActive = true
        bottomConstraint.isActive = true
        
        exceptions.forEach {
            switch $0 {
            case .leading:
                leadingConstraint.isActive = false
            case .trailing:
                trailingConstraint.isActive = false
            case .top:
                topConstraint.isActive = false
            case .bottom:
                bottomConstraint.isActive = false
            }
        }
        
        let constraintTuple = (leadingConstraint: leadingConstraint, trailingConstraint: trailingConstraint, topConstraint: topConstraint, bottomConstraint: bottomConstraint)
        
        return constraintTuple
    }
    
    @discardableResult
    func constrainAndScale(_ child: UIView, widthScale: CGFloat = 1.0, heightScale: CGFloat = 1.0) -> (NSLayoutConstraint, NSLayoutConstraint, NSLayoutConstraint, NSLayoutConstraint) {
        
        self.addSubview(child)
        child.translatesAutoresizingMaskIntoConstraints = false
        
        let centerXConstraint = child.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let centerYConstraint = child.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        let widthConstraint = child.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: widthScale)
        let heightConstraint = child.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: heightScale)
        
        centerXConstraint.isActive = true
        centerYConstraint.isActive = true
        widthConstraint.isActive = true
        heightConstraint.isActive = true
        
        let constraintTuple = (centerXConstraint: centerXConstraint, centerYConstraint: centerYConstraint, widthConstraint: widthConstraint, heightConstraint: heightConstraint)
        
        return constraintTuple
    }
}
