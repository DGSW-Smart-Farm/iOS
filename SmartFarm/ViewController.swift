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
    
    var icon: UIImageView!
    var wave: WaveAnimationView!
    let titleArr: [String] = ["수분", "온도", "햇빛", "카메라"]
    let imageArr: [String] = ["water icon"]
    let colorArr: [UIColor] = [#colorLiteral(red: 0, green: 0.8274509804, blue: 1, alpha: 0.6), #colorLiteral(red: 0.9843137255, green: 0.3725490196, blue: 0.3725490196, alpha: 0.8), #colorLiteral(red: 1, green: 0.3607843137, blue: 0.2235294118, alpha: 0.7), #colorLiteral(red: 0.4156862745, green: 0.3254901961, blue: 0.3058823529, alpha: 0.8)]
    
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
        icon = UIImageView(image: UIImage(named: "water icon"))
        icon.frame = CGRect(origin: .zero, size: cell.waveView.frame.size)
        cell.waveView.addSubview(icon)
        cell.waveView.layer.cornerRadius = cell.waveView.layer.frame.height / 2
        cell.waveView.clipsToBounds = true
        wave = WaveAnimationView(frame: CGRect(origin: .zero, size: cell.waveView.bounds.size), color: colorArr[indexPath.row])
        wave.progress = 0.4
        cell.waveView.addSubview(wave)
        cell.waveView.sendSubviewToBack(wave)
        wave.startAnimation()
        cell.titleLabel.text = titleArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func createwave(completion: () -> Void) {
        completion()
    }
}
