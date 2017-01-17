//
//  AchatViewController.swift
//  Wenze
//
//  Created by Lena Ngungu on 12/22/16.
//  Copyright © 2016 Lena Ngungu. All rights reserved.
//

import UIKit
import MessageUI

class AchatViewController: UIViewController, MFMailComposeViewControllerDelegate {
    @IBOutlet weak var flagImage: UIImageView!
    
    @IBOutlet weak var heightC: NSLayoutConstraint!
  

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
        if (arNum! <= 3)
        {
            flagImage.image = UIImage(named: "Flag_of_the_Democratic_Republic_of_the_Congo.svg@1x")
        }
        else if (arNum! > 3 && arNum! < 5)
        {
        flagImage.image = UIImage(named: "Flag_of_South_Africa.svg")
        }
        else
        {
             flagImage.image = UIImage(named: "usa.png")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    

    
    func keyboardWillHide(ntification: NSNotification)
    {
       
        view.setNeedsLayout()
    }
    
    @IBAction func sendAction(_ sender: AnyObject) {
        
        if (emailTextField.text == "" && numberTextField.text == "")
        {
            print ("Need at least you email")
            let emailController = UIAlertController(title: "Inserez au minimum votre email pour que le vendeur entre en contact avec vous", message: nil, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .cancel){(action) in ()}
                
            emailController.addAction(okAction)
           
            self.present(emailController, animated: true, completion: nil)
                

         }
        
            
        else{
        
        if !MFMailComposeViewController.canSendMail()
        {
            print("Impossible d'envoyer un email")
        }
        
        let emailVC = MFMailComposeViewController()
        emailVC.mailComposeDelegate = self
        
        let additionalText = " Mon numero est le \(numberTextField.text!), et mon email est \(emailTextField.text!) ."
        
    
        emailVC.setToRecipients(["lenangungu@hotmail.co.uk"])
        emailVC.setSubject("Je suis interessé par votre article \(articleNumber.text!)" )
        emailVC.setMessageBody("\(messageTextView.text!)" + "\n\n\(additionalText)", isHTML: false)
        
        self.present(emailVC, animated: true, completion: nil)
        
       // msgVC.recipients = ["+14692685808"]
        
      //  msgVC.body = messageTextView.text + additionalText
       
      // self.present(msgVC, animated: true, completion: nil)
        }
      
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult, error: Error?) {
        print("email sent")
        // Check the result or perform other tasks.
        
        // Dismiss the message compose view controller.
        
       
        controller.dismiss(animated: true, completion: nil)
        transition()
      
    }
  
    func transition ()
    {
        self.dismiss(animated: false, completion: nil)
    }
    
    
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
 
  
}






