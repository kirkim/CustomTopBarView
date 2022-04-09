# TopBarView

## Last updated on 2022.04.09

<img src="https://kirkim.github.io/assets/storage/customTopBar/customTopBarGif2.gif" width="30%" style="max-width:200px" alt="early version">

---

## How to use

you just make `TopBarMainViewModel` & `TopBarMainViewController`.

### &lt; Sample use &gt;

make `TopBarMainViewModel` a storage variable.

```swift
private let viewModel = TopBarMainViewModel(
    topBarItems: [
      TopBarItem(viewController: Test1(), itemTitle: "배민1"),
      TopBarItem(viewController: Test2(), itemTitle: "배달"),
      TopBarItem(viewController: Test3(), itemTitle: "포장"),
      TopBarItem(viewController: Test1(), itemTitle: "B마트"),
      TopBarItem(viewController: Test2(), itemTitle: "배민스토어"),
      TopBarItem(viewController: Test3(), itemTitle: "쇼핑라이브"),
      TopBarItem(viewController: Test1(), itemTitle: "선물하기"),
      TopBarItem(viewController: Test2(), itemTitle: "전국별미"),
    ], bottomBarItem: BottomBarItem(
      presentVC1: ButtonVC1(),
      presentVC2: ButtonVC2(),
      presentVC3: ButtonVC3(),
      presentVC4: ButtonVC4()
    )
  )
```

then, You just have to make `TopBarMainViewController` where you want. and bind `TopBarMainViewModel` in the storage.
startPage index starts at 0.

```swift
let vc = TopBarMainViewController(startPage: 3)
vc.bind(self.viewModel)
```
