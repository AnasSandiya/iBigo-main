//
//  vcSearchTab.swift
//  iBigo
//
//  Created by Mac on 7/7/21.
//

import UIKit


@IBDesignable
class TextField: UITextField {
    @IBInspectable var insetX: CGFloat = 0
    @IBInspectable var insetY: CGFloat = 0

    // placeholder position
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: insetX, dy: insetY)
    }

    // text position
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: insetX, dy: insetY)
    }
}

class cvcSearchTab: UICollectionViewCell , UIScrollViewDelegate {
    static let reuseIdentifier = "cvcSearchTab"
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var imgCategories: UIImageView!
    
    private func Configure(){
        self.imgCategories.layer.cornerRadius = 10.0
    }
}
class cvcCardView: UICollectionViewCell , UIScrollViewDelegate {
    static let reuseIdentifier = "cvcCardView"
    
    @IBOutlet weak var vColl: UIView!
    @IBOutlet weak var imgCoverPhoto: UIImageView!
    
    func Configure(){
//        collectionViewHorizonal.layer.shadowColor = UIColor.black.cgColor
//        collectionViewHorizonal.layer.shadowOpacity = 1
//        collectionViewHorizonal.layer.shadowOffset = .zero
//        collectionViewHorizonal.layer.shadowRadius = 10
        
//        vColl.layer.shadowColor = UIColor.black.cgColor
//        vColl.layer.shadowOffset = .zero//CGSize(width: 0.1, height: 0.1)
//        vColl.layer.shadowOpacity = 0.1
//        vColl.layer.shadowRadius = 12.0
//        vColl.layer.cornerRadius = 12.0
        
        vColl.layer.shadowColor = UIColor.black.cgColor
        vColl.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        vColl.layer.shadowOpacity = 0.1
        vColl.layer.shadowRadius = 6.0
        vColl.layer.cornerRadius = 6.0
    }
}

class vcSearchTab: UIViewController, UICollectionViewDataSource , UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MenuListImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        if(collectionView.tag == 1){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cvcSearchTab.reuseIdentifier, for: indexPath as IndexPath) as! cvcSearchTab
            
            cell.imgCategories.image = MenuListImage[indexPath.row]//UIImage(named: imageName)
            cell.lblCategory.text = MenuList[indexPath.row]
            cell.imgCategories.addOverlay(color: UIColor.black)
            
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cvcCardView.reuseIdentifier, for: indexPath as IndexPath) as! cvcCardView
          //  cell.imgCoverPhoto.layer.cornerRadius = 20.0
            cell.Configure()
            return cell
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        if(collectionView.tag == 1){
            return CGSize(width: collectionView.frame.width, height: 58.0)
        }
        else {
            return CGSize(width: cvCardView.frame.width, height:450.0)
        }
        
    }
    
    var MenuListImage: [UIImage] = [
        UIImage(named: "himage2")!,
        UIImage(named: "himage3")!,
        UIImage(named: "himage4")!,
        UIImage(named: "himage2")!,
        UIImage(named: "himage3")!,
        UIImage(named: "himage4")!,
        UIImage(named: "himage2")!,
        UIImage(named: "himage3")!,
        UIImage(named: "himage4")!
       
    ]
    
    var MenuList: [String] = ["Games & competitive", "Shopping", "Resturants","Parks", "Shopping", "Resturants","Games & competitive", "Shopping", "Resturants"]
    
    @IBOutlet weak var vMain: UIView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var cvCardView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func btnFilterPressed(_ sender: UIButton) {
        self.NavigatetoFilter()
        
    }
    private func NavigatetoFilter(){
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "vcFilter") as! vcFilter
        self.parent!.addChild(newViewController)
        
        print(self.parent!.view.frame)
        
        
        newViewController.view.frame = self.parent!.view.frame//frame
        newViewController.modalPresentationStyle = .fullScreen
        self.parent!.view.addSubview((newViewController.view)!)
        newViewController.didMove(toParent: self)
        
        
        
      //  self.parent?.view.bringSubviewToFront(newViewController.view)
        
        
        
        
//
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let newViewController = storyBoard.instantiateViewController(withIdentifier: "vcFilter") as! vcFilter
//        self.addChild(newViewController)
//
//        let frame: CGRect = CGRect(x : 0 ,y : 120 ,width : self.view.frame.width ,height : self.view.frame.height - 120)
//
//        newViewController.view.frame = frame
////        self.view.addSubview((newViewController.view)!)
////        newViewController.didMove(toParent: self)
////
//
//        //newViewController.modalPresentationStyle = .
//        self.present(newViewController, animated: true, completion: nil)
//        newViewController.didMove(toParent: self)

        
        

        
    }
    
  
    override func viewDidAppear(_ animated: Bool) {
        self.vMain.layer.borderWidth = 1
        self.vMain.layer.borderColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        self.collectionView.layer.cornerRadius = 12.0
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
