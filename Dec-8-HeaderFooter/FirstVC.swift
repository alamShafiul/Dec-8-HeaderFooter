//
//  ViewController.swift
//  Dec-8-HeaderFooter
//
//  Created by Admin on 8/12/22.
//

import UIKit

class FirstVC: UIViewController {
    
    var bikeData = Bike.bikeLists
    var carData = Car.carLists

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var inputVehicle: UITextField!
    
    @IBOutlet weak var inputCompany: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        let xib = UINib(nibName: Constants.xibPath, bundle: nil)
        tableView.register(xib, forHeaderFooterViewReuseIdentifier: Constants.xibPath)
        
    }

    @IBAction func addBtn(_ sender: Any) {
        appendData()
    }
    
    func appendData() {
        if let iV = inputVehicle.text, let iC = inputCompany.text {
            if( iV != "" && iC != "") {
                if(iV.uppercased() == "BIKE") {
                    bikeData.append(Bike(name: iC))
                    tableView.reloadSections([0], with: .fade)
                }
                else if(iV.uppercased() == "CAR") {
                    carData.append(Car(name: iC))
                    tableView.reloadSections([1], with: .fade)
                }
                inputVehicle.text = ""
                inputCompany.text = ""
            }
        }
    }
}


extension FirstVC: UITableViewDelegate {
}


extension FirstVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0) {
            return bikeData.count
        }
        else {
            return carData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellOne = tableView.dequeueReusableCell(withIdentifier: Constants.tempCellOne, for: indexPath)
        
        if(indexPath.section == 0) {
            cellOne.textLabel?.text = bikeData[indexPath.row].name
        }
        else {
            cellOne.textLabel?.text = carData[indexPath.row].name

        }
        return cellOne
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(indexPath.section == 0) {
            tableView.beginUpdates()
            bikeData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
        else {
            tableView.beginUpdates()
            carData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let customHeaderXib = tableView.dequeueReusableHeaderFooterView(withIdentifier: "customHeaderView") as! customHeaderView
        
        if(section == 0) {
            customHeaderXib.headerImg.image = UIImage(named: Constants.bike)
            customHeaderXib.headerLabel.text = "Bike"
        }
        else {
            customHeaderXib.headerImg.image = UIImage(named: Constants.car)
            customHeaderXib.headerLabel.text = "Car"
        }
        
        return customHeaderXib
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
}

