//
//  MenuController.swift
//  BDE ENAC
//
//  Created by Matthieu PLAINEAU on 13/10/2018.
//  Copyright © 2018 MATTHIEU PLAINEAU. All rights reserved.
//

import UIKit

class MenuController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var maPremiereIV: UIImageView?
    var monLabel: UILabel?
    var maTableMenu: UITableView?
    
    let cellID = "MenuTableCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let largeurVue = view.frame.width
        let largeurImage: CGFloat = 100
        let x = largeurVue / 4
        let rectIV = CGRect(x: x, y: 40, width: largeurImage, height: largeurImage)
        maPremiereIV = UIImageView(frame: rectIV)
        maPremiereIV?.image = UIImage(named: "ASSO ENAC")
        maPremiereIV?.contentMode = .scaleAspectFill
        maPremiereIV?.clipsToBounds = true
        maPremiereIV?.layer.cornerRadius = maPremiereIV!.frame.width / 2
        self.view.addSubview(maPremiereIV!)
        
        let largeurLabel: CGFloat = largeurVue * (2/3)
        let xLabel = largeurVue / 3 - largeurLabel / 2
        let rectLabel = CGRect(x: 8, y: 160, width: largeurLabel, height: 50)
        monLabel = UILabel(frame: rectLabel)
        monLabel?.text = "Clubs suivis : 0 | Classement : 17"
        monLabel?.numberOfLines = 0
        monLabel?.textColor = UIColor.black
        monLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        monLabel?.textAlignment = .center
        self.view.addSubview(monLabel!)
        
        let rectTable = CGRect(x: 0, y: 200, width: largeurVue - 60, height: 300)
        maTableMenu = UITableView(frame: rectTable)
        //self.view.addSubview(maTableMenu!)
        
        maTableMenu?.delegate = self
        maTableMenu?.dataSource = self
        
        let nib = UINib(nibName: cellID, bundle: nil)
        maTableMenu?.register(nib, forCellReuseIdentifier: cellID)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    @IBAction func seDeconnecterAction(_ sender: Any) {
        
        Alerte.montrer.deco(controller: self)
        
    }
    
}
