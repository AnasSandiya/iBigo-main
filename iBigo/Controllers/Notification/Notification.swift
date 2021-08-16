//
//  Notification.swift
//  iBigo
//
//  Created by pc link on 14/07/2021.
//

import UIKit

class NotificationCell: UITableViewCell{

    @IBOutlet weak var btnLater: UIButton!
    @IBOutlet weak var btnFollow: UIButton!
    static let reuseIdentifier = "NotificationCell"
    
    func Configure(){
        
        properties.buttonProperties(button: btnFollow, titleColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), borderColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) , bgColor: #colorLiteral(red: 0.6705882353, green: 0.5882352941, blue: 1, alpha: 1),cornerRadius: 10,borderWidth: 1)
        properties.buttonProperties(button: btnLater, titleColor: #colorLiteral(red: 0.6705882353, green: 0.5882352941, blue: 1, alpha: 1) , borderColor: #colorLiteral(red: 0.6705882353, green: 0.5882352941, blue: 1, alpha: 1), bgColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),cornerRadius: 10,borderWidth: 1)
    }

}


class Notification: UIViewController , UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:NotificationCell = self.tableView.dequeueReusableCell(withIdentifier: NotificationCell.reuseIdentifier) as! NotificationCell
        cell.Configure()
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115.0
        
    }
    
    func tableView(_ tableView: UITableView,
                    leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
     {
         let deleteAction = UIContextualAction(style: .normal, title:  "", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
                 success(true)
               
                tableView.deleteRows(at: [indexPath], with: .fade)
             })
        deleteAction.image = UIImage(named: "ico - 24 - ui - delete")
        deleteAction.backgroundColor = #colorLiteral(red: 1, green: 0.9647058824, blue: 0.9647058824, alpha: 1)

        return UISwipeActionsConfiguration(actions: [deleteAction])
    }

    @IBOutlet weak var vTop: UIView!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
        vTop.addBorder(toSide: .Bottom, withColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.05), andThickness: 1.0)

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnBackPressed(_ sender: Any) {
 //       self.remove()
        dismiss(animated: true, completion: nil)

    }



}
