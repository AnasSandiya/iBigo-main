//
//  vcSignUpProfile.swift
//  iBigo
//
//  Created by pc link on 29/06/2021.
//

import UIKit
import StepProgressBar


class vcSignUpProfile: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

// MARK: - Initialization
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var editImageView: UIImageView!
    @IBOutlet weak var stepProgressbar: StepProgressBar!
    
// MARK: - Tableview delegate methods
    
// MARK: - CollectionView delegate methods
    
// MARK: - ViewController delegate methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.SetupView()
    }
    
// MARK: - Textfeild delegate methods
    
// MARK: - Methods
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        _ = tapGestureRecognizer.view as! UIImageView
        self.showAlert()
    }
    private func showAlert() {

           let alert = UIAlertController(title: "Image Selection", message: "From where you want to pick this image?", preferredStyle: .actionSheet)
           alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(action: UIAlertAction) in
               self.getImage(fromSourceType: .camera)
           }))
           alert.addAction(UIAlertAction(title: "Photo Album", style: .default, handler: {(action: UIAlertAction) in
               self.getImage(fromSourceType: .photoLibrary)
           }))
           alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
           self.present(alert, animated: true, completion: nil)
       }

       //get image from source type
       private func getImage(fromSourceType sourceType: UIImagePickerController.SourceType) {

           //Check is source type available
           if UIImagePickerController.isSourceTypeAvailable(sourceType) {

               let imagePickerController = UIImagePickerController()
               imagePickerController.delegate = self
               imagePickerController.sourceType = sourceType
               self.present(imagePickerController, animated: true, completion: nil)
           }
       }
    private func SetupView(){
        
      //  let anyAvatarImage:UIImage = UIImage(named: "ico - 24 - user - account_circle")!
    //    self.imageView.maskCircle(anyImage: anyAvatarImage)
        
     //   let editImage:UIImage = UIImage(named: "ico - 24 - ui - edit")!
      //  self.editImageView.maskCircle(anyImage: editImage)

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
          imageView.isUserInteractionEnabled = true
          imageView.addGestureRecognizer(tapGestureRecognizer)
        
        for view in self.view.subviews as [UIView] {
            if let btn = view as? UIButton {
                if let text = btn.titleLabel?.text {
                    if(text.isEqualToString(find: "Next")){
                        properties.buttonProperties(button: btn, titleColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), borderColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) , bgColor: #colorLiteral(red: 0.6708214283, green: 0.5866119862, blue: 1, alpha: 1),cornerRadius: 10,borderWidth: 1)
                    }
                }
            }
        }
    }

//MARK:- UIImagePickerViewDelegate.
       func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

           self.dismiss(animated: true) { [weak self] in
               guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
               //Setting image to your image view
               self?.imageView.image = image
           }
       }

       func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
           picker.dismiss(animated: true, completion: nil)
       }
}

