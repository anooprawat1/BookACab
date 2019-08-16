//
//  VehicleDetailVC.swift
//  BookACab
//
//  Created by Anoop on 16/8/19.
//  Copyright © 2019 Anoop. All rights reserved.
//

import UIKit

class VehicleDetailVC: UIViewController {

    @IBOutlet var vehicleTableView: UITableView!
    @IBOutlet var headerImageView: UIImageView!
    @IBOutlet var footerButtonView: UIView!
    var viewModel: VehicleDetailVM!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.uidelegate = self
        vehicleTableView.tableHeaderView = headerImageView
        vehicleTableView.tableHeaderView?.frame = CGRect(x: 0, y: 0, width: vehicleTableView.frame.width, height: 150)
        vehicleTableView.tableFooterView = footerButtonView
        vehicleTableView.tableFooterView?.frame = CGRect(x: 0, y: 0, width: vehicleTableView.frame.width, height: 50)
        self.showDetails()
    }
    
    func showDetails() {
        self.vehicleTableView.reloadData()
        self.headerImageView.imageFromURL(self.viewModel.vehicle?.vehicleTypeImageUrl ?? "")
    }
    
    @IBAction func quickRentAction() {
        if viewModel.vehicle != nil {
            
        }
    }
}

extension VehicleDetailVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let description = viewModel.descriptionAtIndex(indexPath.row)
        cell.textLabel?.text = description
        return cell
    }
    
}

extension VehicleDetailVC: UIDelegate {
    
    func updateUI() {
        DispatchQueue.main.async {
            self.showDetails()
        }
       
    }
}
