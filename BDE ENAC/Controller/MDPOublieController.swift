//
//  MDPOublieController.swift
//  BDE ENAC
//
//  Created by Matthieu PLAINEAU on 15/10/2018.
//  Copyright © 2018 MATTHIEU PLAINEAU. All rights reserved.
//

import UIKit
import FirebaseAuth

class MDPOublieController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var adresseMailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = "Veuillez entrer votre adresse mail. Vous recevrez un e-mail dans lequel nous vous inviterons à réinitialiser votre mot de passe."

    }

    @IBAction func envoyerMailMDPOublieAction(_ sender: Any) {
        
        Auth.auth().sendPasswordReset(withEmail: adresseMailTextField.text!, completion: nil)
        self.navigationController?.popViewController(animated: true)
        
    }
    
}
