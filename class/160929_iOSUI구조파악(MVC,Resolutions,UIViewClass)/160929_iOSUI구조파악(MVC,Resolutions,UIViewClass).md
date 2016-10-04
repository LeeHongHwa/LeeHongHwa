# iOS UI 구조 파악(MVC, Resolutions, UIView Class)

</br>
### App 구조 - MVC 디자인 패턴
  - 디자인 패턴은 건축의 공법에서 유래했다. 소수의 뛰어난 엔지니어가 다수의 엔지니어들이 수월하게 일을 처리할 수 있도록 한 규칙이다.
  - Model View Controller의 약자로 에플리케이션을 세가지의 역할로 구분한 개발 방법론이다.

#### - Model
  - 데이터를 담당하는 역할

#### - Visual
  - 화면상에 출력되는 내용을 담당하는 역할

#### - Controller
  - 사용자의 요구사항에 의해서 Model과 Visual을 통제하는 역할

</br>
### Resolutions

#### - Pixel
  - 실제 이미지 사이즈

#### - Point
  - 화면에 표시되는 이미지 사이즈
  - iPhone5: pixel / 2
  - iPhone6: pixel / 2
  - iPhone6S: pixel / 3

#### - 좌표
  - View 기준 좌측 상단 0,0
  - View의 위치는 상위뷰를 기준으로 위치

### View

#### - UIView Class
  - @property(nonatomic) CGRect frame; //상대적 X,Y좌표와 가로,세로
  - @property(nonatomic) CGRect bounds; //X,Y좌표(0,0)와 가로,세로
  - @property(nonatomic,copy) UIColor //색상에 관한것 0 ~ 1이라 RGB의 색상을 255로 하고 싶다면 2/255 이런식으로 사용,여기에서 사용하는 alpha는 자신만 적용
  - @property(nonatomic) CGFloat alpha //하위 View를 포함한 투명도 0 ~ 1 - @property(nonatomic) CGFloat alpha //하위 View를 포함한 투명도 0 ~ 1
  - @property(nonatomic,getter=isHidden) BOOL hidden; //하위View를 포함해서 숨기고 보여지고
  - - (void)removeFromSuperview; //하위View의 가출 스스로 해제
  - - (void)addSubview:(UIView *)view; //superView가 하위 view를 입양함