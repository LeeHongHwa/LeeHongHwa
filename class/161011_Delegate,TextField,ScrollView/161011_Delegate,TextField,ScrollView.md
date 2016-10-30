# Protocol, Delegate, UITextField, UIScrollView

</br>
### Protocol, Delegate

#### Protocol
  - 클래스간의 통신 규약
  - 다른 클래스의 객체 간의 데이터 통신 규약

#### Delegate
  - 클래스간의 통신 규약 중 하나
  - Protocol의 방법 중 하나

```sh
    @protocol name;

	@interface ClassName : ClassName

	@property (nonatomic, weak) id <protocolName> delegate;

	@end

	@protocol protocolName <NSObject>

	- delegate method;

	@end
```

</br>
### UITextField
  - 사용자 텍스트 입력을 위한 UI Component
  - 다른 클래스의 객체 간의 데이터 통신 규약

#### 주요항목
  - NSString *text : 텍스트
  - UIFont *font : 폰트
  - UIColor *textColor : 텍스트 색상
  - NSTextAlignment *textAlignment : 텍스트 정렬
  - NSStirng *placeholder : 힌트글자
  - UIImage *background : 배경이미지
  - id<UITextFieldDelegate> delegate : 델리게이트  

</br>
### UIScrollView
  - UIScrollView의 size와 contentSize는 다르다. 창문이 UIScrollView의 size라면 풍경은 contentSize이다.
  - UIScrollView addSubView:contentView 이여야 한다.

#### 주요항목
  - CGPoint contentOffset : 컨텐츠 좌표
  - CGSize contentSize : 컨텐츠 사이즈
  - BOOL bounces : 끝까지 갔을때 끝을 넘어서까지 가고 다시 끝으로 돌아온다
  - BOOL pagingEnabled : UIScrollViewSize의 반이 넘어가면 다음 contentView로 넘어감
  - BOOL scrollEnabled : 힌트글자
  - CGFloat minimumZoomScale : 확대 최소치
  - CGFloat maximumZoomScale : 확대 최대치
  - (void)setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated : 컨텐츠 좌표 지정 및 애니메이션 지정
  - (void)setZoomScale:(CGFloat)scale animated:(BOOL)animated : 확대 지정 및 애니메이션 지정
  - id<UITextFieldDelegate> delegate : 델리게이트 