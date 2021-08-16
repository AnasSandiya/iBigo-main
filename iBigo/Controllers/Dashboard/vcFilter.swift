//
//  vcFilter.swift
//  iBigo
//
//  Created by pc link on 11/08/2021.
//

import UIKit
import BEMCheckBox

class vcFilter: UIViewController {

    
    @IBOutlet weak var cbWhoGirls: BEMCheckBox!
    @IBOutlet weak var cbWhoOuting: BEMCheckBox!
    @IBOutlet weak var cbWhoDate: BEMCheckBox!
    @IBOutlet weak var cbWhatSpot: BEMCheckBox!
    @IBOutlet weak var cbWhatEvent: BEMCheckBox!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        properties.showAnimate(MyView: self.view)
        // Do any additional setup after loading the view.
    }
    
    private func setProp(mycb: BEMCheckBox){
    
        mycb.boxType = .square
        mycb.onFillColor = #colorLiteral(red: 0.6705882353, green: 0.5764705882, blue: 1, alpha: 1)
        mycb.onCheckColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
   
    
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
      
        self.setProp(mycb: cbWhoGirls)
        self.setProp(mycb: cbWhoOuting)
        self.setProp(mycb: cbWhoDate)
        self.setProp(mycb: cbWhatSpot)
        self.setProp(mycb: cbWhatEvent)
    }
    
    
    @IBAction func btnBackPressed(_ sender: Any) {
 //       self.remove()
        properties.removeAnimate(MyView: self.view)
       // dismiss(animated: true, completion: nil)

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
