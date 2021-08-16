//
//  ViewController.swift
//  iBigo
//
//  Created by pc link on 29/06/2021.
//

import UIKit


class cvc: UICollectionViewCell {
    
    
}



class ViewController: UIViewController , UICollectionViewDelegate ,UICollectionViewDataSource {
    
    
    // MARK: - Initialization
    
    // MARK: - Tableview delegate methods
    
    // MARK: - CollectionView delegate methods
    
    // MARK: - ViewController delegate methods
    
    // MARK: - Textfeild delegate methods
    
    // MARK: - Methods
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath) as! cvc
        cell.contentView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return cell
    }
    

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

//
//
//func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//    return 9
//}
//
//func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cvcSignUpInterest.reuseIdentifier, for: indexPath as IndexPath) as! cvcSignUpInterest
//
//    let imageName = String("image\(indexPath.row + 1).png")
//    cell.imageView.image = UIImage(named: imageName)
//    cell.checkMarkView.style = .grayedOut
//    cell.checkMarkView.setNeedsDisplay()
//
//    return cell
//}

