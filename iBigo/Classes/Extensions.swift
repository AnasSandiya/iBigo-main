//
//  Extensions.swift
//  iBigo
//
//  Created by pc link on 01/07/2021.
//

import Foundation
import UIKit

//@IBDesignable
//    class DesignableSegmentControl: UISegmentedControl{
//    }
//    extension UISegmentedControl{
//        @IBInspectable
//        var textColor: UIColor{
//            get {
//                return self.textColor
//            }
//            set {
//                let unselectedAttributes = [NSAttributedString.Key.foregroundColor: newValue,
//                                            NSAttributedString.Key.font:  UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.regular)]
//                self.setTitleTextAttributes(unselectedAttributes, for: .normal)
//                self.setTitleTextAttributes(unselectedAttributes, for: .selected)
//            }
//        }
//    }

extension UISegmentedControl{
    

    func removeBorder(){
        let backgroundImage = UIImage.getColoredRectImageWith(color: UIColor.white.cgColor, andSize: self.bounds.size)
        self.setBackgroundImage(backgroundImage, for: .normal, barMetrics: .default)
        self.setBackgroundImage(backgroundImage, for: .selected, barMetrics: .default)
        self.setBackgroundImage(backgroundImage, for: .highlighted, barMetrics: .default)

        let deviderImage = UIImage.getColoredRectImageWith(color: UIColor.white.cgColor, andSize: CGSize(width: 1.0, height: self.bounds.size.height))
        self.setDividerImage(deviderImage, forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 67/255, green: 129/255, blue: 244/255, alpha: 1.0)], for: .selected)
    }

    func addUnderlineForSelectedSegment(){
        removeBorder()
        let underlineWidth: CGFloat =  30.0 //self.bounds.size.width / CGFloat(self.numberOfSegments)
        let underlineHeight: CGFloat = 2.0
        let underlineXPosition = CGFloat(((self.bounds.size.width / CGFloat(self.numberOfSegments)) / 2) - 15.0)
        //CGFloat(selectedSegmentIndex * Int(underlineWidth))
     //   print(underlineXPosition , "FIRST")
        let underLineYPosition = self.bounds.size.height - 1.0
        let underlineFrame = CGRect(x: underlineXPosition, y: underLineYPosition, width: underlineWidth, height: underlineHeight)
        let underline = UIView(frame: underlineFrame)
        underline.backgroundColor =  #colorLiteral(red: 0.6708214283, green: 0.5866119862, blue: 1, alpha: 1) // UIColor(red: 67/255, green: 129/255, blue: 244/255, alpha: 1.0)
        underline.tag = 1
        self.addSubview(underline)
    }

    func changeUnderlinePosition(){
        guard let underline = self.viewWithTag(1) else {return}
       // print(underline , "UNDERLINE")
     //   let underlineFinalXPosition = (self.bounds.width / CGFloat(self.numberOfSegments)) * CGFloat(selectedSegmentIndex)
        let underlineFinalXPosition =  CGFloat(((self.bounds.size.width / CGFloat(self.numberOfSegments)) / 2) - 15.0) + (self.bounds.width / CGFloat(self.numberOfSegments)) * CGFloat(selectedSegmentIndex)
    //    print(underlineFinalXPosition , "underlineFinalXPosition")
        UIView.animate(withDuration: 0.1, animations: {
            underline.frame.origin.x = underlineFinalXPosition
        })
    }
}

extension UIImage{

    class func getColoredRectImageWith(color: CGColor, andSize size: CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        let graphicsContext = UIGraphicsGetCurrentContext()
        graphicsContext?.setFillColor(color)
        let rectangle = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        graphicsContext?.fill(rectangle)
        let rectangleImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return rectangleImage!
    }
}

extension UIImageView {
    
    func addOverlay(color: UIColor) {
        
        let overlay: UIView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
        overlay.backgroundColor = color
        overlay.tag = 1
        overlay.alpha = 0.3
        
        // Check if overlay already exists before adding it
        if self.viewWithTag(1) == nil {
            self.addSubview(overlay)
        }
    }
    
}
extension UIView {
    
    // Example use: myView.addBorder(toSide: .Left, withColor: UIColor.redColor().CGColor, andThickness: 1.0)
    
    enum ViewSide {
        case Left, Right, Top, Bottom
    }
    
