# UIControl, UIButton

</br>
### UIControl

#### enabled
  - 터치 이벤트를 사용할지 말지 결정하는 속성
  - 기본값: YES
  - 만약 NO라면 터치 이벤트를 무시

#### selected
  - 누르고 있을때가 아니라 눌렀다 뗐을때 즉 선택 했을때를 결정하는 속성
  - 기본값: NO

#### highlighted
  - 터치를 눌렀다 뗐을때 자동적으로 해지가 된다 nomal상태에서 적용
  - 기본값: NO
  - 최선:O(n2)   평균:O(n2)   최악:O(n2)

</br>
### UIButton

#### 버튼구조
  - BackgroundImage
  - Image
  - Title  