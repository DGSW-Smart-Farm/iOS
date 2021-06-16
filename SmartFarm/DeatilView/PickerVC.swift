//
//  PickerVC.swift
//  SmartFarm
//
//  Created by 김부성 on 2021/05/04.
//

import UIKit

class PickerVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var doButton: UIButton!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleBackView: UIView!
    
    var viewName: String = ""
    var viewColor: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    var viewSubName: String = ""
    
    let boolArr: [String] = ["On", "Off"]
    var index: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doButton.layer.cornerRadius = 5
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewColor = DetailViewData.shared.color
        viewSubName = DetailViewData.shared.subname
        titleBackView.backgroundColor = DetailViewData.shared.color
        subtitleLabel.text = viewSubName
    }
    
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        print("button pressed")
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return boolArr[row]
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
