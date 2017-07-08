//
//  EditProfileViewController.swift
//  twitter_alamofire_demo
//
//  Created by Elan Halpern on 7/7/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    

    var source: UIButton!
    var imagePickerController: UIImagePickerController = UIImagePickerController()
    
    @IBOutlet weak var bannerButton: UIButton!
    @IBOutlet weak var profilePictureButton: UIButton!
    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var profilePicImageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
    }
    
    func loadImagePicker() {
        imagePickerController.sourceType = .photoLibrary
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        if(source == bannerButton) {
            bannerImageView.image = originalImage
        } else if(source == profilePictureButton) {
            profilePicImageView.image = originalImage
        }
        dismiss(animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCancelButton(_ sender: Any) {
        self.dismiss(animated: true) {
        }
    }
    
    @IBAction func onDoneButton(_ sender: Any) {
        self.dismiss(animated: true) {
        }
    }
    
    @IBAction func onChangeBanner(_ sender: Any) {
        source = bannerButton
        loadImagePicker()
        
    }
    
    @IBAction func onChangeProfilePic(_ sender: Any) {
        source = profilePictureButton
        loadImagePicker()
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
