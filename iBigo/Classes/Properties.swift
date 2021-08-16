//
//  properties.swift
//  iBigo
//
//  Created by pc link on 29/06/2021.
//

//
import UIKit
import Foundation
import StepProgressBar




class properties{
    
    static var progressbar = StepProgressBar()
    
    
    

    public static func showAnimate(MyView: UIView )
     {
         MyView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
         MyView.alpha = 0.0;
         UIView.animate(withDuration: 0.25, animations: {
             MyView.alpha = 1.0
             MyView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
         });
         //  shadowView.dropShadow(color: .black, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 11, cornerRadius: 10, scale: true)
     }
     
    public static func removeAnimate(MyView: UIView)
     {
         UIView.animate(withDuration: 0.25, animations: {
             MyView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
             MyView.alpha = 0.0;
         }, completion:{(finished : Bool)  in
             if (finished)
             {
                 MyView.removeFromSuperview()
                 MyView.isHidden = false
             }
         });
     }
    
    public static func buttonProperties(button:UIButton ,titleColor:UIColor ,  borderColor: CGColor , bgColor : UIColor , cornerRadius: CGFloat , borderWidth: CGFloat){
        button.setTitleColor(titleColor, for: .normal)
        button.backgroundColor = bgColor
        button.layer.cornerRadius = cornerRadius
        button.layer.borderWidth = borderWidth
        button.layer.borderColor = borderColor
    }
    public static func labelProperties(label:UILabel, fontName:String , fontSize: CGFloat){
       
        
        label.font = UIFont(name: fontName, size: fontSize)      

    }

    
    
    
    public static func textfieldProperties(textfield:UITextField ,titleColor:UIColor ,  borderColor: CGColor , bgColor : UIColor , cornerRadius: CGFloat , borderWidth: CGFloat){
        
        //Basic texfield Setup
        textfield.borderStyle = .roundedRect
        textfield.backgroundColor = bgColor //UIColor.groupTableViewBackground // Use anycolor that give you a 2d look.

           //To apply corner radius
        textfield.layer.cornerRadius = cornerRadius

           //To apply border
        textfield.layer.borderWidth = borderWidth
        textfield.layer.borderColor = borderColor //UIColor.white.cgColor

           //To apply Shadow
        textfield.layer.shadowOpacity = 0.25
        textfield.layer.shadowRadius = 0.5
        textfield.layer.shadowOffset = CGSize.zero // Use any CGSize
        textfield.layer.shadowColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) //UIColor.gray.cgColor

//           //To apply padding
//        let paddingView : UIView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: textfield.layer.frame.height))
//        textfield.leftView = paddingView
//        textfield.leftViewMode = UITextField.ViewMode.always
        
        
        
        
        
//        textfield.backgroundColor = bgColor
//        textfield.layer.cornerRadius = cornerRadius
//        textfield.layer.borderWidth = borderWidth
//        textfield.layer.borderColor = borderColor
//        textfield.layer.masksToBounds = true
        
        
        
        
        
    }
    
    public static func ViewProperties(myview:UIView , borderColor: CGColor , cornerRadius: CGFloat , borderWidth: CGFloat){

        
        myview.layer.cornerRadius = cornerRadius
        myview.layer.borderWidth = borderWidth
        myview.layer.borderColor = borderColor
        
    }
    
    
    
    

}

