//
//  vcSplash.swift
//  iBigo
//
//  Created by pc link on 29/06/2021.
//

import UIKit

class vcSplash: UIViewController {

    
// MARK: - Initialization
    
// MARK: - Tableview delegate methods
    
// MARK: - CollectionView delegate methods
    
// MARK: - ViewController delegate methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.splashScreen()
    }
    
// MARK: - Textfeild delegate methods
    
// MARK: - Methods
    @objc func dismissSplashController(){

        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "vcSignIn") as! vcSignIn
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated:true, completion:nil)
    }
    public func splashScreen(){
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(dismissSplashController), userInfo: nil, repeats: false)
    }
}
