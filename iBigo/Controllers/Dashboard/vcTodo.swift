//
//  vcTodo.swift
//  iBigo
//
//  Created by pc link on 06/08/2021.
//

import UIKit


class TodoCell: UICollectionViewCell {
    static let reuseIdentifier = "TodoCell"
    @IBOutlet weak var vColl: UIView!

    
    func Configure(){
        vColl.layer.shadowColor = UIColor.black.cgColor
        vColl.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        vColl.layer.shadowOpacity = 0.1
        vColl.layer.shadowRadius = 6.0
        vColl.layer.cornerRadius = 6.0
    }
}

class PlanningCell: UICollectionViewCell {
    static let reuseIdentifier = "PlanningCell"

    @IBOutlet weak var btnShare: UIButton!
    @IBOutlet weak var vColl: UIView!
    @IBOutlet weak var vLine: UIView!
    @IBOutlet weak var vColl1: UIView!
    @IBOutlet weak var btnAcceot: UIButton!
    
    func Configure(){
        vLine.addBorder(toSide: .Bottom, withColor: #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5764705882, alpha: 0.05), andThickness: 1.0)
        vColl.layer.shadowColor = UIColor.black.cgColor
        vColl.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        vColl.layer.shadowOpacity = 0.1
        vColl.layer.shadowRadius = 6.0
        vColl.layer.cornerRadius = 6.0
//        vColl1.layer.shadowColor = UIColor.black.cgColor
//        vColl1.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
//        vColl1.layer.shadowOpacity = 0.1
//        vColl1.layer.shadowRadius = 6.0
//        vColl1.layer.cornerRadius = 6.0
        
    //    btnShare.layer.cornerRadius = 8.0
     //   btnAcceot.layer.cornerRadius = 8.0
    }
}

class vcTodo: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch selectedItem {
        case "Todo":
            return 5
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        switch selectedItem {
        case "Todo":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodoCell.reuseIdentifier, for: indexPath as IndexPath) as! TodoCell
            cell.Configure()
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlanningCell.reuseIdentifier, for: indexPath as IndexPath) as! PlanningCell
            cell.Configure()
            return cell
        }
        
        
           
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch selectedItem {
        case "Todo":
            return CGSize(width: UIScreen.main.bounds.width, height: 450.0)
        default:
            return CGSize(width: UIScreen.main.bounds.width, height: 700.0)
        }

    }
    var selectedItem = "Todo"
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var scList: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.scList.layer.borderWidth = 1.0
        self.scList.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.05)
        self.scList.addUnderlineForSelectedSegment()
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.red], for: .selected)
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        self.scList.setTitleTextAttributes(titleTextAttributes, for:.normal)
        let titleTextAttributes1 = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.6708214283, green: 0.5866119862, blue: 1, alpha: 1)]
        self.scList.setTitleTextAttributes(titleTextAttributes1, for:.selected)

        
    }
    
    @IBAction func scIndexChanged(_ sender: UISegmentedControl) {
        switch scList.selectedSegmentIndex
            {
            case 0:
                selectedItem = "Todo"
                self.scList.changeUnderlinePosition()
                self.collectionView.reloadData()
            case 1:
                selectedItem = "Planning"
                self.scList.changeUnderlinePosition()
                self.collectionView.reloadData()
            default:
                break
            }
    }
    
    
    @IBAction func btnSharespot(_ sender: UIButton) {
        self.NavigatetoShareSpot()
        
    }
    private func NavigatetoShareSpot(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "vcShareSpot") as! vcShareSpot
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
        newViewController.didMove(toParent: self)
    }
    


}
