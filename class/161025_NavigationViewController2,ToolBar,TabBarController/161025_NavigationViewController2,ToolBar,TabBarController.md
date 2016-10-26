# Navigation View Controller 2, ToolBar, Tab Bar Controller

</br>

### Navigation View Controller 2, ToolBar, Tab Bar Controller

#### Navigation Bar

  - Left : leftBarButtonItem(버튼)
  - Center : titleView(뷰)
  - Right : rightBarButtonItem(버튼)

</br>

### Tool Bar
  - ViewController의 부가적 기능을 위해 ToolBar를 사용
  - 기본옵션은 hidden
  - toolBarItems(toolBarItem의 NSArray)
  - 잘쓰이지 않는다.

</br>

### Tab Bar Controller
  - 다양한 별개의 인터페이스를 관리한다 ex)시계,알람,스톱워치,타이머를 시간으로 묶는 느낌

#### Tab Bar Item
  - 각각의 ViewController를 각 tabBarItem에 매칭 되어 있다.
  - image, text를 넣을수 있다.
  - 각 tabBarItem은 해당 ViewController의 tabBarItem property로 접근 가능하다.