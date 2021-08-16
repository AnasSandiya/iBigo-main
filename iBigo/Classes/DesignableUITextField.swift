////
////  DesignableUITextField.swift
////  iBigo
////
////  Created by pc link on 01/07/2021.
////
//
//import UIKit
//
//@IBDesignable
//class DesignableUITextField: UITextField {
//
//    // Provides left padding for images
//    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
//        var textRect = super.leftViewRect(forBounds: bounds)
//        textRect.origin.x += leftPadding
//        return textRect
//    }
//
//    @IBInspectable var leftImage: UIImage? {
//        didSet {
//            updateView()
//        }
//    }
//
//    @IBInspectable var leftPadding: CGFloat = 0
//
//    @IBInspectable var color: UIColor = UIColor.lightGray {
//        didSet {
//            updateView()
//        }
//    }
//
//
//
//    func updateView() {
//        if let image = leftImage {
//            leftViewMode = UITextField.ViewMode.always
//            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
//            imageView.contentMode = .scaleAspectFit
//            imageView.image = image
//            // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
//            imageView.tintColor = color
//            leftView = imageView
//        } else {
//            leftViewMode = UITextField.ViewMode.never
//            leftView = nil
//        }
//
//        // Placeholder text color
//        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: color])
//    }
//}


import Foundation
import UIKit

protocol DesignableTextFieldDelegate: UITextFieldDelegate {
    func textFieldIconClicked(btn:UIButton)
}

@IBDesignable
class DesignableTextField: UITextField {

    @IBInspectable var insetX: CGFloat = 0
    @IBInspectable var insetY: CGFloat = 0

    // placeholder position
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: insetX, dy: insetY)
    }

    // text position
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: insetX, dy: insetY)
    }
    
    //Delegate when image/icon is tapped.
    private var myDelegate: DesignableTextFieldDelegate? {
        get { return delegate as? DesignableTextFieldDelegate }
    }

    @objc func buttonClicked(btn: UIButton){
        self.myDelegate?.textFieldIconClicked(btn: btn)
    }

    //Padding images on left
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += padding
        return textRect
    }

    //Padding images on Right
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.rightViewRect(forBounds: bounds)
        textRect.origin.x -= padding
        return textRect
    }

    @IBInspectable var padding: CGFloat = 10
    @IBInspectable var leadingImage: UIImage? { didSet { updateView() }}
    @IBInspectable var color: UIColor = UIColor.lightGray { didSet { updateView() }}
    @IBInspectable var imageColor: UIColor = UIColor.lightGray { didSet { updateView() }}
    @IBInspectable var rtl: Bool = false { didSet { updateView() }}

    func updateView() {
        rightViewMode = UITextField.ViewMode.never
        rightView = nil
        leftViewMode = UITextField.ViewMode.never
        leftView = nil

        if let image = leadingImage {
            let button = UIButton(type: .custom)
            button.frame = CGRect(x: 0, y: 0, width: 20, height: 20)

            let tintedImage = image.withRenderingMode(.alwaysTemplate)
            button.setImage(tintedImage, for: .normal)
            button.tintColor = imageColor

            button.setTitleColor(UIColor.clear, for: .normal)
            button.addTarget(self, action: #selector(buttonClicked(btn:)), for: UIControl.Event.touchDown)
            button.isUserInteractionEnabled = true

            if rtl {
                rightViewMode = UITextField.ViewMode.always
                rightView = button
            } else {
                leftViewMode = UITextField.ViewMode.always
                leftView = button
            }
        }

        // Placeholder text color
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: color])
    }
}
