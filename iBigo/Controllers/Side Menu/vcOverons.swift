//
//  vcOverons.swift
//  iBigo
//
//  Created by Mac on 7/22/21.
//

import UIKit

class vcOverons: UIViewController {

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
