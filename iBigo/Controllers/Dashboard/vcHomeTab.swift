//
//  vcHomeTab.swift
//  iBigo
//
//  Created by pc link on 02/07/2021.
//

import UIKit


var GlobalCollection :UICollectionView? = nil
var GlobalPageControll :UIPageControl? = nil



class cvcHomeTab: UICollectionViewCell , UIScrollViewDelegate {
    static let reuseIdentifier = "cvcHomeTab"
    @IBOutlet weak var lblCategory: UILabel!
}
class cvcSubHomeTab: UICollectionViewCell {
    static let reuseIdentifier = "cvcSubHomeTab"
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var vContent: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet var cvCardViewHorizontal: UICollectionView!
    

    let collectionMargin = CGFloat(16)
    let itemSpacing = CGFloat(10)
    let itemHeight = CGFloat(322)
    
    var itemWidth = CGFloat(0)
    var currentItem = 0
 //  @IBOutlet weak var cvCardViewHorizontal:
    func Configure(){
        self.vContent.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.vContent.layer.borderWidth = 1
        self.vContent.layer.cornerRadius = 10.0
        
        cvCardViewHorizontal?.decelerationRate = UIScrollView.DecelerationRate.fast
      //  GlobalCollection = cvCardViewHorizontal
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let pageWidth = Float(itemWidth + itemSpacing)
        let targetXContentOffset = Float(targetContentOffset.pointee.x)
        let contentWidth = Float(cvCardViewHorizontal!.contentSize.width  )
        var newPage = Float(self.pageControl.currentPage)
        
        if velocity.x == 0 {
            newPage = floor( (targetXContentOffset - Float(pageWidth) / 2) / Float(pageWidth)) + 1.0
        } else {
            newPage = Float(velocity.x > 0 ? self.pageControl.currentPage + 1 : self.pageControl.currentPage - 1)
            if newPage < 0 {
                newPage = 0
            }
            if (newPage > contentWidth / pageWidth) {
                newPage = ceil(contentWidth / pageWidth) - 1.0
            }
        }
        
        self.pageControl.currentPage = Int(newPage)
        let point = CGPoint (x: CGFloat(newPage * pageWidth), y: targetContentOffset.pointee.y)
        targetContentOffset.pointee = point
    }
}

class cvcCardViewHorizontal: UICollectionViewCell {
    static let reuseIdentifier = "cvcCardViewHorizontal"
    @IBOutlet weak var lblTest: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var imgProfilePicture: UIImageView!
    @IBOutlet weak var imgCoverPicture: UIImageView!
    
    func Configure(){
        imgProfilePicture.layer.cornerRadius = 20.0
        imgCoverPicture.layer.cornerRadius = 20.0
        
    }
    
}


class cvcbHomeTabHeader: UICollectionReusableView {
    
    static let reuseIdentifier = "cvcbHomeTabHeader"
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var cvHeader: UICollectionView!
    @IBOutlet weak var btnForward: UIButton!
    func configure(){
        self.cvHeader.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.cvHeader.layer.borderWidth = 2
        self.cvHeader.layer.cornerRadius = 10.0
    }
    
    @IBAction func prevPageButtonClicked(_ sender: Any) {
        let collectionBounds = self.cvHeader.bounds
           let contentOffset = CGFloat(floor(self.cvHeader.contentOffset.x - collectionBounds.size.width))
           self.moveToFrame(contentOffset: contentOffset - 100)
    }
    @IBAction func nextPageButtonClicked(_ sender: UIButton) {
        let collectionBounds = self.cvHeader.bounds
            let contentOffset = CGFloat(floor(self.cvHeader.contentOffset.x + collectionBounds.size.width))
            self.moveToFrame(contentOffset: contentOffset + 100 )
    }
    
    func moveToFrame(contentOffset : CGFloat) {
        print(contentOffset)
        
        let frame: CGRect = CGRect(x : contentOffset ,y : self.cvHeader.contentOffset.y ,width : self.cvHeader.frame.width,height : self.cvHeader.frame.height)
        print(frame)
        self.cvHeader.scrollRectToVisible(frame, animated: true)
    }
    
    
    

}

class cvcbHomeTabSubHeader: UICollectionViewCell {
    static let reuseIdentifier = "cvcbHomeTabSubHeader"
    @IBOutlet weak var lblTest: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
 
    
    
}

class vcHomeTab: UIViewController, UICollectionViewDataSource , UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
// MARK: - Initialization
    
    @IBOutlet weak var cvCardView: UICollectionView!
    @IBOutlet weak var collectionView: UICollectionView!
   
    
    
    var arrCategories = ["Food & Drinks" , "Shopping" , "Games & Competetion"]
    @IBOutlet weak var vTop: UIView!
    
    
// MARK: - Tableview delegate methods
    
