//
//  TabBarCell.swift
//  CustomTabBar
//
//  Created by 김기림 on 2022/04/07.
//

import UIKit
import SnapKit

class TopBarCell: UICollectionViewCell {
    let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        self.titleLabel.textColor = .black
        self.backgroundColor = .clear
    }
    
    func isValid(_ isValid: Bool) {
        if (isValid) {
            self.backgroundColor = .systemMint
            self.titleLabel.textColor = .white
        } else {
            self.backgroundColor = .clear
            self.titleLabel.textColor = .black
        }
    }

    private func attribute() {
        self.titleLabel.textAlignment = .center
        self.titleLabel.textColor = .black
        self.layer.cornerRadius = 15
    }
    
    private func layout() {
        [titleLabel].forEach {
            self.addSubview($0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
    
    func setData(title: String) {
        self.titleLabel.text = title
    }
}
