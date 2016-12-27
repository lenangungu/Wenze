//
//  AchatViewController.swift
//  Wenze
//
//  Created by Lena Ngungu on 12/22/16.
//  Copyright © 2016 Lena Ngungu. All rights reserved.
//

import UIKit
import MessageUI

class AchatViewController: UIViewController, MFMessageComposeViewControllerDelegate {

    @IBOutlet weak var articleNumber: UILabel!
    var arNum: Int?
    @IBOutlet weak var annulerButton: UIButton!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var numberTextField: UITextField!
    
    @IBOutlet weak var messageTextView: UITextView!
    
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        articleNumber.text = String(arNum!)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    @IBAction func sendAction(sender: AnyObject) {
        
        let msgVC = MFMessageComposeViewController()
        let additionalText = " Le numero du clients est \(numberTextField.text), son email est \(emailTextField.text), pour l'article numero \(articleNumber.text)"
        
        msgVC.body = messageTextView.text + additionalText
        
        
        msgVC.recipients = ["+14692685808"]
        
        
        msgVC.messageComposeDelegate = self
       
    }
    
    func messageComposeViewController(controller: MFMessageComposeViewController, didFinishWithResult result: MessageComposeResult) {
        
    }
   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
}






