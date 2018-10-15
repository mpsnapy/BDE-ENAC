//
//  ConnexionController.swift
//  BDE ENAC
//
//  Created by Matthieu PLAINEAU on 13/10/2018.
//  Copyright © 2018 MATTHIEU PLAINEAU. All rights reserved.
//

import UIKit
import FirebaseAuth

class ConnexionController: UIViewController {
    
    @IBOutlet weak var connexionButton: UIButton!
    @IBOutlet weak var bienvenueLabel: UILabel!
    @IBOutlet weak var assoImageView: UIImageView!
    @IBOutlet weak var adresseMailTextField: UITextField!
    @IBOutlet weak var motDePasseTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cacherClavier)))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cacher(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let id = Auth.auth().currentUser?.uid {
            verifierUtilisateur(id: id)
        } else {
            cacher(false)
        }
        
    }
    
    func cacher(_ bool: Bool) {
        bienvenueLabel.isHidden = bool
        adresseMailTextField.isHidden = bool
        motDePasseTextField.isHidden = bool
        connexionButton.isHidden = bool
        assoImageView.isHidden = bool
    }
    
    @objc func cacherClavier() {
        view.endEditing(true)
    }
    
    func completion(_ user: User?, _ error: Error?) {
        if let erreur = error {
            let nsErreur = erreur as NSError
            if nsErreur.code == 17011 {
                //Creer utilisateur
                Auth.auth().createUser(withEmail: adresseMailTextField.text!, password: motDePasseTextField.text!, completion: completion(_:_:))
            } else {
                Alerte.montrer.erreur(message: nsErreur.convertirErreurFirebaseEnString(), controller: self)
            }
        }
        if let utilisateur = user {
            verifierUtilisateur(id: utilisateur.uid)
        }
    }
    
    func verifierUtilisateur(id: String) {
        let referenceFirebase = Refs.obtenir.baseUtilisateurs.child(id)
        referenceFirebase.observe(.value) { (snapshot) in
            if snapshot.exists() {
                //Passer à l'app
                //self.present(AcceuilController(), animated: true, completion: nil)
            } else {
                self.finalisation()
            }
        }
    }
    
    func finalisation() {
        Alerte.montrer.alerteTF(titre: FINALIER, message: DERNIER_PAS, array: [PRENOM, NOM], controller: self, completion: { (success) -> (Void) in
            if let bool = success, bool == true {
                //Passer à l'app
            } else {
                self.finalisation()
            }
        })
    }
    
    @IBAction func seConnecterAction(_ sender: Any) {
        
        self.view.endEditing(true)
        if let adresse = adresseMailTextField.text, adresse != "" {
            if let mdp = motDePasseTextField.text, mdp != "" {
                Auth.auth().signIn(withEmail: adresse, password: mdp, completion: completion(_:_:))
            } else {
                Alerte.montrer.erreur(message: MDP_VIDE, controller: self)
            }
        } else {
            Alerte.montrer.erreur(message: ADRESSE_VIDE, controller: self)
        }
        
    }
    
    @IBAction func motDePasseOublieAction(_ sender: Any) {
        
        self.navigationController?.pushViewController(MDPOublieController(), animated: true)
        
    }
    
}
