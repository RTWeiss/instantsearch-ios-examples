//
//  FilterViewController.swift
//  ecommerce
//
//  Created by Guy Daher on 23/02/2017.
//  Copyright © 2017 Guy Daher. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var controls: [UIControl] = []
    var titles: [String] = ["switch", "slider", "stepper"]
    
    let defaultFrame = CGRect(x: 0, y: 0, width: 100, height: 50)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        automaticallyAdjustsScrollViewInsets = false
        
        controls.append(createSwitch())
        controls.append(createSlider())
        controls.append(createStepper())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func createSlider() -> UISlider {
        let slider = UISlider(frame: defaultFrame)
        slider.maximumValue = 50
        slider.minimumValue = 0
        slider.value = 25
        
        return slider
    }
    
    private func createSwitch() -> UISwitch {
        return UISwitch(frame: defaultFrame)
    }
    
    private func createStepper() -> UIStepper {
        let stepper = UIStepper(frame: defaultFrame)
        stepper.stepValue = 1
        
        return stepper
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filterCell", for: indexPath)
        
        cell.detailTextLabel?.text = "text"
        cell.textLabel?.text = titles[indexPath.row]
        cell.accessoryView = controls[indexPath.row]
        
        return cell
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
