//
//  vcProfileSetting.swift
//  iBigo
//
//  Created by Mac on 7/17/21.
//



import UIKit
import CountryPickerView

class vcProfileSetting: UIViewController, CountryPickerViewDelegate, CountryPickerViewDataSource {
    func countryPickerView(_ countryPickerView: CountryPickerView, didSelectCountry country: Country) {
        print(country)
    }
    

    @IBOutlet weak var vTop: UIView!
    @IBOutlet weak var cpvCountry: CountryPickerView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var txtAboutME: DesignableTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        cpvCountry.delegate = self
        cpvCountry.dataSource = self
        cpvCountry.showCountryCodeInView = false
     //   self.hideKeyboardWhenTappedAround()
        self.txtAboutME.setupRightImage(imageName: "ico - 24 - ui - edit", imgContainerHeight: 100.0)
     //   print(searchBar.subviews[0].subviews.last)
       // let searchTextField:UITextField = searchBar.subviews[0].subviews.last as! UITextField
     //   searchTextField.setupRightImage(imageName: "ico - 24 - ui - edit", imgContainerHeight: 44.0)
      //  SearchText(to: searchBar, placeHolderText: "SearchBar")
        vTop.addBorder(toSide: .Bottom, withColor: #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5764705882, alpha: 0.05), andThickness: 1.0)
    }
    
  
    
    func SearchText(to searchBar: UISearchBar, placeHolderText: String) {
          
            let searchTextField:UITextField = searchBar.value(forKey: "searchField") as? UITextField ?? UITextField()
            let image:UIImage = UIImage(named: "ico - 24 - ui - edit")!
            let imageView:UIImageView = UIImageView.init(image: image)
            searchTextField.rightView = imageView
            searchTextField.backgroundColor = UIColor.tertiaryLabel
            searchTextField.rightViewMode = UITextField.ViewMode.always
        }
    
    @IBAction func btnChangePassword(_ sender: Any) {
    }
    
    @IBAction func btnBackPressed(_ sender: Any) {
 //       self.remove()
        dismiss(animated: true, completion: nil)

    }
}
