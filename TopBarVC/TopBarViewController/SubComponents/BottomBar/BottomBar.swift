//
//  BottomBar.swift
//  TopBarVC
//
//  Created by 김기림 on 2022/04/08.
//

import UIKit
import SnapKit

// 너비가 항상 앱화면너비와 같도록 만들어야 정상적으로 UI가 만들어진다
class BottomBar: UIView {
    let button1 = UIButton()
    let button2 = UIButton()
    let button3 = UIButton()
    let button4 = UIButton()
    let centerButton = UIButton()
    let CENTERBUTTONRATIO: CGFloat = 0.17 // 가운데 버튼의 비율만 정해주면됨 (윈도우 너비 기준)
    let windowWidth = (UIApplication.shared.connectedScenes.first!.delegate as! SceneDelegate).windowWidth
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        attribute()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func attribute() {
        self.backgroundColor = .white
        self.button1.backgroundColor = .systemCyan
        self.button2.backgroundColor = .yellow
        self.button3.backgroundColor = .green
        self.button4.backgroundColor = .systemBrown
        self.centerButton.backgroundColor = .systemBlue
        self.centerButton.layer.cornerRadius = windowWidth! * CENTERBUTTONRATIO / 2
    }
    
    private func layout() {
        [button1, button2, button3, button4, centerButton].forEach {
            self.addSubview($0)
        }
        let BUTTONRATIO: CGFloat = (1.0-CENTERBUTTONRATIO) / 4.0
        
        button1.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(BUTTONRATIO)
        }
        
        button2.snp.makeConstraints {
            $0.leading.equalTo(button1.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(BUTTONRATIO)
        }
        
        centerButton.snp.makeConstraints {
            $0.leading.equalTo(button2.snp.trailing)
            $0.width.equalToSuperview().multipliedBy(CENTERBUTTONRATIO)
            $0.height.equalTo(centerButton.snp.width)
            $0.top.equalToSuperview().inset(-20)
        }
        
        button3.snp.makeConstraints {
            $0.leading.equalTo(centerButton.snp.trailing)
            $0.top.bottom.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(BUTTONRATIO)
        }
        
        button4.snp.makeConstraints {
            $0.leading.equalTo(button3.snp.trailing)
            $0.top.bottom.trailing.equalToSuperview()
        }
    }
}
