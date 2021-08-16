//
//  vcMyProfile.swift
//  iBigo
//
//  Created by pc link on 09/08/2021.
//

import UIKit



class MyProfileCell: UICollectionViewCell {
    static let reuseIdentifier = "MyProfileCell"
    
    @IBOutlet weak var imageView: UIImageView!

    static var MenuListImage: [UIImage] = [
        UIImage(named: "Rectangle 1561")!,
        UIImage(named: "Rectangle 1562")!
    ]
    
    func Configure(indexPath: IndexPath){
        
     //   imageView.addOverlay(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        imageView.image = MyProfileCell.MenuListImage[indexPath.row]
    }
}

class InterestCell: UICollectionViewCell {
    static let reuseIdentifier = "InterestCell"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblNames: UILabel!
    
    static let arrNames = ["Food & drinks" ,"Festivals & Concerts" , "Shopping"]
    
    
    static var MenuListImage: [UIImage] = [
        UIImage(named: "ico - 24 - food & drinks - pizza")!,
        UIImage(named: "ico - 24 - map & places - theatre-1")!,
        UIImage(named: "ico - 24 - map & places - shopping")!
    ]
    
    func Configure(indexPath: IndexPath){
        self.contentView.layer.borderColor = #colorLiteral(red: 0.6251067519, green: 0.6256913543, blue: 0.6430284977, alpha: 1)
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.cornerRadius = 8.0
        
        imageView.image = InterestCell.MenuListImage[indexPath.row]
        lblNames.text = InterestCell.arrNames[indexPath.row]
    }
}

class ActivityCell: UICollectionViewCell {
    static let reuseIdentifier = "ActivityCell"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblNames: UILabel!
    
    static let arrNames = ["Boys night out" ,"Dinner" , "Adventure" , "Beach"]
    
    
    static var MenuListImage: [UIImage] = [
        UIImage(named: "ico - 24 - user - group_equal-1")!,
        UIImage(named: "ico - 24 - food & drinks - chicken")!,
        UIImage(named: "ico - 24 - map & places - san_francisco")!,
        UIImage(named: "ico - 24 - Tree")!
    ]
    
    func Configure(indexPath: IndexPath){
        self.contentView.layer.borderColor = #colorLiteral(red: 0.6251067519, green: 0.6256913543, blue: 0.6430284977, alpha: 1)
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.cornerRadius = 8.0
        
        imageView.image = ActivityCell.MenuListImage[indexPath.row]
        lblNames.text = ActivityCell.arrNames[indexPath.row]
    }
}

class TopPlacesCell: UICollectionViewCell {
    static let reuseIdentifier = "TopPlacesCell"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblNames: UILabel!
    
    static let arrNames = ["Boys night out" ,"Dinner" , "Adventure" , "Beach"]
    
    
    static var MenuListImage: [UIImage] = [
        UIImage(named: "ico - 24 - user - group_equal-1")!,
        UIImage(named: "ico - 24 - food & drinks - chicken")!,
        UIImage(named: "ico - 24 - map & places - san_francisco")!,
        UIImage(named: "ico - 24 - Tree")!
    ]
    
    func Configure(indexPath: IndexPath){
        self.contentView.layer.borderColor = #colorLiteral(red: 0.6251067519, green: 0.6256913543, blue: 0.6430284977, alpha: 1)
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.cornerRadius = 8.0
        
        imageView.image = ActivityCell.MenuListImage[indexPath.row]
        lblNames.text = ActivityCell.arrNames[indexPath.row]
    }
}

class vcMyProfile: UIViewController , UICollectionViewDataSource , UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      
        if(collectionView.tag == 0){
            return MyProfileCell.MenuListImage.count
        }else if(collectionView.tag == 1){
            return InterestCell.MenuListImage.count
        }else if(collectionView.tag == 2){
            return ActivityCell.MenuListImage.count
        }
        else{
            return 2
        }
    
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        if(collectionView.tag == 0){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyProfileCell.reuseIdentifier, for: indexPath as IndexPath) as! MyProfileCell
            cell.Configure(indexPath: indexPath)
            return cell
        }else if(collectionView.tag == 1) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InterestCell.reuseIdentifier, for: indexPath as IndexPath) as! InterestCell
            cell.Configure(indexPath: indexPath)
            return cell
        }else if(collectionView.tag == 2){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ActivityCell.reuseIdentifier, for: indexPath as IndexPath) as! ActivityCell
            cell.Configure(indexPath: indexPath)
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopPlacesCell.reuseIdentifier, for: indexPath as IndexPath) as! TopPlacesCell
            //cell.Configure(indexPath: indexPath)
            return cell
        }
        

    }
    

    @IBOutlet weak var vGalleryDetailsTapped: UIView!
    @IBOutlet weak var btnMessage: UIButton!
    @IBOutlet weak var vTopPlacess: UIView!
    @IBOutlet weak var vSpotReviewed: UIView!
    @IBOutlet weak var vActivity: UIView!
    @IBOutlet weak var vInterest: UIView!
    @IBOutlet weak var vGallery: UIView!
    @IBOutlet weak var vBio: UIView!
    @IBOutlet weak var vProfile: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var vTop: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self, action: #selector(self.touchHappen(_:)))
        self.vGalleryDetailsTapped.addGestureRecognizer(tap)
  
    }
    
    @objc func touchHappen(_ sender: UITapGestureRecognizer) {
        
        self.NavigatetoGallery()
    }
    
    private func NavigatetoGallery(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "vcGallery") as! vcGallery
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
        newViewController.didMove(toParent: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
      
        vTop.addBorder(toSide: .Bottom, withColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.05), andThickness: 1.0)
        properties.ViewProperties(myview: vGallery, borderColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.05) , cornerRadius: 10.0, borderWidth: 1.0)
        properties.ViewProperties(myview: vSpotReviewed, borderColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.05) , cornerRadius: 10.0, borderWidth: 1.0)
        properties.ViewProperties(myview: vTopPlacess, borderColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.05) , cornerRadius: 10.0, borderWidth: 1.0)
        properties.ViewProperties(myview: vActivity, borderColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.05) , cornerRadius: 10.0, borderWidth: 1.0)
        properties.ViewProperties(myview: vInterest, borderColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.05) , cornerRadius: 10.0, borderWidth: 1.0)
        properties.ViewProperties(myview: vProfile, borderColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.05) , cornerRadius: 10.0, borderWidth: 1.0)
        properties.ViewProperties(myview: vBio, borderColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.05) , cornerRadius: 10.0, borderWidth: 1.0)
        self.btnMessage.layer.borderColor = #colorLiteral(red: 0.6709424257, green: 0.5764052272, blue: 1, alpha: 1)
        self.btnMessage.layer.borderWidth = 1.0
    }
    
    
    @IBAction func btnBackPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
