//
//  ViewController.swift
//  TopBarVC
//
//  Created by 김기림 on 2022/04/07.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift

class RootViewController: UIViewController {
    private let viewModel = TopBarMainViewModel(
        topBarItems: [
            TopBarItem(viewController: Test1(), itemTitle: "test11231231231"),
            TopBarItem(viewController: Test2(), itemTitle: "test222"),
            TopBarItem(viewController: Test3(), itemTitle: "tes"),
            TopBarItem(viewController: Test1(), itemTitle: "test1"),
            TopBarItem(viewController: Test2(), itemTitle: "test2"),
            TopBarItem(viewController: Test3(), itemTitle: "test3")
        ], bottomBarItem: BottomBarItem(
            presentVC1: ButtonVC1(),
            presentVC2: ButtonVC2(),
            presentVC3: ButtonVC3(),
            presentVC4: ButtonVC4()
        ),
        startPage: 3
    )
    private let disposeBag = DisposeBag()
    private let titleLabel = UILabel()
    private let openButton = UIButton()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        attribute()
        layout()
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func bind() {
        openButton.rx.tap
            .bind {
                let vc = TopBarMainViewController()
                vc.bind(self.viewModel)
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            }
            .disposed(by: disposeBag)
    }
    
    private func attribute() {
        self.view.backgroundColor = .white
        
        titleLabel.text = "메인 뷰"
        titleLabel.font = .systemFont(ofSize: 40, weight: .bold)
        titleLabel.textAlignment = .center
        
        self.openButton.setTitle("TopBarView 열기", for: .normal)
        self.openButton.setTitleColor(.blue, for: .normal)
    }
    
    private func layout() {
        [titleLabel, openButton].forEach {
            self.view.addSubview($0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(100)
            $0.leading.trailing.equalToSuperview()
        }
        
        self.openButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(50)
            $0.centerX.equalToSuperview()
        }
    }
}

