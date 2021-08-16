//
//  vMenuTab.swift
//  iBigo
//
//  Created by Mac on 7/12/21.
//

import UIKit

class CellMenu: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblNames: UILabel!
    static let reuseIdentifier = "CellMenu"
}



class vMenuTab: UIViewController , UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellMenu.reuseIdentifier, for: indexPath as IndexPath) as! CellMenu
        cell.lblNames.text =  arrNames[indexPath.row]
        cell.contentView.layer.cornerRadius = 10.0
        cell.imageView.addOverlay(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        cell.imageView.image = MenuListImage[indexPath.row]
        return cell
    }
//
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 165.0, height: 206.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.NavigatetoShareSpot()
    }
    private func NavigatetoShareSpot(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "vcShareSpot") as! vcShareSpot
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
        newViewController.didMove(toParent: self)
    }

    @IBAction func btnBackPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)

    }
    @IBOutlet weak var collectionView: UICollectionView!
    var arrNames = ["Upload Media" ,"Check In" , "Planing","Share Top 3","Share", "Review" , ]
    var MenuListImage: [UIImage] = [
        UIImage(named: "Component 94 – 1")!,
        UIImage(named: "Component 94 – 2")!,
        UIImage(named: "Component 94 – 3")!,
        UIImage(named: "Component 94 – 4")!,
        UIImage(named: "Component 94 – 5")!,
        UIImage(named: "Component 94 – 6")!

       
    ]
    
    
    @IBOutlet weak var vTop: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        vTop.addBorder(toSide: .Bottom, withColor: #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1), andThickness: 1.0)
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
    }
        


 

}
