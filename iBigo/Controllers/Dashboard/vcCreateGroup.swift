//
//  vcCreateGroup.swift
//  iBigo
//
//  Created by Mac on 8/7/21.
//

import UIKit

class vcCreateGroup: UIViewController {

    @IBOutlet weak var vRemoveAdmin: UIView!
    @IBOutlet weak var vAdmin: UIView!
    @IBOutlet weak var vTop: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        vTop.addBorder(toSide: .Bottom, withColor: #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5764705882, alpha: 0.05), andThickness: 1.0)

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnBackPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        properties.ViewProperties(myview: self.vAdmin, borderColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.05), cornerRadius: 8.0, borderWidth: 1.0)
        properties.ViewProperties(myview: self.vRemoveAdmin, borderColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.05), cornerRadius: 8.0, borderWidth: 1.0)
    }


}
