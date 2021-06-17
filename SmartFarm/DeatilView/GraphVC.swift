//
//  GraphVC.swift
//  SmartFarm
//
//  Created by 김부성 on 2021/05/26.
//

import UIKit

import KDCircularProgress

class GraphVC: UIViewController {
    
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var graphView: KDCircularProgress!
    @IBOutlet weak var nameBackView: UIView!
    @IBOutlet weak var explainLabel: UILabel!
    @IBOutlet weak var explain2Label: UILabel!
    
    var viewName: String = ""
    var valueText: String?
    var angle: Double = 0
    
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
        
        
        switch DetailViewData.shared.index {
        case 0:
            angle = Double(360 * (50 / 2))
            print(angle)
            explainLabel.text = "수분이 부족해요"
            explain2Label.text = "물주기 기능을 이용해 물을 주세요"
        case 1:
            angle = Double(360 * (50 / 100))
            explainLabel.text = "적당한 온도에요"
            explain2Label.text = "정말 기분이 좋은 날입니다....."
        case 2:
            valueLabel.text = FarmData.shared.dataArr[DetailViewData.shared.index]?.led()
            let explaintext = FarmData.shared.dataArr
            explain2Label.layer.opacity = 0
            if explaintext[2] == "true" {
                explainLabel.text = "LED 기능이 켜져있어요"
                angle = 360
            } else {
                explainLabel.text = "LED 기능이 꺼져있어요"
                angle = 0
            }
        default:
            explainLabel.text = "에러"
        }
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        animateGraph(angle: angle)
    }
    
    func animateGraph(angle: Double) -> Void {
        graphView.animate(fromAngle: 0,toAngle: angle, duration: 0.5, completion: nil)
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
