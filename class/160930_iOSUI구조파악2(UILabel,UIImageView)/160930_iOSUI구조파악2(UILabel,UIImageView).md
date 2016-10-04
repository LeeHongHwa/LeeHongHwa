# iOS UI 구조 파악 2(UILabel, UIImageView)

</br>
### UILabel

#### - @property(nullable, nonatomic,copy) NSString *text;
  - 텍스트 입력

#### - @property(null_resettable, nonatomic,strong) UIFont;
  - 서체, 서체사이즈는 디자이너가 준 사이즈보다 1정도 크게하면 적당하다.

#### - @property(null_resettable, nonatomic,strong) UIColor;
  - 텍스트 색상

#### - @property(nonatomic) NSTextAlignment textAlignment;
  - 텍스트 정렬

#### - @property(nonatomic) NSLineBreakMode lineBreakMode;
  - 넘치는 텍스트 처리

</br>
### UIImageView

#### - @property (nullable, nonatomic, strong) UIImage *image;
  - imageNamed
  - + (nullable UIImage *)imageWithContentsOfFile:(NSString *)path 이미지를 부를때 마다 

#### - @property(nonatomic)  UIViewContentMode contentMode;
  - UIViewContentModeScaleAspectFill: 비율을 맞춘상태에서 채움
  - UIViewContentModeScaleAspectFit: 화면에 맞는 비율 이미지라서 여백이 생길수도 있다.
  - UIViewContentModeScaleToFill: 뷰에맞게 이미지를 그냥 늘림