# TopBarView

## Last updated on 2022.04.09

<img src="https://kirkim.github.io/assets/storage/customTopBar/customTopBarGif2.gif" style="max-width:200px" alt="early version">

---

## Packages used

- <a href="https://github.com/ReactiveX/RxSwift" target="_blank">RxSwift</a>
- <a href="https://github.com/RxSwiftCommunity/RxGesture" target="_blank">RxGesture</a>
- <a href="https://github.com/RxSwiftCommunity/RxDataSources" target="_blank">RxDataSources</a>
- <a href="https://github.com/SnapKit/SnapKit" target="_blank">SnapKit</a>

<br><br>

## How to use

you just make `TopBarMainViewModel` & `TopBarMainViewController`.

<br><br>

### &lt; Sample use &gt;

make `TopBarMainViewModel` a storage variable.

```swift
private let viewModel = TopBarMainViewModel(
            topBarItems: [
                TopBarItem(viewController: Test1(), itemTitle: "배민1"),
                TopBarItem(viewController: Test2(), itemTitle: "배달"),
                TopBarItem(viewController: Test3(), itemTitle: "포장"),
                TopBarItem(viewController: Test1(), itemTitle: "B마트"),
                TopBarItem(viewController: Test3(), itemTitle: "간편식/밀키트"),
                TopBarItem(viewController: Test2(), itemTitle: "배민스토어"),
                TopBarItem(viewController: Test3(), itemTitle: "쇼핑라이브"),
                TopBarItem(viewController: Test1(), itemTitle: "선물하기"),
                TopBarItem(viewController: Test2(), itemTitle: "전국별미"),
            ],
            bottomBarItem: BottomBarItems(
                presentVC: BottomBarPresentVC(
                    button1: ButtonVC1(),
                    button2: ButtonVC2(),
                    button3: ButtonVC3(),
                    button4: ButtonVC4()),
                datas: BottomBarDatas(
                    button1: BottomButtonData(image: UIImage(systemName: "person.circle")!, title: "내 정보", tintColor: .white, backgroundColor: .blue),
                    button2: BottomButtonData(image: UIImage(systemName: "heart")!, title: "찜"),
                    button3: BottomButtonData(title: ""),
                    button4: BottomButtonData(title: "")))
        )
```

then, You just have to make `TopBarMainViewController` where you want. and bind `TopBarMainViewModel` in the storage.
startPage index starts at 0.

```swift
let vc = TopBarMainViewController(startPage: 3)
vc.bind(self.viewModel)
```
