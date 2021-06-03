//
//  DetailVC.swift
//  SmartFarm
//
//  Created by 김부성 on 2021/05/16.
//

import UIKit

class DetailVC: UIViewController {
    
    var index: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if var index = index {
            print(index.index())
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
