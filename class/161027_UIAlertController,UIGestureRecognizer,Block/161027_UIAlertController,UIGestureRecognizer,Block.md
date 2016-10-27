# UIAlertController, UIGestureRecognizer, Block

</br>

### UIAlertController
  - 사용자에게 선택지를 주기위해서 사용한다.
  - iOS8이전에는 UIAlertController가 없고 UIAlertView, UIActionSheet가 있다.

#### UIAlertControllerStyle

  - Alert: 가운데서 나온다
  - ActionSheet : 밑에서 나온다

#### UIAlertActionStyle

  - Default: 기본값
  - Destructive : 강조하는 액션 (삭제 등등)
  - Cancel: 취소 1개만 addAction가능하다.

</br>

### UIGestureRecognizer

  - 사용자의 입력을 전달받을 수 있는 방법을 제공
  - Tab, Pinch, Rotation, Swipe, Pan(drag), Edge Pan, Long Press가 있다.
  - View 위에 얹어 액션을 핸들링(@selector, delegate)

#### ResponderChain

  - 사용자의 interaction이 모든 view에게 연결되어 있다.
  - hierarchy상 가장 위에 있는 뷰(subView)가 interaction을 받으면 ViewController에게 보내고 받지않는다면 바로 밑에 뷰(superView)에게 interation을 전달한다.

</br>

### Block

  - 사용자가 액션을 선택 했을때 실행되는 코드의 묶음
  - 함수인데 객체이다
  - 블럭 내부에서는 블럭 외부의 변수를 읽기 전용(read only)으로만 참조 할 수 있다. 외부 변수를 사용하기 위해서 __block이라고 선언 한다.
