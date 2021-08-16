//
//  vcSideMenu.swift
//  iBigo
//
//  Created by pc link on 14/07/2021.
//

import UIKit
import SideMenu

class SideMenuCell : UITableViewCell{
    static let reuseIdentifier = "SideMenuCell"

    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblMenuNames: UILabel!
}

class vcSideMenu: UIViewController, UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: SideMenuCell.reuseIdentifier) as! SideMenuCell
        cell.imgProfile.layer.cornerRadius = 5.0
        cell.imgProfile.image = MenuListImage[indexPath.row]
        cell.lblMenuNames.text = MenuList[indexPath.row]
            
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = self.tableView.cellForRow(at: indexPath) as! SideMenuCell
        print(indexPath.row)
        if(indexPath.row == 0){
            self.NavigatetoProfileSetting()
        }else if(indexPath.row == 1){
            self.NavigatetoInteresses()
        }else if(indexPath.row == 2){
            self.NavigatetoOverIBIGO()
        }
        
        
    }
    
    private func NavigatetoProfileSetting(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "vcProfileSetting") as! vcProfileSetting
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
        newViewController.didMove(toParent: self)
    }
    
    private func NavigatetoInteresses(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "vcInteressess") as! vcInteressess
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
        newViewController.didMove(toParent: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        SideMenuManager.default.menuFadeStatusBar = false

       
    }
    
    private func NavigatetoViewProfile(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "vcMyProfile") as! vcMyProfile
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
        newViewController.didMove(toParent: self)
    }
    
    private func NavigatetoOverIBIGO(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "vcOverIBIGO") as! vcOverIBIGO
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
        newViewController.didMove(toParent: self)
    }
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.touchHappen(_:)))
        self.vViewProfile.addGestureRecognizer(tap)
       //self.vViewProfile.isUserInteractionEnableded = true
    }
    


    @objc func touchHappen(_ sender: UITapGestureRecognizer) {
        print("Hello Dear you are here")
        self.NavigatetoViewProfile()
    }
    
    @IBOutlet weak var vMain: UIView!
    var MenuListImage: [UIImage] = [
        UIImage(named: "ico - 24 - user - account_circle-red")!,
        UIImage(named: "ico - 24 - map & places - theatre")!,
        UIImage(named: "ico - 24 - actions - info")!,
        UIImage(named: "ico - 24 - ui - share_vs_green")!,
        UIImage(named: "Group 52")!,
        UIImage(named: "ico - 24 - ui - sign_out")!
       
    ]
    
    @IBOutlet weak var vViewProfile: UIView!
    var MenuList: [String] = ["Profile Settings", "Interesses", "Over IBIGO", "Share the App", "Dark Theme", "Sign out"]

    //Calls this function when the tap is recognized.
    @objc func dismissSubview() {
        dismiss(animated: true, completion: nil)
    }

    
}
