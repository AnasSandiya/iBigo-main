//
//  vcGallery.swift
//  iBigo
//
//  Created by pc link on 05/08/2021.
//

import UIKit

class GalleryCell: UICollectionViewCell {
    static let reuseIdentifier = "GalleryCell"
    @IBOutlet weak var imageView: UIImageView!
}

class GalleryListCell: UICollectionViewCell {
    static let reuseIdentifier = "GalleryListCell"
    @IBOutlet weak var imageView: UIImageView!
}


class vcGallery: UIViewController, UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        switch selectedItem {
        case "Collection":
            return MenuListImage.count
        default:
            return 4
        }
        
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        switch selectedItem {
        case "Collection":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryCell.reuseIdentifier, for: indexPath as IndexPath) as! GalleryCell
            cell.layer.cornerRadius = 10.0
            cell.imageView.image = MenuListImage[indexPath.row]
            cell.imageView.addOverlay(color: UIColor.black)
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryListCell.reuseIdentifier, for: indexPath as IndexPath) as! GalleryListCell
            cell.layer.cornerRadius = 10.0
            cell.imageView.image = MenuListImage[indexPath.row]
            cell.imageView.addOverlay(color: UIColor.black)
            return cell
        }
        
        
        

        
      
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch selectedItem {
        case "Collection":
            return CGSize(width: 108.0, height: 108.0)
        default:
            return CGSize(width: self.collectionView.bounds.width, height: 108.0)
        }
    }
       
        
        
        
        
    
    // MARK: - Initialization
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var vTop: UIView!
    var MenuListImage: [UIImage] = [
        UIImage(named: "Rectangle 1561")!,
        UIImage(named: "Rectangle 1562")!,
        UIImage(named: "Rectangle 1561")!,
        UIImage(named: "Rectangle 1562")!,
        UIImage(named: "Rectangle 1561")!,
        UIImage(named: "Rectangle 1562")!,
        UIImage(named: "Rectangle 1562")!,
        UIImage(named: "Rectangle 1561")!,
        UIImage(named: "Rectangle 1562")!
    ]
    
    @IBOutlet weak var btnCollection: UIButton!
    @IBOutlet weak var btnList: UIButton!
    
    var selectedItem = "Collection"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vTop.addBorder(toSide: .Bottom, withColor: #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5764705882, alpha: 0.05), andThickness: 1.0)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnCollectionPressed(_ sender: UIButton) {
        selectedItem = "Collection"
        self.btnCollection.setImage(UIImage(named: "Group 137"), for: .normal)
        self.btnList.setImage(UIImage(named: "Group 139"), for: .normal)
        self.collectionView.reloadData()
        
        
       
    }
    
    @IBAction func btnListPressed(_ sender: UIButton) {
        selectedItem = "List"
        self.btnCollection.setImage(UIImage(named: "Group 137_grey"), for: .normal)
        self.btnList.setImage(UIImage(named: "Group 139_purple"), for: .normal)
        self.collectionView.reloadData()
    }
    
    
    @IBAction func btnBackPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
