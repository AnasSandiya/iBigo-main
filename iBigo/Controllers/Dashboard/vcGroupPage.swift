//
//  vcGroupPage.swift
//  iBigo
//
//  Created by Mac on 8/7/21.
//

import UIKit

class GroupPageCell : UICollectionViewCell{
    
    static let reuseIdentifier = "GroupPageCell"
    @IBOutlet weak var vColl: UIView!

    func Configure(){
//        vColl.layer.shadowColor = UIColor.black.cgColor
//        vColl.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
//        vColl.layer.shadowOpacity = 0.1
//        vColl.layer.shadowRadius = 6.0
        vColl.layer.cornerRadius = 6.0
        vColl.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.05)
        vColl.layer.borderWidth = 1.0
    }

}

class vcGroupPage: UIViewController , UICollectionViewDataSource , UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GroupPageCell.reuseIdentifier, for: indexPath as IndexPath) as! GroupPageCell
        cell.Configure()
               return cell
    }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

            print(self.cvFeeds.bounds.width)
            return CGSize(width: self.cvFeeds.bounds.width, height: 540.0)
        }
        
    
    
    
    @IBOutlet weak var cvFeeds: UICollectionView!
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
//        return 9
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GroupPageCell.reuseIdentifier, for: indexPath as IndexPath) as! GroupPageCell
//        cell.Configure()
//        return cell
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//      
//        return CGSize(width: self.collectionView.bounds.width, height: 500.0)
//    }
    

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var vMembers: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.setProp()
    }
    
    @IBAction func btnBackPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)

    }
    
    
    
    func setProp(){
        vMembers.layer.shadowColor = UIColor.black.cgColor
        vMembers.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        vMembers.layer.shadowOpacity = 0.1
        vMembers.layer.shadowRadius = 6.0
        vMembers.layer.cornerRadius = 6.0
    }
    

   

}
