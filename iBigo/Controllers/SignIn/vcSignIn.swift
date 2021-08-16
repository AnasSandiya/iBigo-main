//
//  vcSignIn.swift
//  iBigo
//
//  Created by pc link on 29/06/2021.
//

import UIKit
import FMSecureTextField
import IQKeyboardManagerSwift


class vcSignIn: UIViewController {

// MARK: - Initialization
    
    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var btnCreateNewAccount: UIButton!
 
    
    @IBOutlet var passwordTextField: FMSecureTextField!{
        didSet{
           // passwordTextField.secureViewShowMode = .whileEditing
        }
        
    }

    
   
// MARK: - Tableview delegate methods
    
// MARK: - CollectionView delegate methods
    
// MARK: - ViewController delegate methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  self.hideKeyboardWhenTappedAround()
        self.SetupView()
       
    }
  
    override func viewDidAppear(_ animated: Bool) {
      //  self.txtPassword.enablePasswordToggle()
    }
    
// MARK: - Textfeild delegate methods
    
// MARK: - Methods
    
    private func SetupView(){
        for view in self.view.subviews as [UIView] {
            if let stackView = view as? UIStackView {
                for stackViews in stackView.subviews as [UIView] {
                    if let btn = stackViews as? UIButton {
                        if let text = btn.titleLabel?.text {
                            if(text.isEqualToString(find: "Sign In")){
                                  properties.buttonProperties(button: btn, titleColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), borderColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) , bgColor: #colorLiteral(red: 0.6708214283, green: 0.5866119862, blue: 1, alpha: 1),cornerRadius: 10,borderWidth: 1)
                            }else if(text.isEqualToString(find: "Create new account")){
                                 properties.buttonProperties(button: btn, titleColor: #colorLiteral(red: 0.6708214283, green: 0.5866119862, blue: 1, alpha: 1) , borderColor: #colorLiteral(red: 0.6708214283, green: 0.5866119862, blue: 1, alpha: 1), bgColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),cornerRadius: 10,borderWidth: 1)
                            }
                        }
                    }
//                    if let lbl = stackViews as? UILabel {
//                        if(lbl.text == "Lets Get Started"){
//                            properties.labelProperties(label: lbl, title: lbl.text ?? "", fontName: "SFProDisplay-Regular", fontSize: 12.0, fontWeight: false)
//                        }
//                        if(lbl.text == "Sign In"){
//                            properties.labelProperties(label: lbl, title: lbl.text ?? "", fontName: "SFProDisplay-Regular", fontSize: 20.0, fontWeight: true)
//                        }
//                    }
                    
                    if let txt = stackViews as? UITextField {
                    //    properties.textfieldProperties(textfield: txt, titleColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), borderColor: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1) , bgColor: #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.9764705882, alpha: 1),cornerRadius: 5.0,borderWidth: 0.00)
                    }
                }
            }
        }
    }

   

}
