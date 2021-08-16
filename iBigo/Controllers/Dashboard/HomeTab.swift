//
//  HomeTab.swift
//  iBigo
//
//  Created by Mac on 7/9/21.
//

import UIKit

class _cvcHomeTab: UICollectionViewCell{
    static let reuseIdentifier = "_cvcHomeTab"
    @IBOutlet weak var vMain: UIView!
    @IBOutlet weak var collectionViewHorizonal: UICollectionView!
    func Configure(){
        vMain.layer.shadowColor = UIColor.black.cgColor
        vMain.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        vMain.layer.shadowOpacity = 0.1
        vMain.layer.shadowRadius = 12.0
        vMain.layer.cornerRadius = 12.0
        
        
        collectionViewHorizonal.layer.cornerRadius = 12.0
    }
    

    
}
class _cvcHomeTabHorizontal: UICollectionViewCell{
    @IBOutlet weak var vCard: UIView!
    static let reuseIdentifier = "_cvcHomeTabHorizontal"
}
class cvcHomeHeaderCollectionView: UICollectionViewCell{
    static let reuseIdentifier = "cvcHomeHeaderCollectionView"
}

class CellCategory: UICollectionViewCell{
    static let reuseIdentifier = "CellCategory"
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var vLine: UIView!
}
class _cvcHomeHeader: UICollectionReusableView{
    static let reuseIdentifier = "_cvcHomeHeader"
    
    @IBOutlet weak var HomeHeaderCollectionView: UICollectionView!
}

class HomeTab: UIViewController,UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if(collectionView.tag == 1){
            return CGSize(width: collectionView.frame.width, height: 560.0)
        }
        else if(collectionView.tag == 2){
            return CGSize(width: collectionView.frame.width, height:510.0)
        }
        else if(collectionView.tag == 3){
            return CGSize(width: collectionView.frame.width, height: 276.0)
        }
        else{
            return CGSize(width: collectionView.frame.width, height: 47.0)
        }
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

                 //  assert(false, "Unexpected element kind")
            }
    
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView.tag == 1){
            return 5
        }
        else if(collectionView.tag == 2){
            return 10
        }else if(collectionView.tag == 3)
        {
            return 1
        }else{
            return 3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(collectionView.tag == 1){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: _cvcHomeTab.reuseIdentifier, for: indexPath as IndexPath) as! _cvcHomeTab
            cell.Configure()
            return cell
        }else if(collectionView.tag == 2){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: _cvcHomeTabHorizontal.reuseIdentifier, for: indexPath as IndexPath) as! _cvcHomeTabHorizontal
            return cell
        }else if(collectionView.tag == 3){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cvcHomeHeaderCollectionView.reuseIdentifier, for: indexPath as IndexPath) as! cvcHomeHeaderCollectionView
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellCategory.reuseIdentifier, for: indexPath as IndexPath) as! CellCategory
            cell.lblCategory.text =  arrCategories[indexPath.row]
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if(collectionView.tag == 4){
            let cell = self.collectionViewCategories.cellForItem(at: indexPath) as? CellCategory
            cell?.lblCategory.textColor = #colorLiteral(red: 0.6708214283, green: 0.5866119862, blue: 1, alpha: 1)
            cell?.vLine.backgroundColor = #colorLiteral(red: 0.6708214283, green: 0.5866119862, blue: 1, alpha: 1)
        }
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if(collectionView.tag == 4){
            let cell = self.collectionViewCategories.cellForItem(at: indexPath) as? CellCategory
            cell?.lblCategory.textColor = #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.537254902, alpha: 1)
            cell?.vLine.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        }
        
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var collectionViewCategories: UICollectionView!
    @IBOutlet weak var vTop: UIView!
    var arrCategories = ["Food & Drinks" , "Shopping" , "Games & Competetion"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
     //   self.vTop.addBorder(toSide: .Bottom, withColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), andThickness: 1.0)
        let index = IndexPath(row: 0, section: 0)
        
        self.collectionViewCategories.allowsSelection = true
        self.collectionViewCategories.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: [])
        self.collectionViewCategories.delegate?.collectionView!(collectionViewCategories, didSelectItemAt: index)
        
        self.collectionViewCategories.layer.borderWidth = 1
        self.collectionViewCategories.layer.borderColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
       
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
