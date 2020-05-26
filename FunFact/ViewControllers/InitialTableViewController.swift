//
//  InitialTableViewController.swift
//  FunFact
//
//  Created by Murilo Araujo on 26/05/20.
//  Copyright © 2020 LG Sistemas SA. All rights reserved.
//

import UIKit

class InitialTableViewController: UITableViewController {

    let funFacts = [TipoFunFact.random, TipoFunFact.math, TipoFunFact.date]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }

    private func setupView() {
        self.navigationItem.title = "Fun Facs"
        self.navigationItem.largeTitleDisplayMode = .always
        
        self.tableView.register(FunFactTableViewCell.self, forCellReuseIdentifier: FunFactTableViewCell.id)
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return funFacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FunFactTableViewCell.id) as? FunFactTableViewCell else {
            return UITableViewCell()
        }
        cell.setupView(funFacts[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = FunFactViewController()
        vc.funFact = funFacts[indexPath.row]
        
        self.show(vc, sender: nil)
    }
}
