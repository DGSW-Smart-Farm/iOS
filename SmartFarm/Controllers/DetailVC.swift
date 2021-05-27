//
//  DetailVC.swift
//  SmartFarm
//
//  Created by 김부성 on 2021/05/16.
//

import UIKit

class DetailVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NotificationCenter.default.post(name: .viewAppear, object: String())
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

extension Notification.Name {
    static let viewAppear = Notification.Name("viewappear")
}
