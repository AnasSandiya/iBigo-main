//
//  vcChatDetails.swift
//  iBigo
//
//  Created by pc link on 05/08/2021.
//

import UIKit

class vcChatDetails: UIViewController {

    @IBOutlet weak var vOne: UIView!
    @IBOutlet weak var vTwo: UIView!
    @IBOutlet weak var vThree: UIView!
    @IBOutlet weak var vFour: UIView!
    @IBOutlet weak var vAdd: UIView!
    @IBOutlet weak var txtChat: UITextField!
    @IBOutlet weak var vTop: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
        
            //  txtChat.layer.cornerRadius = 22.0
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        vTop.addBorder(toSide: .Bottom, withColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.05), andThickness: 1.0)

        properties.ViewProperties(myview: vOne, borderColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.05), cornerRadius: 8.0, borderWidth: 1.0)
        properties.ViewProperties(myview: vTwo, borderColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.05), cornerRadius: 8.0, borderWidth: 1.0)
        properties.ViewProperties(myview: vThree, borderColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.05), cornerRadius: 8.0, borderWidth: 1.0)
        properties.ViewProperties(myview: vFour, borderColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.05), cornerRadius: 8.0, borderWidth: 1.0)
        
        properties.ViewProperties(myview: vAdd, borderColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), cornerRadius: 16.0, borderWidth: 0.0)
        
        
        self.txtChat.layer.cornerRadius = 25.0
        
        
     //   properties.textfieldProperties(textfield: self.txtChat, titleColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), borderColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), bgColor: #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.9764705882, alpha: 1), cornerRadius: 52.0, borderWidth: 0.0)
        
    }
    

    
    @IBAction func btnBackPressed(_ sender: Any) {
 //       self.remove()
        dismiss(animated: true, completion: nil)

    }

  

}
