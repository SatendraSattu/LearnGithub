//
//  SecondViewController.swift
//  NewProjectSingle
//
//  Created by Satendra Pal Singh on 25/02/1943 Saka.
//

import UIKit
import Razorpay

class SecondViewController: UIViewController , RazorpayPaymentCompletionProtocol {
    func onPaymentError(_ code: Int32, description str: String) {
        print("error: ", code, str)
//               self.presentAlert(withTitle: "Alert", message: str)
    }
    
    func onPaymentSuccess(_ payment_id: String) {
        print("success: ", payment_id)
//                self.presentAlert(withTitle: "Success", message: "Payment Succeeded")
           
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        self.showPaymentForm()
    }
    var razorpay: RazorpayCheckout!
    override func viewDidLoad() {
        super.viewDidLoad()
        razorpay = RazorpayCheckout.initWithKey("rzp_test_0CSvRPIH7gbozq", andDelegate: self)
        self.title = "Second"

        // Do any additional setup after loading the view.
    }
    
    internal func showPaymentForm(){
        let options: [String:Any] = [
                    "amount": "3000", //This is in currency subunits. 100 = 100 paise= INR 1.
                    "currency": "INR",//We support more that 92 international currencies.
                    "description": "purchase description",
                    "order_id": "order_DBJOWzybf0sJbb",
                    "image": "https://abc.png",
                    "name": "Satendra tycoon",
                    "prefill": [
                        "contact": "9797979737",
                        "email": "satendra@bar.com"
                    ],
                    "theme": [
                        "color": "#F37299"
                      ]
                ]
        razorpay.open(options)
    }

}
extension SecondViewController: RazorpayPaymentCompletionProtocolWithData {
    
    func onPaymentError(_ code: Int32, description str: String, andData response: [AnyHashable : Any]?) {
        print("error: ", code)
//        self.presentAlert(withTitle: "Alert", message: str)
    }
    
    func onPaymentSuccess(_ payment_id: String, andData response: [AnyHashable : Any]?) {
        print("success: ", payment_id)
//        self.presentAlert(withTitle: "Success", message: "Payment Succeeded")
    }
}
