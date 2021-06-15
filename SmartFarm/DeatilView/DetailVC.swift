//
//  DetailVC.swift
//  SmartFarm
//
//  Created by 김부성 on 2021/05/16.
//

import UIKit

class DetailVC: UIViewController {
    
    var index: Int?
    @IBOutlet weak var PickerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        if var index = index {
            if index == 1 || index == 3 {
                PickerView.isHidden = true
            } else { PickerView.isHidden = false}
            DetailViewData.shared.name = index.mainName()
            DetailViewData.shared.subname = index.subName()
            DetailViewData.shared.color = FarmData().colorArr[index]
        }
        // Do any additional setup after loading the view.
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
