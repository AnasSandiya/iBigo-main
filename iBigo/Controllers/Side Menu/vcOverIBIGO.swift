//
//  vcOverIBIGO.swift
//  iBigo
//
//  Created by Mac on 7/22/21.
//

import UIKit

class OverIBIGOCell : UITableViewCell{
    static let reuseIdentifier = "OverIBIGOCell"

    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblMenuNames: UILabel!
}

class vcOverIBIGO: UIViewController, UITableViewDataSource , UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: OverIBIGOCell.reuseIdentifier) as! OverIBIGOCell
        cell.imgProfile.layer.cornerRadius = 5.0
        cell.imgProfile.image = MenuListImage[indexPath.row]
        cell.lblMenuNames.text = MenuList[indexPath.row]
            
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == 1){
            NavigatetoOverons()
        }
        else if(indexPath.row == 2){
            NavigatetoAdverteren()
        }
        else if(indexPath.row == 3){
            NavigatetoAdverteren()
        }
        else if(indexPath.row == 4){
            NavigatetoContactUs()
        }
        else if(indexPath.row == 5){
            NavigatetoTermsofServices()
        }
    }
    
    private func NavigatetoContactUs(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "vcContactUs") as! vcContactUs
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
        newViewController.didMove(toParent: self)
    }
    private func NavigatetoTermsofServices(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "vcTermsofServices") as! vcTermsofServices
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
        newViewController.didMove(toParent: self)
    }
    
    
    
    private func NavigatetoAdverteren(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "vcAdverteren") as! vcAdverteren
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
        newViewController.didMove(toParent: self)
    }
    
    private func NavigatetoOverons(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "vcOverons") as! vcOverons
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
        newViewController.didMove(toParent: self)
    }
    var MenuListImage: [UIImage] = [
        UIImage(named: "ico - 24 - actions - info_blue")!,
        UIImage(named: "ico - 24 - map & places - theatre")!,
        UIImage(named: "ico - 24 - actions - info")!,
        UIImage(named: "ico - 24 - ui - share_vs")!,
        UIImage(named: "Group 52")!,
        UIImage(named: "ico - 24 - ui - sign_out")!
       
    ]
    @IBOutlet weak var vTop: UIView!
    var MenuList: [String] = ["Over IBIGO", "Over ons", "Adverteren", "FAQ", "Contact & verbetersuggesties", "Privacy & Gebruikervoorwaarden"]
    @IBOutlet weak var tableView: UITableView!
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
