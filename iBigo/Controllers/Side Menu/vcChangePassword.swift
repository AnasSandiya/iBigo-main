//
//  vcChangePassword.swift
//  iBigo
//
//  Created by Mac on 7/22/21.
//

import UIKit
import FMSecureTextField



class vcChangePassword: UIViewController {
    
    
    @IBOutlet var txtOld: FMSecureTextField!{
        didSet{
            txtOld.secureViewShowMode = .whileEditing
        }
        
    }
    @IBOutlet var txtNew: FMSecureTextField!{
        didSet{
            txtNew.secureViewShowMode = .whileEditing
        }
        
    }
    
    @IBOutlet var txtConfirm: FMSecureTextField!{
        didSet{
            txtConfirm.secureViewShowMode = .whileEditing
        }
        
    }


    @IBOutlet weak var vTop: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        vTop.addBorder(toSide: .Bottom, withColor: #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5764705882, alpha: 0.05), andThickness: 1.0)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnBackPressed(_ sender: Any) {
 //       self.remove()
        dismiss(animated: true, completion: nil)

    }
   

}
