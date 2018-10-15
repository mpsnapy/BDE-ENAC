//
//  AcceuilController.swift
//  BDE ENAC
//
//  Created by Matthieu PLAINEAU on 13/10/2018.
//  Copyright © 2018 MATTHIEU PLAINEAU. All rights reserved.
//

import UIKit
import FirebaseAuth

class AcceuilController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let revealController = self.revealViewController()
        
        revealController?.rearViewRevealWidth = UIScreen.main.bounds.width / 2
        
        self.view.addGestureRecognizer((revealController?.panGestureRecognizer())!)
        self.view.addGestureRecognizer((revealController?.tapGestureRecognizer())!)
        
        let revealButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "MENU"), style: .plain, target: revealController, action: #selector(revealController?.revealToggle(_:)))
        revealButtonItem.tintColor = UIColor.black
        
        self.navigationItem.leftBarButtonItem = revealButtonItem
        
        //if ((Auth.auth().currentUser?.uid) == nil) {
        let connexionButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "LOGIN"), style: .plain, target: self, action: #selector(versConnexion))
        connexionButtonItem.tintColor = UIColor.black
        
        self.navigationItem.rightBarButtonItem = connexionButtonItem
        //}
    }
    
    @objc func versConnexion() {
        self.navigationController?.pushViewController(ConnexionController(), animated: true)
    }

}
