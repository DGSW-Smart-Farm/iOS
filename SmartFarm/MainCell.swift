//
//  MainCell.swift
//  SmartFarm
//
//  Created by 김부성 on 2021/04/28.
//

import UIKit

class MainCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var waveView: UIView!
    @IBOutlet weak var valueBox: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // cell icon을 원 형태로 변경
        waveView.layer.cornerRadius = waveView.layer.frame.height / 2
        waveView.clipsToBounds = true
        
        // valueBox의 모서리 라운딩
        valueBox.layer.cornerRadius = 7
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