    func addBorder(toSide side: ViewSide, withColor color: CGColor, andThickness thickness: CGFloat) {
        
        let border = CALayer()
        border.backgroundColor = color
        
        switch side {
        case .Left: border.frame = CGRect(x: frame.minX, y: frame.minY, width: thickness, height: frame.height); break
        case .Right: border.frame = CGRect(x: frame.maxX, y: frame.minY, width: thickness, height: frame.height); break
        case .Top: border.frame = CGRect(x: frame.minX, y: frame.minY , width: frame.width , height: thickness); break
        case .Bottom: border.frame = CGRect(x: frame.minX, y: frame.maxY - 2.0, width: frame.width + 8.0, height: thickness); break
        }
        
        layer.addSublayer(border)
    }
}
extension UICollectionView {
    
    // Example use: myView.addBorder(toSide: .Left, withColor: UIColor.redColor().CGColor, andThickness: 1.0)
    
    enum ViewSide {
        case Left, Right, Top, Bottom
    }
    
    func addCollectionViewBorder(toSide side: ViewSide, withColor color: CGColor, andThickness thickness: CGFloat) {
        
        let border = CALayer()
        border.backgroundColor = color
        
        switch side {
        case .Left: border.frame = CGRect(x: frame.minX, y: frame.minY, width: thickness, height: frame.height); break
        case .Right: border.frame = CGRect(x: frame.maxX, y: frame.minY, width: thickness, height: frame.height); break
        case .Top: border.frame = CGRect(x: frame.minX, y: frame.minY, width: frame.width, height: thickness); break
        case .Bottom: border.frame = CGRect(x: frame.minX, y: frame.maxY, width: frame.width, height: thickness); break
        }
        
        layer.addSublayer(border)
    }
}
//extension UIViewController {
//    func hideKeyboardWhenTappedAround() {
//        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
//        tap.cancelsTouchesInView = false
//        view.addGestureRecognizer(tap)
//    }
//    
//    @objc func dismissKeyboard() {
//        view.endEditing(true)
//    }
//}

extension String {
     func isEqualToString(find: String) -> Bool {
        return String(format: self) == find
    }
}

extension UIImageView {
  public func maskCircle(anyImage: UIImage) {
    self.contentMode = UIView.ContentMode.scaleAspectFill
    self.layer.cornerRadius = 80.0
    self.layer.masksToBounds = false
    self.clipsToBounds = true

   // make square(* must to make circle),
   // resize(reduce the kilobyte) and
   // fix rotation.
   self.image = anyImage
  }
}


extension Date {
    
    func dateString(_ format: String = "MMM-dd-YYYY, hh:mm a") -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        return dateFormatter.string(from: self)
    }
    
    func dateByAddingYears(_ dYears: Int) -> Date {
        
        var dateComponents = DateComponents()
        dateComponents.year = dYears
        
        return Calendar.current.date(byAdding: dateComponents, to: self)!
    }
}

extension UITextField {

    //MARK:- Set Image on the right of text fields

    func setupRightImage(imageName:String , imgContainerHeight: CGFloat){
    let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
    imageView.image = UIImage(named: imageName)
        let imageContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width:35, height: imgContainerHeight))
    imageContainerView.addSubview(imageView)
    rightView = imageContainerView
    rightViewMode = .always
    self.tintColor = .lightGray
}

 //MARK:- Set Image on left of text fields

    func setupLeftImage(imageName:String){
       let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
       imageView.image = UIImage(named: imageName)
       let imageContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 55, height: 40))
       imageContainerView.addSubview(imageView)
       leftView = imageContainerView
       leftViewMode = .always
       self.tintColor = .lightGray
     }

  }

extension UITextField {
    
    fileprivate func setPasswordToggleImage(_ button: UIButton) {
        if(isSecureTextEntry){
            button.setImage(UIImage(named: "ic_password_visible"), for: .normal)
        }else{
            button.setImage(UIImage(named: "ic_password_invisible"), for: .normal)

        }
    }

    func enablePasswordToggle(){
        let button = UIButton(type: .custom)
        setPasswordToggleImage(button)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        button.frame = CGRect(x: CGFloat(self.frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
        button.addTarget(self, action: #selector(self.togglePasswordView), for: .touchUpInside)
        self.rightView = button
        self.rightViewMode = .always
    }
    @IBAction func togglePasswordView(_ sender: Any) {
        self.isSecureTextEntry = !self.isSecureTextEntry
        setPasswordToggleImage(sender as! UIButton)
    }
}
