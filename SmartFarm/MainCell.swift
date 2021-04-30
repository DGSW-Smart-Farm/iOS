//
//  MainCell.swift
//  SmartFarm
//
//  Created by 김부성 on 2021/04/28.
//

import UIKit

import SkeletonView

class MainCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var waveView: UIView!
    @IBOutlet weak var valueBox: UIView!
    
    let animation = SkeletonAnimationBuilder().makeSlidingAnimation(withDirection: .leftRight)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // valueBox 스켈레톤 처리
        valueBox.showAnimatedGradientSkeleton(usingGradient: SkeletonGradient(baseColor: #colorLiteral(red: 0.8196078431, green: 0.8196078431, blue: 0.8196078431, alpha: 1), secondaryColor: #colorLiteral(red: 0.7058823529, green: 0.7058823529, blue: 0.7058823529, alpha: 1)), animation: animation, transition: .crossDissolve(0.25))
        valueLabel.text = ""
        
        // cell icon을 원 형태로 변경
        waveView.layer.cornerRadius = waveView.layer.frame.height / 2
        waveView.clipsToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
