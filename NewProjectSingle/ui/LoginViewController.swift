//
//  LoginViewController.swift
//  NewProjectSingle
//
//  Created by Satendra Pal Singh on 24/02/1943 Saka.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var btn_back: UIImageView!
   
   
    
    @IBOutlet weak var userOTP: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var userName: UITextField!
    var validation = Validation()
   
    @objc func tapDetected() {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func btnLogin(_ sender: Any) {
        
      
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tabbarVC = storyboard.instantiateViewController(withIdentifier: "NavTab") as! UITabBarController
        
        self.present(tabbarVC, animated: false, completion: nil)
        
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        customTextField()
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(tapDetected))
        btn_back.isUserInteractionEnabled = true
        btn_back.addGestureRecognizer(singleTap)
        
      
        
    }
    
    func customTextField(){
        let myColor = UIColor.blue
        userOTP.layer.borderColor = myColor.cgColor
        userPassword.layer.borderColor = myColor.cgColor
        userName.layer.borderColor = myColor.cgColor

        userName.layer.borderWidth = 1.0
        userPassword.layer.borderWidth = 1.0
        userOTP.layer.borderWidth = 1.0
        
        userName.layer.cornerRadius = 15.0
        userPassword.layer.cornerRadius = 15.0
        userOTP.layer.cornerRadius = 15.0
    }

}
extension UIViewController {

    func presentAlertWithTitle(title: String, message: String, options: String..., completion: @escaping (Int) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, option) in options.enumerated() {
            alertController.addAction(UIAlertAction.init(title: option, style: .default, handler: { (action) in
                completion(index)
            }))
        }
        self.present(alertController, animated: true, completion: nil)
    }
}
