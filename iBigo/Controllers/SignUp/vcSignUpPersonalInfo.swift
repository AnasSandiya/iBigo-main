//
//  vcSignUpPersonalInfo.swift
//  iBigo
//
//  Created by pc link on 29/06/2021.
//

import UIKit
import DLRadioButton
import DropDown //1




class vcSignUpPersonalInfo: UIViewController, UITextFieldDelegate {
    
    
    
// MARK: - Initialization
    let dropDown = DropDown() //2
    @IBOutlet weak var rbGender: DLRadioButton!
    @IBOutlet weak var ddlCities: DropDown!
    @IBOutlet weak var txtBirthdate: UITextField!
    
// MARK: - Tableview delegate methods
    
// MARK: - CollectionView delegate methods
    
// MARK: - ViewController delegate methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtBirthdate.delegate = self
        self.SetupView()
     //   self.hideKeyboardWhenTappedAround()

    }
    override func viewDidAppear(_ animated: Bool) {
      //  ddlCities.handleKeyboard = true

    }
    
// MARK: - Textfeild delegate methods
    
    
// MARK: - Methods
    
    @objc func myTargetFunction(textField: UITextField) {
        print("myTargetFunction")
        
        RPicker.selectDate(title: "Select Date", cancelText: "Cancel", datePickerMode: .date, style: .Inline, didSelectDate: {[weak self] (selectedDate) in
            self?.txtBirthdate.text = selectedDate.dateString("dd-MMM-yyyy")
        })
    }
    @IBAction func tapChooseMenuItem(_ sender: UIButton) {//3
        dropDown.dataSource = ["Tomato soup", "Mini burgers", "Onion rings", "Baked potato", "Salad"]//4
        dropDown.anchorView = sender //5
        dropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height) //6
        dropDown.show() //7
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
          guard let _ = self else { return }
          sender.setTitle(item, for: .normal) //9
        }
      }
    private func SetupView(){
        
//        ddlCities.optionArray = ["Option 1", "Option 2", "Option 3"]
//        txtBirthdate.addTarget(self, action: #selector(myTargetFunction), for: .touchDown)
//        ddlCities.didSelect{(selectedText , index ,id) in
//            print("Selected String: \(selectedText) \n index: \(index)")
//     //   self.ddlCities.text = "Selected String: \(selectedText) \n index: \(index)"
//        }
        for view in self.view.subviews as [UIView] {
            if let btn = view as? UIButton {
                if let text = btn.titleLabel?.text {
                    if(text.isEqualToString(find: "Next")){
                        properties.buttonProperties(button: btn, titleColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), borderColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) , bgColor: #colorLiteral(red: 0.6708214283, green: 0.5866119862, blue: 1, alpha: 1),cornerRadius: 10,borderWidth: 1)
                    }
                }
            }
        }
    }
}
