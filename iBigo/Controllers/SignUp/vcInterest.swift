//
//  vcInterest.swift
//  iBigo
//
//  Created by Mac on 7/1/21.
//

import UIKit



class vcInterest: UIViewController ,UICollectionViewDelegate , UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {
    
    
    
    // MARK: - Initialization
    @IBOutlet weak var collectionView: UICollectionView!
    
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
    
    var MenuList: [String] = ["Games & Compitetive", "Shopping", "Resturants","Games & Compitetive", "Shopping", "Resturants","Games & Compitetive", "Shopping", "Resturants"]
    
// MARK: - Tableview delegate methods
    
// MARK: - CollectionView delegate methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MenuListImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cvcInterest.reuseIdentifier, for: indexPath as IndexPath) as! cvcInterest
        //cell.contentView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        cell.layer.cornerRadius = 10.0
        //let imageName =  //String("image\(indexPath.row + 1).png")
        cell.imageView.image = MenuListImage[indexPath.row]//UIImage(named: imageName)
        cell.lblName.text = MenuList[indexPath.row]
        cell.checkMarkView.style = .grayedOut
        cell.checkMarkView.setNeedsDisplay()
       // cell.imageView.alpha = 0.5
        cell.imageView.addOverlay(color: UIColor.black)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110.0, height: 130.0)
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath as IndexPath) as! cvcInterest
      //  cell.checkMarkView.checked = !cell.checkMarkView.checked
        if(cell.checkMarkView.checked){
            cell.checkMarkView.checked = false
            cell.vOpacity.backgroundColor = nil
            cell.imgCircle.isHidden = true
           // cell.contentView.tintColor = UIColor.systemGroupedBackground
        }else{
            cell.checkMarkView.checked = true
            cell.vOpacity.backgroundColor = #colorLiteral(red: 0.6708214283, green: 0.5866119862, blue: 1, alpha: 1)
            cell.imgCircle.isHidden = false
            //cell.contentView.tintColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        }
       
    }

    

    
// MARK: - ViewController delegate methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.SetupView()
    }
// MARK: - Textfeild delegate methods
    
// MARK: - Methods
    
    private func SetupView(){
                
        for view in self.view.subviews as [UIView] {
            if let btn = view as? UIButton {
                if let text = btn.titleLabel?.text {
                    if(text.isEqualToString(find: "Let's Start")){
                        properties.buttonProperties(button: btn, titleColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), borderColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) , bgColor: #colorLiteral(red: 0.6039215686, green: 0.4901960784, blue: 1, alpha: 1),cornerRadius: 10,borderWidth: 1)
                    }
                }
            }
        }
    }
    
    @IBAction func btnLetsStartPressed(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "vcDashboard") as! vcDashboard
        newViewController.modalPresentationStyle = .fullScreen
       // self.navigationController?.pushViewController(newViewController, animated: true)

        self.present(newViewController, animated: true, completion: nil)
    }
    

}
