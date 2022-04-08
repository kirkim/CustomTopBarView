//
//  TopBarViewModel.swift
//  TopBarVC
//
//  Created by 김기림 on 2022/04/07.
//

import UIKit
import Foundation
import RxSwift
import RxCocoa

struct TopBarMainViewModel {
    let topBarViewModel: TopBarViewModel
    let layoutViewModel: TopBarLayoutViewModel
    let bottomBarViewModel: BottomBarViewModel
    let subViewControllers: [UIViewController]
    
    private let disposeBag = DisposeBag()
    
    // ViewModel -> View
    let presentVC: Signal<UIViewController>
    let dismissVC: Signal<Void>
    
    init(topBarItems: [TopBarItem], bottomBarItem: BottomBarItem, startPage: Int = 0) {
        let titles = topBarItems.map { $0.itemTitle }
        let viewControllers = topBarItems.map { $0.viewController }
        
        self.subViewControllers = viewControllers
        self.layoutViewModel = TopBarLayoutViewModel(views: viewControllers.map { $0.view }, startPage: startPage)
        self.topBarViewModel = TopBarViewModel(itemTitles: titles, startPage: startPage)
        self.bottomBarViewModel = BottomBarViewModel(bottomBarItem: bottomBarItem)
        
        layoutViewModel.scrolledPage
            .emit(to: topBarViewModel.scrolledPage)
            .disposed(by: disposeBag)
        
        topBarViewModel.slotChanged
            .bind(to: layoutViewModel.slotChanged)
            .disposed(by: disposeBag)
        
        presentVC = bottomBarViewModel.presentVC.asSignal()
        dismissVC = bottomBarViewModel.dismissVC.asSignal()
    }
}
