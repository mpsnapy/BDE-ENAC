//
//  Refs.swift
//  BDE ENAC
//
//  Created by Matthieu PLAINEAU on 13/10/2018.
//  Copyright © 2018 MATTHIEU PLAINEAU. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage

class Refs {
    
    static let obtenir = Refs()
    
    let baseBDD = Database.database().reference()
    let baseStockage = Storage.storage().reference()
    
    var baseUtilisateurs: DatabaseReference {
        return baseBDD.child(UTILISATEUR)
    }
    
    var basePost: DatabaseReference {
        return baseBDD.child(POST)
    }
    
    var basePhotosDeProfil: StorageReference {
        return baseStockage.child(UTILISATEUR)
    }
    
    var basePhotosduPost: StorageReference {
        return baseStockage.child(POST)
    }
    
}
