//
//  vcAdverteren.swift
//  iBigo
//
//  Created by Mac on 7/22/21.
//

import UIKit

class vcAdverteren: UIViewController , UIScrollViewDelegate {

    @IBOutlet weak var vBanner: UIView!
    
    @IBOutlet weak var vScrolling: UIView!
    
    @IBOutlet weak var vFixed: UIView!
    
    @IBOutlet weak var vTimed: UIView!
    
    @IBOutlet weak var vAuto: UIView!
    
    @IBOutlet weak var vTop: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.ViewProperties(myView: self.vBanner)
        self.ViewProperties(myView: self.vScrolling)
        self.ViewProperties(myView: self.vFixed)
        self.ViewProperties(myView: self.vTimed)
        self.ViewProperties(myView: self.vAuto)
    
        
        vTop.addBorder(toSide: .Bottom, withColor: #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5764705882, alpha: 0.05), andThickness: 1.0)
       
    }
    
    func ViewProperties(myView : UIView){
        myView.layer.cornerRadius = 8.0
        myView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.05)
        myView.layer.borderWidth = 1.0
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
