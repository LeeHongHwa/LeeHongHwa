# Property, Key Value Observing ,Etc

</br>

### Property

  - 객체 외부에서 접근할 수 있는 인스턴스의 속성 == 객체 외부에서 접근할 수 있는 객체 내부의 변수/값
  - 객체지향 패러다임의 캡슐화에 관련된 설계
  - instance변수 + getter method + setter method

</br>

### Key Value Observing

  - 특정 객체의 값이 변화하는 것을 감지하고자 할 때 사용
  - 미리 감지하고자 하는 Key 값을 등록해 두면 KVO method를 통해 변화되는 것을 감지
  - property의 setter,getter method를 override하지 않아도 변화를 알아차릴 수 있다.

#### 사용

```sh
    //옵저버 추가
    - (void)addObserver:(NSObject *)observer //지켜보는 객체
    forKeyPath:(NSString *)keyPath //지켜볼 객체 이름
    options:(NSKeyValueObservingOptions)options //어떠한 변화를 지켜보는지에 대한 옵션 
    context:(nullable void *)context;
    
    //옵저버 제거
    - (void)removeObserver:(NSObject *)observer //지켜보는 객체
    forKeyPath:(NSString *)keyPath; //지켜볼 객체 이름

    //변화가 일어나면 메서드 호출
    - (void)observeValueForKeyPath:(nullable NSString *)keyPath //변화가 일어난 객체 이름
    ofObject:(nullable id)object 
    change:(nullable NSDictionary<NSKeyValueChangeKey, id> *)change //옵션에 따른 값
    context:(nullable void *)context;
```

</br>

### Etc

  - Utility <UIKit/UIKit.h> : 클래스 메서드로 자주 사용하는 메서드 정의
  - Category : Framework는 수정이 불가능하니 이 기능을 사용하여 기능확장을 한다.