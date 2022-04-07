//
//  TopBarLayoutViewModel.swift
//  TopBarVC
//
//  Created by 김기림 on 2022/04/07.
//

import UIKit
import RxCocoa

struct TopBarLayoutViewModel {
    // View -> ViewModel
    let pageChanging = PublishRelay<Int>()
    
    // ViewModel -> View
    let scrolledPage: Signal<IndexPath>
    
    // TabBarView -> ViewModel -> View
    let slotChanged = PublishRelay<IndexPath>()
    
    init() {
        scrolledPage = pageChanging
            .map { page in
                return IndexPath(row: page, section: 0)
            }
            .asSignal(onErrorJustReturn: IndexPath(row: 0, section: 0))
    }
}
