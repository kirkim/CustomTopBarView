//
//  TabBarViewModel.swift
//  TopBarVC
//
//  Created by 김기림 on 2022/04/07.
//

import UIKit
import RxCocoa
import RxSwift

struct TopBarViewModel {
    private let disposeBag = DisposeBag()
    // TopBarLayoutView -> ViewModel
    let scrolledPage = PublishRelay<IndexPath>()
    // View -> ViewModel
    let slotChanged = PublishRelay<IndexPath>()
    
    //ViewModel -> View
    let slotChanging = BehaviorRelay<IndexPath>(value: IndexPath(row: 0, section: 0))

    init() {
        scrolledPage
            .bind(to: slotChanging)
            .disposed(by: disposeBag)
        
        slotChanged
            .bind(to: slotChanging)
            .disposed(by: disposeBag)
    }
}
