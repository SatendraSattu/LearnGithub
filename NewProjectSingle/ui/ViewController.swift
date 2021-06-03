//
//  ViewController.swift
//  NewProjectSingle
//
//  Created by Satendra Pal Singh on 23/02/1943 Saka.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func btnNextToLogin(_ sender: Any) {
        
               let storyboard = UIStoryboard(name: "Main", bundle: nil);
               let vc = storyboard.instantiateViewController(identifier: "LoginScreen") as UIViewController
              vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil);
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    override func viewWillAppear(_ animated: Bool) {
        <#code#>
    }

}

