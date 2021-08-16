//
//  vcShareSpot.swift
//  iBigo
//
//  Created by pc link on 09/08/2021.
//

import UIKit

class ShareSpotCell: UICollectionViewCell {
    static let reuseIdentifier = "ShareSpotCell"
    static let arrNames = ["Great" ,"Hot" , "Lit","Fun","Great" ,"Hot" , "Lit","Fun"]

    @IBOutlet weak var btnName: UIButton!

    func Configure(indexPath: IndexPath){
        self.btnName.layer.borderWidth = 1.0
        self.btnName.layer.borderColor = #colorLiteral(red: 0.6708214283, green: 0.5866119862, blue: 1, alpha: 1)
        self.btnName.layer.cornerRadius = 8.0
        self.btnName.setTitle(ShareSpotCell.arrNames[indexPath.row].description, for: .normal)
        
    }
}

class vcShareSpot: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ShareSpotCell.arrNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShareSpotCell.reuseIdentifier, for: indexPath as IndexPath) as! ShareSpotCell
        cell.Configure(indexPath: indexPath)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 62.0, height: 32.0)
        
    }
    
    
    
  
    @IBOutlet weak var btnFriendName: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var vPending: UIView!
    @IBOutlet weak var vTop: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        properties.ViewProperties(myview: vPending, borderColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.05) , cornerRadius: 10.0, borderWidth: 1.0)
        vTop.addBorder(toSide: .Bottom, withColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.05), andThickness: 1.0)
        btnFriendName.layer.borderWidth = 1.0
        btnFriendName.layer.borderColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.3019607843, alpha: 1)
        btnFriendName.layer.cornerRadius = 6.0
    }
    
    @IBAction func btnBackPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
