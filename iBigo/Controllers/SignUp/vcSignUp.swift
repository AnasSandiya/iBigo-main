//
//  vcSignUp.swift
//  iBigo
//
//  Created by pc link on 29/06/2021.
//

import UIKit
import StepProgressBar
import CountryPickerView
import BEMCheckBox
import FMSecureTextField

class vcSignUp: UIViewController, CountryPickerViewDelegate, CountryPickerViewDataSource ,UIScrollViewDelegate ,UITextFieldDelegate  {

    
    // MARK: - Initialization
    @IBOutlet weak var cbAgreement: BEMCheckBox!
    @IBOutlet weak var cbAccept: BEMCheckBox!
    @IBOutlet weak var stepProgress: NSLayoutConstraint!
    @IBOutlet weak var cpvCountry: CountryPickerView!
    @IBOutlet weak var stepProgressbar: StepProgressBar!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var vPasswordText: UIView!
    @IBOutlet weak var txtPassword: FMSecureTextField!
    @IBOutlet weak var txtConfirmPassword: FMSecureTextField!
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x != 0 {
            scrollView.contentOffset.x = 0
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if let nextField = textField.superview?.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        
        }else{
            textField.resignFirstResponder()
        }
      
           
        return false
    }
    
    
    // MARK: - Tableview delegate methods
    
    // MARK: - CollectionView delegate methods
    
    // MARK: - ViewController delegate methods
    override func viewDidLoad() {
        super.viewDidLoad()
        cpvCountry.delegate = self
        cpvCountry.dataSource = self
      //  self.hideKeyboardWhenTappedAround()
        SetupView()
    }
    override func viewDidAppear(_ animated: Bool) {
        let backbutton = UIButton(type: .custom)
        backbutton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        backbutton.setTitle("", for: .normal)
        backbutton.setTitleColor(backbutton.tintColor, for: .normal) // You can change the TitleColor
        backbutton.addTarget(self, action: #selector(self.backAction(_:)), for: .touchUpInside)
        backbutton.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
//        self.navigationController?.navigationBar.setBackgroundImage(nil, for:.default)
//        self.navigationController?.navigationBar.shadowImage = nil
//        self.navigationController?.navigationBar.layoutIfNeeded()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backbutton)
        
 
        self.vPasswordText.layer.borderColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.9764705882, alpha: 1)
        self.vPasswordText.layer.borderWidth = 1.0
        self.vPasswordText.layer.cornerRadius = 15.0
        
        self.txtPassword.layer.borderColor = #colorLiteral(red: 0.1843137255, green: 0.4941176471, blue: 0.7215686275, alpha: 1)
        self.txtPassword.layer.borderWidth = 1.0
        self.txtPassword.layer.cornerRadius = 6.0
        
        self.txtConfirmPassword.layer.borderColor = #colorLiteral(red: 0.1843137255, green: 0.4941176471, blue: 0.7215686275, alpha: 1)
        self.txtConfirmPassword.layer.borderWidth = 1.0
        self.txtConfirmPassword.layer.cornerRadius = 6.0
        
         scrollView.delegate = self
            
            if #available(iOS 11.0, *) {
                scrollView.contentInsetAdjustmentBehavior = .never
            } else {
                automaticallyAdjustsScrollViewInsets = false
            }
            
        
    }
    
    // MARK: - Textfeild delegate methods
    
    // MARK: - Methods
    func countryPickerView(_ countryPickerView: CountryPickerView, didSelectCountry country: Country) {
        print(country)
    }
    private func SetupView(){
        
        
        
        cpvCountry.showCountryCodeInView = false
        cbAccept.boxType = .square
        cbAgreement.boxType = .square
        cbAccept.onFillColor = #colorLiteral(red: 0.6708214283, green: 0.5866119862, blue: 1, alpha: 1)
        cbAgreement.onFillColor = #colorLiteral(red: 0.6708214283, green: 0.5866119862, blue: 1, alpha: 1)
        cbAccept.onCheckColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        cbAgreement.onCheckColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        
        for view in self.view.subviews as [UIView] {
            if let scrollView = view as? UIScrollView {
                for subScrollViews in scrollView.subviews as [UIView] {
                    for v in subScrollViews.subviews as [UIView] {
                        if let stackView = v as? UIStackView {
                            for stackViews in stackView.subviews as [UIView] {
                             //   print(stackView.subviews , "LLLL")
//                                if let subviews = stackViews.subviews as? UIView {
//                                    if let txt = subviews as? UITextField {
//                                        print(txt)
//                                        txt.text = "hkjhkj"
//                                        txt.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//                                        properties.textfieldProperties(textfield: txt, titleColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), borderColor: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1) , bgColor: #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.9764705882, alpha: 1),cornerRadius: 5.0,borderWidth: 0.15)
//                                        txt.delegate = self
//                                    }
//                                }
                                
                                if let v = stackViews as? UIView {
                                    for vSubview in v.subviews as [UIView] {
                                        if let txt = vSubview as? UITextField {
                                            properties.textfieldProperties(textfield: txt, titleColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), borderColor: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1) , bgColor: #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.9764705882, alpha: 1),cornerRadius: 5.0,borderWidth: 0.15)
                                            txt.delegate = self

                                        }
                                    }
                                    //nobutton
                                }
                                
                                if stackViews is UIButton {
                                    //nobutton
                                }
                                if let txt = stackViews as? UITextField {
                                    
                                //    properties.textfieldProperties(textfield: txt, titleColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), borderColor: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1) , bgColor: #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.9764705882, alpha: 1),cornerRadius: 5.0,borderWidth: 0.15)
                                    txt.delegate = self
                                    
                                }
                                if let lbl = stackViews as? UILabel {
                                    properties.labelProperties(label: lbl, fontName: "OpenSans-Regular", fontSize: 13.0)
                                }
                              
                            }
                        }
                        if let btn = v as? UIButton {
                            if let text = btn.titleLabel?.text {
                                if(text.isEqualToString(find: "Next")){
                                    properties.buttonProperties(button: btn, titleColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), borderColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) , bgColor: #colorLiteral(red: 0.6708214283, green: 0.5866119862, blue: 1, alpha: 1),cornerRadius: 10,borderWidth: 1)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    @IBAction func backAction(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "vcSignIn") as! vcSignIn
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated:true, completion:nil)
    }
    

}
              
    
    


    
