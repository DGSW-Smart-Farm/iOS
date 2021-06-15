//
//  GraphVC.swift
//  SmartFarm
//
//  Created by 김부성 on 2021/05/26.
//

import UIKit

import KDCircularProgress

class GraphVC: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var graphView: KDCircularProgress!
    @IBOutlet weak var nameBackView: UIView!
    
    var viewName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        graphView.angle = 0
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // singleton pattern
        graphView.set(colors: DetailViewData.shared.color)
        nameBackView.backgroundColor = DetailViewData.shared.color
        viewName = DetailViewData.shared.name
        nameLabel.text = "\(DetailViewData.shared.name)현황"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        animateGraph()
    }
    
    func animateGraph() -> Void {
        graphView.animate(fromAngle: 0,toAngle: 180, duration: 0.5, completion: nil)
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
