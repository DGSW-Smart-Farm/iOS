//
//  ViewController.swift
//  SmartFarm
//
//  Created by 김부성 on 2021/04/01.
//

import UIKit

import WaveAnimationView
import SkeletonView

class MainVC: UIViewController {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var icon: UIImageView!
    var wave: WaveAnimationView!
    let titleArr: [String] = ["수분", "온도", "LED", "카메라"]
    let iconArr: [String] = ["water icon", "temperature icon", "light icon", "camera icon"]
    let colorArr: [UIColor] = [#colorLiteral(red: 0, green: 0.8274509804, blue: 1, alpha: 0.6), #colorLiteral(red: 0.9843137255, green: 0.3725490196, blue: 0.3725490196, alpha: 0.8), #colorLiteral(red: 1, green: 0.3607843137, blue: 0.2235294118, alpha: 0.7), #colorLiteral(red: 0.4156862745, green: 0.3254901961, blue: 0.3058823529, alpha: 0.8)]
    var dataArr: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.clearNavigationBar()
        // Do any additional setup after loading the view.
        backView.layer.cornerRadius = 25
        titleLabel.adjustsFontSizeToFitWidth = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        dataArr = []
        self.tableView.reloadData()
        networking() { value in
            self.dataArr.append("\(value.humidity.value ?? 0)%")
            self.dataArr.append("\(value.temperature.value ?? 0)도")
            self.dataArr.append("\(value.light.LEDStatus ?? false)")
            self.dataArr.append("더보기")
            self.tableView.reloadData()
        }
    }

}

func networking(complition:@escaping (FarmData) -> ()) -> Void {
    do {
        try Utils.request(uri: "/get_home") { data in
            var value: FarmData = FarmData(humidity: JSONValue(), temperature: JSONValue(), light: JSONValue())
            value.humidity.value = data["humidity"]["value"].intValue
            value.temperature.value = data["temp"]["value"].intValue
            value.light.LEDStatus = data["LED"]["value"].boolValue
            complition(value)
        }
    } catch let error {
        print(error)
    }
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // MainCell 연결
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MainCell
        
        // icon 추가
        var icon = cell.waveView.viewWithTag(1) as? UIImageView
        if (icon == nil) {
            icon = UIImageView(image: UIImage(named: "\(iconArr[indexPath.row])"))
            icon!.frame = CGRect(origin: .zero, size: cell.waveView.frame.size)
            icon!.tag = 1
            cell.waveView.addSubview(icon!)
        } else {
            icon!.image = UIImage(named: "\(iconArr[indexPath.row])")
        }
        
        var wave = cell.waveView.viewWithTag(2) as? WaveAnimationView
        if wave == nil {
            // wave animation 추가
            wave = WaveAnimationView(frame: CGRect(origin: .zero, size: cell.waveView.bounds.size), color: colorArr[indexPath.row])
            wave!.progress = 0.6
            wave!.tag = 2
            cell.waveView.addSubview(wave!)
            cell.waveView.sendSubviewToBack(wave!)
            wave!.startAnimation()
        } else {
            wave = WaveAnimationView(frame: CGRect(origin: .zero, size: cell.waveView.bounds.size),color: colorArr[indexPath.row])
        }

        
        // title 추가
        cell.titleLabel.text = titleArr[indexPath.row]
        
        // 데이터가 들어왔을경우 스켈레톤 해제
        if dataArr.isEmpty != true {
            cell.valueLabel.text = dataArr[indexPath.row]
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
