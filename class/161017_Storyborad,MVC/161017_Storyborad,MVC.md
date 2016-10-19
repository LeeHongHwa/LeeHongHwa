# Storyboard, MVC Design Pattern

</br>

### Storyboard
  - UI와 UX를 손쉽게 구성 할 수 있도록 마련한 도구
  - 화면의 구성과 흐름을 파악할 수 있다.
  - 코드와 연결 할 수 있다.

#### IBOutlet
  - 스토리보드에 있는 객체를 코드(ViewController)의 프로퍼티와의 연결을 도와준다.
  - 1:1 연결

#### IBAction
  - 스토리보드에 있는 객체를 코드(ViewController)의 메서드와 연결을 도와준다.
  - N:N 연결

</br>

### MVC(Model-View-Controller)
  - 프로그래밍 디자인 패턴중에 하나. 디자인 패턴이란 선배 개발자들이 이렇게 클래스를 나누니 문제해결과 재사용등 좋은 점이 있더라 하는 구조
  - Model : 자료 저장소
  - View : 화면
  - Controller : Model 과 View의 연결, 중재자 역할, 컨트롤러 자체는 View를 보여줄 수가 없어서 self.view를 했던 것이다. 하나의 Controller에는 항상 하나의 View가 있다. 

</br>

### Etc
  - ViewController는 UIViewController를 상속 받는다. 왜냐하면 기존 framework를 직접 수정 할 수가 없다
  - nib이란 XIB와 IB를 통틀어 지칭 하는 말이다. 