//
//  TabBarMain.swift
//  CustomTabBar
//
//  Created by 김기림 on 2022/04/07.
//

import UIKit
import SnapKit

struct TabBarItem {
    let viewController: UIViewController
    let itemTitle: String
}

class TopBarMainViewController: UIViewController {
    private let subViewControllers: [UIViewController]
    private let layoutView: TopBarLayoutView
    private let topBar: TopBar
    private var bottomBar: BottomBar?
    private let viewModel = TopBarMainViewModel()
    
    init(tabBarItems: [TabBarItem], startPage: Int = 0, bottomBar: BottomBar?) {
        let titles = tabBarItems.map { $0.itemTitle }
        let viewControllers = tabBarItems.map { $0.viewController }
        if ((bottomBar) != nil) {
            self.bottomBar = bottomBar
        }
        
        self.subViewControllers = viewControllers
        self.layoutView = TopBarLayoutView(views: viewControllers.map { $0.view }, startPage: startPage)
        self.topBar = TopBar(itemTitles: titles, startPage: startPage)
        super.init(nibName: nil, bundle: nil)
        attribute()
        layout()
        bind(viewModel)
    }
    
    override private init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ viewModel: TopBarMainViewModel) {
        let layoutViewModel = viewModel.layoutViewModel
        let tabBarViewModel = viewModel.tabBarViewModel
        self.layoutView.bind(layoutViewModel)
        self.topBar.bind(tabBarViewModel)
        
    }
    
    private func attribute() {
        self.subViewControllers.forEach {
            self.addChild($0)
            $0.didMove(toParent: self)
        }
        
        self.view.backgroundColor = .systemMint
        
        self.topBar.layer.cornerRadius = 10
    }
    
    private func layout() {
        [topBar, layoutView].forEach {
            self.view.addSubview($0)
        }
        
        topBar.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        layoutView.snp.makeConstraints {
            $0.top.equalTo(topBar.snp.bottom).offset(10)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        if let bottomBar = bottomBar {
            self.view.addSubview(bottomBar)
            bottomBar.snp.makeConstraints {
                $0.leading.trailing.bottom.equalToSuperview()
                $0.height.equalTo(100)
            }
        }
    }
}
