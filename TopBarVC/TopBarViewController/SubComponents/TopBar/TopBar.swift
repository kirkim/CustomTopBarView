//
//  TabBar.swift
//  CustomTabBar
//
//  Created by 김기림 on 2022/04/07.
//

import UIKit
import RxSwift
import RxCocoa

class TopBar: UICollectionView {
    private let disposeBag = DisposeBag()
    private let slots: [String]
    
    init(itemTitles: [String]) {
        self.slots = itemTitles
        super.init(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        attribute()
        layout()
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        fatalError()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ viewModel: TopBarViewModel) {
        Observable<IndexPath>.just(IndexPath(row: 0, section: 0))
            .bind(to: viewModel.slotChanged)
            .disposed(by: disposeBag)
        Driver.just(self.slots)
            .drive(self.rx.items) { cv, row, data in
                let cell = cv.dequeueReusableCell(withReuseIdentifier: "TopBarCell", for: IndexPath(row: row, section: 0)) as! TopBarCell
                cell.setData(title: data)
                return cell
            }
            .disposed(by: disposeBag)
        
        self.rx.itemSelected
            .distinctUntilChanged()
            .bind(to: viewModel.slotChanged)
            .disposed(by: disposeBag)
        viewModel.slotChanging
            .bind { [weak self] indexPath in
                self?.visibleCells.forEach { cell in
                    cell.backgroundColor = .clear
                }
                self?.cellForItem(at: indexPath)?.backgroundColor = .yellow
                self?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
            .disposed(by: disposeBag)
    }
    
    private func attribute() {
        self.delegate = self
        self.register(TopBarCell.self, forCellWithReuseIdentifier: "TopBarCell")
    }
    
    private func layout() {
        if let layout = self.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            layout.minimumInteritemSpacing = 10
            layout.minimumLineSpacing = 10
        }
    }
}

//MARK: - TabBar: UICollectionViewDelegateFlowLayout
extension TopBar: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let slot = self.slots[indexPath.row]
        let length = slot.count * 10
        return CGSize(width: length , height: Int(self.frame.height)-10)
    }
}
