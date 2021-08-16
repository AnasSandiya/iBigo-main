//
//  vcConnectTab.swift
//  iBigo
//
//  Created by Mac on 7/7/21.
//

import UIKit

class cvcConnectTab: UICollectionViewCell {
    static let reuseIdentifier = "cvcConnectTab"
    @IBOutlet weak var vLine: UIView!
    @IBOutlet weak var lblCategories: UILabel!
}

class FriendCell: UITableViewCell {
    static let reuseIdentifier = "FriendCell"

    @IBOutlet weak var vLine: UIView!
    @IBOutlet weak var imgProfilePicture: UIImageView!
    @IBOutlet weak var lblUsername: UILabel!
}

class ChatHeader: UITableViewCell {
    static let reuseIdentifier = "ChatHeader"

 
    

    
}

class GroupCell: UITableViewCell {
    static let reuseIdentifier = "GroupCell"

    @IBOutlet weak var vLine: UIView!
    @IBOutlet weak var imgProfilePicture: UIImageView!
    @IBOutlet weak var lblUsername: UILabel!
}

class SpotsCell: UITableViewCell {
    static let reuseIdentifier = "SpotsCell"

    
    @IBOutlet weak var vLine: UIView!
    @IBOutlet weak var imgProfilePicture: UIImageView!
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var vPending: UIView!
    
    @IBOutlet weak var vSpots: UIView!
    @IBOutlet weak var btnAccept: UIButton!
    @IBOutlet weak var btnDecline: UIButton!
    
    
    func configure(){
        properties.ViewProperties(myview: vPending, borderColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.05) , cornerRadius: 10.0, borderWidth: 1.0)
        properties.ViewProperties(myview: vSpots, borderColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.05) , cornerRadius: 10.0, borderWidth: 1.0)
        properties.buttonProperties(button: btnAccept, titleColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), borderColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) , bgColor: #colorLiteral(red: 0.6708214283, green: 0.5866119862, blue: 1, alpha: 1),cornerRadius: 10,borderWidth: 1)
        properties.buttonProperties(button: btnDecline, titleColor: #colorLiteral(red: 0.6708214283, green: 0.5866119862, blue: 1, alpha: 1) , borderColor: #colorLiteral(red: 0.6708214283, green: 0.5866119862, blue: 1, alpha: 1), bgColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),cornerRadius: 10,borderWidth: 1)
        
        
    }
}


