//
//  vcDashboard.swift
//  iBigo
//
//  Created by pc link on 02/07/2021.
//

import UIKit
import SideMenu

extension UIViewController {
    func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }

    func remove() {
        // Just to be safe, we check that this view controller
        // is actually added to a parent before removing it.
        guard parent != nil else {
            return
        }

        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}

class vcDashboard: UIViewController , UITabBarDelegate ,UITabBarControllerDelegate {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var vContent: UIView!
    @IBOutlet weak var tabbar: UITabBar!
    @IBOutlet weak var vTop: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
       // vTop.addBorder(toSide: .Bottom, withColor: #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1), andThickness: 1.0)
        let items = self.tabbar.items!
       // self.tabbar.selectedItem = self.tabbar.items?.first
        self.tabbar.selectedItem = items[2]
        self.NavigatetoHomeController()
        
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tabbar.items?[2].image = UIImage(named: "Menu")?.withRenderingMode(.alwaysOriginal)
    }
    
   
    
// MARK: - Methods
    @IBAction func btnNotifyPressed(_ sender: Any) {
        
        self.NavigatetoNotifyController()
    }
    @IBAction func btnChatPressed(_ sender: Any) {
        self.NavigatetoChatController()
    }
    
    @IBAction func btnSideMenu(_ sender: Any) {
        self.NavigatetoSideMenuController()
    }
    private func NavigatetoHomeController(){
        self.vTop.isHidden = false
        self.lblTitle.isHidden = true
        self.logo.isHidden = false

        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "HomeTab") as! HomeTab
        self.vContent.frame = newViewController.view.frame
        self.vContent.addSubview(newViewController.view)
        self.addChild(newViewController)
        newViewController.didMove(toParent: self)
    }
    private func NavigatetoSearchController(){
        
        self.vTop.isHidden = true
        self.lblTitle.isHidden = true
        self.logo.isHidden = false

        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "vcSearchTab") as! vcSearchTab
        self.vContent.frame = newViewController.view.frame
        self.vContent.addSubview(newViewController.view)
        self.addChild(newViewController)
        newViewController.didMove(toParent: self)
    }
    private func NavigatetoConnectController(){
        self.vTop.isHidden = false
        self.lblTitle.isHidden = false
        self.logo.isHidden = true
        self.lblTitle.text = "Connect"
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "vcConnectTab") as! vcConnectTab
        self.vContent.frame = newViewController.view.frame
        self.vContent.addSubview(newViewController.view)
        self.addChild(newViewController)
        newViewController.didMove(toParent: self)
    }
    private func NavigatetotodoController(){
        self.vTop.isHidden = false
        self.lblTitle.isHidden = false
        self.logo.isHidden = true
        self.lblTitle.text = "To do"
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "vcTodo") as! vcTodo
        self.vContent.frame = newViewController.view.frame
        self.vContent.addSubview(newViewController.view)
        self.addChild(newViewController)
        newViewController.didMove(toParent: self)
    }
    
    private func NavigatetoMenuController(){
        self.vTop.isHidden = false
        self.lblTitle.isHidden = true
        self.logo.isHidden = false

        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "vMenuTab") as! vMenuTab
        //self.view.frame = newViewController.view.frame
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
        newViewController.didMove(toParent: self)
    }
    
    private func NavigatetoNotifyController(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "Notification") as! Notification
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
        newViewController.didMove(toParent: self)

    }
    
    private func NavigatetoChatController(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "vcChats") as! vcChats
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
        newViewController.didMove(toParent: self)
    }
    
    private func NavigatetoSideMenuController(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "vcSideMenu") as! vcSideMenu
       // newViewController.modalPresentationStyle = .fullScreen
        
        newViewController.providesPresentationContextTransitionStyle = true
        newViewController.definesPresentationContext = true
        newViewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        newViewController.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(newViewController, animated: true, completion: nil)
        newViewController.didMove(toParent: self)

    }
// MARK: - UITabbar delegate Delegate
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
       // self.remove()
        if(tabbar.selectedItem?.tag == 0){
            self.NavigatetoHomeController()
        }
        else if(tabbar.selectedItem?.tag == 1){
            self.NavigatetoSearchController()
        }
        else if(tabbar.selectedItem?.tag == 2){
            self.NavigatetoMenuController()
        }
        else if(tabbar.selectedItem?.tag == 3){
            self.NavigatetoConnectController()
        }
        else if(tabbar.selectedItem?.tag == 4){
            self.NavigatetotodoController()
        }
        
        
    }
// MARK: - UITabBarControllerDelegate
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        
        
        print("Selected view controller")
    }

}
