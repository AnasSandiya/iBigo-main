//
//  vcPlan.swift
//  iBigo
//
//  Created by Mac on 8/7/21.
//

import UIKit

class vcPlan: UIViewController {

    @IBOutlet weak var vTop: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        vTop.addBorder(toSide: .Bottom, withColor: #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5764705882, alpha: 0.05), andThickness: 1.0)
        #colorLiteral(red: 0.6705882353, green: 0.5764705882, blue: 1, alpha: 1)
        // Do any additional setup after loading the view.
    }
    
    

    @IBAction func btnBackPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)

    }


}
