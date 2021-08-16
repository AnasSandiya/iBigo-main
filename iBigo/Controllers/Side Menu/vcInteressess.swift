//
//  vcInteressess.swift
//  iBigo
//
//  Created by Mac on 8/4/21.
//

import UIKit

class InteressessCell: UITableViewCell{
    static let reuseIdentifier = "InteressessCell"

    @IBOutlet weak var lblMenuNames: UILabel!
}

class vcInteressess: UIViewController, UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InteressessCell.reuseIdentifier) as! InteressessCell
        cell.lblMenuNames.text = MenuList[indexPath.row]
            
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    var MenuList: [String] = ["Food & Drinks", "Theatre", "Festivals & Concerts", "Games & Competitie", "Shopping", "Clubs"]

    @IBOutlet weak var vTop: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        vTop.addBorder(toSide: .Bottom, withColor: #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5764705882, alpha: 0.05), andThickness: 1.0)
        // Do any additional setup after loading the view.
    }
    @IBAction func btnBackPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)

    }


}
