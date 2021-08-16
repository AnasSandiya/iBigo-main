//
//  vcContactUs.swift
//  iBigo
//
//  Created by Mac on 8/5/21.
//

import UIKit

class vcContactUs: UIViewController {
    @IBOutlet weak var vTop: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        vTop.addBorder(toSide: .Bottom, withColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.05), andThickness: 1.0)
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
