# ViewController, Present Modally, NavigationVC

</br>

### UIViewController 역할
  - 앱의 기초가 되는 내부 구조
  - 모든 앱은 한개 이상의 ViewController를 가지고 있다.
  - 사용자의 인터렉션과 앱의 데이터 사이에서 컨트롤의 역할을 한다.
  - View, Event, Change ViewController의 method와 property 를 가지고 있다.

#### UIViewController - Root View

  - View의 계층을 관리하는 기능
  - 모든 ViewController는 한개의 rootView를 가지고 있다.
  - 화면에 표시하기 위해서는 모든 View는 RootView의 계층 안에 있어야 한다.

#### Child UIViewController

  - ViewController는 다른 ViewController를 Child ViewController로 관리할 수 있다.
  - Child ViewController의 RootView를 최상위의 RootView에 addSubView하여 화면에 표시 가능하다.

#### UserInteraction

  - ViewController는 UIResponder를 상속받은 객체로 Event Chain으로부터 오는 Event는 효과적으로 처리한다. 즉 사용자의 모든 Event는 ViewController가 받아서 각 View에서 처리되는 Action Method와  Delegate를 처리된다.

#### Data Marshaling

  - ViewController는 자신이 관리하는 View들과 App 내부의 Data와의 중계자 역할을 한다.

#### Resource Management

  - ViewController안에 있는 모든 View나 객체는 모두  ViewController의 책임이다.
  - App 사용중 Memory가 부족할 때 didReceiveMemoryWarning method가 불리며, 오래동안 사용하지 않은 객체와 다시 쉽게 만들수 있는 객체를 제거할 수 있다.
  - 하위 View를 일단 지우고 그 후에 처리할 것이 있으면 didReceiveMemoryWarning에서 구현

</br>

### ViewController 종류

#### General View Controller

  - 일반적인 ViewController형태
  - 각 View Controller가 Root View를 가지고 있다.

#### Present Modally (화면이동)

  - ViewController간의 화면 전환
  - 연관성 없는 다른 화면간의 이동 ex)Alert
  - present,dismiss method

#### General ViewController

  - rootViewController를 가지고 있는 ViewController
  - ViewController간의 구조를 잡는 역할, 관련된 내용을 더 자세히 보고싶은 화면구성을 위해 사용한다.

</br>

### NavigationController(General ViewController)

  - Stack방식으로 다른 ViewController를 관리한다.
  - Push, Pop 메서드 사용