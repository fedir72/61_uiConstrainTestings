//
//  ViewController.swift
//  constrainTest
//
//  Created by fedir on 03.09.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let tableview: UITableView = {
     let view = UITableView()
     view.translatesAutoresizingMaskIntoConstraints = false
     return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        settingsFortableView()
    }

    func settingsFortableView() {
        
    tableview.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "MyCell")
    tableview.delegate = self
    tableview.dataSource = self
    view.addSubview(tableview)
        
    tableview.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
    tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
    tableview.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
    tableview.topAnchor.constraint(equalTo:view.topAnchor, constant:  view.layoutMargins.top).isActive = true
    }
    
   
    
}

extension ViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 10
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let  cell = tableview.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
           cell.backgroundColor = .systemBlue
           return cell
       }
       
       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           100
       }
    
}
