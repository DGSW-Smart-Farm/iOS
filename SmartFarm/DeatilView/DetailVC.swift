//
//  DetailVC.swift
//  SmartFarm
//
//  Created by 김부성 on 2021/05/16.
//

import UIKit

class DetailVC: UIViewController {
    
    var index: Int?
    
    @IBOutlet weak var pickerView: UIView!
    @IBOutlet weak var graphView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if var index = index {
            DetailViewData.shared.index = index
            imageView.image = FarmData().imageArr[index]
            if index == 1 {
                pickerView.layer.opacity = 0
            }
            else if index == 3 {
                imageView.layer.opacity = 0
                pickerView.layer.opacity = 0
                graphView.layer.opacity = 0
            }
            DetailViewData.shared.name = index.mainName()
            DetailViewData.shared.subname = index.subName()
            DetailViewData.shared.color = FarmData().detailColorArr[index]
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