// MARK: - CollectionView delegate methods
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        print(collectionView.tag)
        
        
        // Categoris Lis
        if(collectionView == self.collectionView){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cvcHomeTab.reuseIdentifier, for: indexPath as IndexPath) as! cvcHomeTab
            cell.layer.cornerRadius = 5.0
            cell.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            cell.layer.borderWidth = 1.0
            cell.lblCategory.text = arrCategories[indexPath.row]
            return cell
        }
        else if(collectionView == self.cvCardView){        // Main Card
            let cell = cvCardView.dequeueReusableCell(withReuseIdentifier: cvcSubHomeTab.reuseIdentifier, for: indexPath as IndexPath) as! cvcSubHomeTab
            cell.layer.cornerRadius = 10.0
            //cell.lblCategory.text = arrCategories[indexPath.row]
            cell.Configure()
            
            cell.scrollView.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
            return cell
        }
        
        else if(collectionView.tag == 4){        // Main Card
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cvcCardViewHorizontal.reuseIdentifier, for: indexPath as IndexPath) as! cvcCardViewHorizontal
            cell.layer.cornerRadius = 10.0
            cell.lblTest.text = "AKRAM BAKRAM"
        
            cell.Configure()
            


            return cell
        }
        else{    //   Header
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cvcbHomeTabSubHeader.reuseIdentifier, for: indexPath as IndexPath) as! cvcbHomeTabSubHeader
                cell.layer.cornerRadius = 10.0
           // cell.lblTest.text = "DDDDD"
            let imageName = String("himage\(indexPath.row + 1).png")
            
            cell.imageView?.contentMode = .scaleAspectFill

            cell.imageView.image = UIImage(named: imageName)
            return cell
            
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == self.collectionView){
            return arrCategories.count
        }
        else if(collectionView == self.cvCardView){
            return 5
        }
        else if(collectionView.tag == 4){
            return 4
        }else{
            return 9
        }
       
    }
        
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        if(collectionView == self.collectionView){
            let item = arrCategories[indexPath.row]
            let itemSize = item.size(withAttributes: [
                NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20)
            ])
            return CGSize(width: itemSize.width, height: 40)
        }
        else if(collectionView == self.cvCardView){
            return CGSize(width: UIScreen.main.bounds.width, height: 440.0)
        }else if(collectionView.tag == 4){
            return CGSize(width: UIScreen.main.bounds.width, height: 400.0)
        }
        else{
            return CGSize(width: UIScreen.main.bounds.width, height: 250)
        }
    }
    
    
// MARK: - CollectionView Layout delegate methods
    
    
    
    public func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if(collectionView.tag == 4){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cvcCardViewHorizontal.reuseIdentifier, for: indexPath as IndexPath) as! cvcCardViewHorizontal
            cell.pageControl.currentPage = indexPath.row
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if(collectionView == self.collectionView){
            
            return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        }
        else if(collectionView == self.cvCardView){
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }else if(collectionView.tag == 4){
            return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        }
        
        else{
            return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if(collectionView == self.collectionView){
            return 12.0
        }
        else if(collectionView == self.cvCardView){
            return 2.0
        }
        else{
            return 4.0
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout    collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if(collectionView == self.collectionView){
            return 24.0
        }
        else if(collectionView == self.cvCardView){
            return 2.0
        }
        else if(collectionView.tag == 4){
            return 20.0
        }
        else{
            return 4.0
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = self.collectionView.cellForItem(at: indexPath) as? cvcHomeTab
        cell?.lblCategory.textColor = #colorLiteral(red: 0.6039215686, green: 0.3960784314, blue: 1, alpha: 1)
        cell?.layer.borderColor = #colorLiteral(red: 0.6039215686, green: 0.3960784314, blue: 1, alpha: 1)
        cell?.layer.borderWidth = 1.0
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = self.collectionView.cellForItem(at: indexPath) as? cvcHomeTab
        self.NavigatetoShareSpot()
        
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {

           case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: cvcbHomeTabHeader.reuseIdentifier, for: indexPath) as! cvcbHomeTabHeader
            headerView.configure()
            return headerView

           case UICollectionView.elementKindSectionFooter:
               let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Footer", for: indexPath)

               footerView.backgroundColor = UIColor.green
               return footerView

           default:
            preconditionFailure("Invalid supplementary view type for this collection view")


             //  assert(false, "Unexpected element kind")
           }
    }
    private func NavigatetoShareSpot(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "vcShareSpot") as! vcShareSpot
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
        newViewController.didMove(toParent: self)
    }
    
    
// MARK: - ViewController delegate methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.vTop.addBorder(toSide: .Bottom, withColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), andThickness: 1.0)
        collectionView.register(cvcbHomeTabHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: cvcbHomeTabHeader.reuseIdentifier)
        
      //  GlobalCollection = cvCardViewHorizontal()
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let index = IndexPath(row: 0, section: 0)
        self.collectionView.allowsSelection = true
        self.collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: [])
        self.collectionView.delegate?.collectionView!(collectionView, didSelectItemAt: index)
        
        
    }

    
// MARK: - Textfeild delegate methods
    
// MARK: - Methods
    
   
  
   

}
