//
//  TopBarLayoutView.swift
//  CustomTabBar
//
//  Created by 김기림 on 2022/04/07.
//
import UIKit
import RxSwift
import RxCocoa

class TopBarLayoutView: UICollectionView  {
    private let disposeBag = DisposeBag()
    private let views: [UIView]
    let nowPage = BehaviorSubject<Int>(value: 0)
    var nowPageFlag: Int = 0
    
    init(views: [UIView]) {
        self.views = views
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
    
    func bind(_ viewModel: TopBarLayoutViewModel) {
        Driver.just(self.views)
            .drive(self.rx.items) { cv, row, data in
                let cell = cv.dequeueReusableCell(withReuseIdentifier: "TopBarLayoutViewCell", for: IndexPath(row: row, section: 0)) as! TopBarLayoutViewCell
                cell.setData(view: data)
                return cell
            }
            .disposed(by: disposeBag)
        
        self.nowPage
            .distinctUntilChanged()
            .bind(to: viewModel.pageChanging)
            .disposed(by: disposeBag)
        
        viewModel.slotChanged
            .bind { [weak self] indexPath in
                self?.scrollToItem(at: NSIndexPath(item: indexPath.row, section: 0) as IndexPath, at: .right, animated: true)
            }
            .disposed(by: disposeBag)
    }
    
    private func attribute() {
        self.delegate = self
        self.isPagingEnabled = true
        self.backgroundColor = .yellow
        self.register(TopBarLayoutViewCell.self, forCellWithReuseIdentifier: "TopBarLayoutViewCell")
    }
    
    private func layout() {
        if let layout = self.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 0
        }
    }
}

//MARK: - TabBar: UICollectionViewDelegateFlowLayout
extension TopBarLayoutView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width , height: self.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(floor(scrollView.contentOffset.x / scrollView.frame.width))
        self.nowPage.onNext(page)
    }
}
