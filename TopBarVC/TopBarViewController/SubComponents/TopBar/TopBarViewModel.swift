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
    let slotChanging = PublishRelay<IndexPath>() // 구독시점이 항상 datasources 세팅완료시점보다 빨라서 cell변경용이라면 Behavior을 쓸필요가 없다고 생각

    init() {
        scrolledPage
            .bind(to: slotChanging)
            .disposed(by: disposeBag)
        
        slotChanged
            .bind(to: slotChanging)
            .disposed(by: disposeBag)
    }
}
