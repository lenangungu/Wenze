//
//  AchatViewController.swift
//  Wenze
//
//  Created by Lena Ngungu on 12/22/16.
//  Copyright © 2016 Lena Ngungu. All rights reserved.
//

import UIKit

class AchatViewController: UIViewController {

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
    
   
    
   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
}
