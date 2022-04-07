//
//  TopBarViewModel.swift
//  TopBarVC
//
//  Created by 김기림 on 2022/04/07.
//

import Foundation
import RxSwift

struct TopBarMainViewModel {
    let tabBarViewModel = TopBarViewModel()
    let layoutViewModel = TopBarLayoutViewModel()
    
    private let disposeBag = DisposeBag()
    
    init() {
        layoutViewModel.scrolledPage
            .emit(to: tabBarViewModel.scrolledPage)
            .disposed(by: disposeBag)
        
        tabBarViewModel.slotChanged
            .bind(to: layoutViewModel.slotChanged)
            .disposed(by: disposeBag)
    }
}