class vcConnectTab: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate , UICollectionViewDelegateFlowLayout , UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
         switch selectedItem {
         case "Friends":
            self.btnCreateGroupPage.isHidden = true
            return self.FriendList.count
         case "Group":
            self.btnCreateGroupPage.isHidden = false
            return self.GroupList.count
         default:
            self.btnCreateGroupPage.isHidden = true
            return 4
         }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch selectedItem {
            case "Friends":
                
                    let cell:FriendCell = self.tvCardView.dequeueReusableCell(withIdentifier: FriendCell.reuseIdentifier) as! FriendCell
                cell.imgProfilePicture.layer.cornerRadius = 26.0
                cell.lblUsername.text = FriendList[indexPath.row]
                cell.imgProfilePicture.image = FriendImageList[indexPath.row]
            
                vPost.isHidden = true
                vChat.isHidden = false
                vHeader.frame = CGRect(x: 0, y: 0, width: vHeader.frame.width, height: 83.0)
                        
                return cell
               case "Group":
                let cell:GroupCell = self.tvCardView.dequeueReusableCell(withIdentifier: GroupCell.reuseIdentifier) as! GroupCell
                cell.imgProfilePicture.layer.cornerRadius = 26.0
                cell.lblUsername.text = GroupList[indexPath.row]
                cell.imgProfilePicture.image = GroupImageList[indexPath.row]
            
                vPost.isHidden = true
                vChat.isHidden = false
                vHeader.frame = CGRect(x: 0, y: 0, width: vHeader.frame.width, height: 83.0)
                        
                
              //  vHeader.frame.height = 68.0

                return cell
               default:
                let cell:SpotsCell = self.tvCardView.dequeueReusableCell(withIdentifier: SpotsCell.reuseIdentifier) as! SpotsCell
                vPost.isHidden = false
                vChat.isHidden = true
                vHeader.frame = vPost.frame
                cell.configure()
                return cell
        }
    }
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let config = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in

            switch self.selectedItem {
                case "Friends":
                    let btnChat = UIAction( title: "Chat") { _ in
                        print("Chat")
                    }
                    let btnPlan = UIAction( title: "Plan Outing") { _ in
                        print("Plan Outing")
                    }
                    let btnProfile = UIAction( title: "View Profile") { _ in
                        print("View Profile")
                    }
                    let menu = UIMenu(title: "", image: nil, identifier: nil, options: [], children: [btnChat , btnPlan , btnProfile])
                    return menu
                default:
                    let menu = UIMenu(title: "", image: nil, identifier: nil, options: [], children: [])
                    return menu
            }
        }
        return config
    }
     
    
    func tableView(_ tableView: UITableView,
                    leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
     {
         let deleteAction = UIContextualAction(style: .normal, title:  "", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
                 success(true)
                self.FriendList.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
             })
        deleteAction.image = UIImage(named: "ico - 24 - ui - delete")
        deleteAction.backgroundColor = #colorLiteral(red: 1, green: 0.9647058824, blue: 0.9647058824, alpha: 1)
        

        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch selectedItem {
            case "Friends":
                print("Friends")
            case "Group":
                self.NavigatetoGroupPage()
            default:
               print("aa")
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return arrCategories.count
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch selectedItem {
            case "Friends":
                return 83.0
            case "Group":
                return 83.0
            default:
                return 500.0
        }
    }
   
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cvcConnectTab.reuseIdentifier, for: indexPath as IndexPath) as! cvcConnectTab
            cell.layer.cornerRadius = 5.0
            cell.lblCategories.text = arrCategories[indexPath.row]
            return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
            switch kind {
            
            
               case UICollectionView.elementKindSectionHeader:
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath)
                return headerView
                
               case UICollectionView.elementKindSectionFooter:
                   let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Footer", for: indexPath)
                   return footerView
                
               default:
                    preconditionFailure("Invalid supplementary view type for this collection view")

                //   assert(false, "Unexpected element kind")
            }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
            return CGSize(width: collectionView.frame.width, height: 46.5)
        
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        if(collectionView.tag == 1){
//            return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
//        }
//        else{
//            return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
//        }
//
//    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedItem = arrCategories[indexPath.row]
        let cell = self.collectionView.cellForItem(at: indexPath) as? cvcConnectTab
        cell?.lblCategories.textColor = #colorLiteral(red: 0.6705882353, green: 0.5882352941, blue: 1, alpha: 1)
        cell?.vLine.layer.backgroundColor = #colorLiteral(red: 0.6708214283, green: 0.5866119862, blue: 1, alpha: 1)
        
        
        self.tvCardView.reloadData()
        
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        
        let cell = self.collectionView.cellForItem(at: indexPath) as? cvcConnectTab
        cell?.lblCategories.textColor = #colorLiteral(red: 0.6251067519, green: 0.6256913543, blue: 0.6430284977, alpha: 1)
        cell?.vLine.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
    }
    
    @IBOutlet weak var btnCreateGroupPage: UIButton!
    @IBOutlet weak var vHeader: UIStackView!
    @IBOutlet weak var vChat: UIView!
    @IBOutlet weak var vPost: UIView!
    var FriendList: [String] = ["User name", "User name", "User name", "User name"]
    var GroupList: [String] = ["Group name", "Group name"]

    var FriendImageList: [UIImage] = [
        UIImage(named: "rimage1")!,
        UIImage(named: "rimage2")!,
        UIImage(named: "rimage3")!,
        UIImage(named: "rimage4")!
    ]
    
    var GroupImageList: [UIImage] = [
    UIImage(named: "r1")!,
    UIImage(named: "r2")!
    ]

    @IBOutlet weak var tvCardView: UITableView!
    @IBOutlet weak var vcCardView: UICollectionView!
    var arrCategories = ["Friends" , "Group" , "Spots"]
    @IBOutlet weak var collectionView: UICollectionView!
    var selectedItem = String()
    
    @IBAction func btnPlan(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let index = IndexPath(row: 0, section: 0)
        self.collectionView.allowsSelection = true
        self.collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: [])
        self.collectionView.delegate?.collectionView!(collectionView, didSelectItemAt: index)
        
    }
    
    @IBAction func btnPlanPressed(_ sender: UIButton) {
        self.NavigatetoPlan()
    }
    
    private func NavigatetoPlan(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "vcPlan") as! vcPlan
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
        newViewController.didMove(toParent: self)
            //   self.window?.rootViewController?.present(newViewController, animated: true, completion: nil)
      //  newViewController.didMove(toParent: self.window?.rootViewController)
    }
    
    private func NavigatetoGroupPage(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "vcGroupPage") as! vcGroupPage
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
        newViewController.didMove(toParent: self)
            //   self.window?.rootViewController?.present(newViewController, animated: true, completion: nil)
      //  newViewController.didMove(toParent: self.window?.rootViewController)
    }
   
    @IBAction func btnCreateGroupPagePressed(_ sender: UIButton) {
        self.NavigatetoCreateGroup()
        
    }
    
    private func NavigatetoCreateGroup(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "vcCreateGroup") as! vcCreateGroup
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
        newViewController.didMove(toParent: self)
            //   self.window?.rootViewController?.present(newViewController, animated: true, completion: nil)
      //  newViewController.didMove(toParent: self.window?.rootViewController)
    }
    
}
