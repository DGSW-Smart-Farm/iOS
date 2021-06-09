//
//  ViewController.swift
//  SmartFarm
//
//  Created by 김부성 on 2021/04/01.
//

import UIKit

import Alamofire
import WaveAnimationView
import SkeletonView

class MainVC: UIViewController {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var icon: UIImageView!
    var wave: WaveAnimationView!
    let farmData = FarmData()
    let decoder = JSONDecoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.clearNavigationBar()
        // Do any additional setup after loading the view.
        backView.layer.cornerRadius = 25
        titleLabel.adjustsFontSizeToFitWidth = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        farmData.dataArr = []
        self.tableView.reloadData()
        Utils.request(uri: "/get_home") { error, data in
            if error == nil {
                let jsonData = try? self.decoder.decode(AllDataResponse.self, from: data!)
                self.farmData.dataArr.append("\(jsonData?.humidity_gnd.value ?? 0)")
                self.farmData.dataArr.append("\(jsonData?.temp.value ?? 0)")
                self.farmData.dataArr.append("\(jsonData?.led.status ?? false)")
                self.farmData.dataArr.append("더보기")
                self.tableView.reloadData()
            }
        }
    }

}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailVC
            vc?.index = sender as? Int
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return farmData.titleArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // MainCell 연결
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MainCell
        
        // icon 추가
        var icon = cell.waveView.viewWithTag(1) as? UIImageView
        if (icon == nil) {
            icon = UIImageView(image: farmData.iconArr[indexPath.row])
            icon!.frame = CGRect(origin: .zero, size: cell.waveView.frame.size)
            icon!.tag = 1
            cell.waveView.addSubview(icon!)
        } else {
            icon!.image = farmData.iconArr[indexPath.row]
        }
        
        var wave = cell.waveView.viewWithTag(2) as? WaveAnimationView
        if wave == nil {
            // wave animation 추가
            wave = WaveAnimationView(frame: CGRect(origin: .zero, size: cell.waveView.bounds.size), color: farmData.colorArr[indexPath.row])
            wave!.progress = 0.6
            wave!.tag = 2
            cell.waveView.addSubview(wave!)
            cell.waveView.sendSubviewToBack(wave!)
            wave!.startAnimation()
        } else {
            wave = WaveAnimationView(frame: CGRect(origin: .zero, size: cell.waveView.bounds.size),color: farmData.colorArr[indexPath.row])
        }

        // title 추가
        cell.titleLabel.text = farmData.titleArr[indexPath.row]
        
        // 데이터가 들어왔을경우 스켈레톤 해제
        if farmData.dataArr.isEmpty != true {
            cell.valueLabel.text = farmData.dataArr[indexPath.row]
            cell.valueBox.hideSkeleton(transition: .crossDissolve(0.25))
            cell.valueBox.layer.cornerRadius = 7
        }
        else {
            cell.valueLabel.text = ""
            let animation = SkeletonAnimationBuilder().makeSlidingAnimation(withDirection: .leftRight)
            cell.valueBox.showAnimatedGradientSkeleton(usingGradient: SkeletonGradient(baseColor: #colorLiteral(red: 0.8196078431, green: 0.8196078431, blue: 0.8196078431, alpha: 1), secondaryColor: #colorLiteral(red: 0.7058823529, green: 0.7058823529, blue: 0.7058823529, alpha: 1)), animation: animation, transition: .crossDissolve(0.25))
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
