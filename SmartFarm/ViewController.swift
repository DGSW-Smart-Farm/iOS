//
//  ViewController.swift
//  SmartFarm
//
//  Created by 김부성 on 2021/04/01.
//

import UIKit

import WaveAnimationView

class ViewController: UIViewController {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var wave: WaveAnimationView!
    let titleArr: [String] = ["수분", "온도", "햇빛", "카메라"]
    let imageArr: [String] = ["water icon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        backView.layer.cornerRadius = 25
        titleLabel.adjustsFontSizeToFitWidth = true
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MainCell
        
        cell.waveView.layer.cornerRadius = cell.waveView.layer.frame.height / 2
        cell.waveView.clipsToBounds = true
        wave = WaveAnimationView(frame: CGRect(origin: .zero, size: cell.waveView.bounds.size), color: .systemBlue)
        cell.waveView.addSubview(wave)
//        wave.maskImage = UIImage(named: "\(imageArr[0])")
        wave.startAnimation()
        cell.titleLabel.text = titleArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}
