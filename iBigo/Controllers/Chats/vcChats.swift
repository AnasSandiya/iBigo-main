//
//  vcChats.swift
//  iBigo
//
//  Created by pc link on 14/07/2021.
//

import UIKit




class ChatCell: UITableViewCell{

    static let reuseIdentifier = "ChatCell"
    
    @IBOutlet weak var vBadge: UIView!
    @IBOutlet weak var badge: UILabel!
}


class vcChats: UIViewController , UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ChatCell = self.tableView.dequeueReusableCell(withIdentifier: ChatCell.reuseIdentifier) as! ChatCell
      //  cell.vBadge.layer.cornerRadius = 10.0
        return cell
    }
    

    @IBOutlet weak var vTop: UIView!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vTop.addBorder(toSide: .Bottom, withColor: #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5764705882, alpha: 0.05), andThickness: 1.0)


        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        self.NavigatetoChatDetails()

       }

    
    private func NavigatetoChatDetails(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "vcChatDetails") as! vcChatDetails
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
        newViewController.didMove(toParent: self)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76.0
        
    }
    
    @IBAction func btnBackPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)

    }

    

}
