# 타입 별칭, 상수, 열거형, 옵션, 매크로, 정적 변수

</br>

### 타입 별칭(typedef)

  - 자료형의 별칭을 지정한다.
  - 명확하게 의미를 전달하기 위해서 사용한다.
  - 구조체 같은 번거로운 문법을 간소화 하기 위해서 사용한다.

```sh
    typedef dataType name
```

</br>

### 상수(constant)

  - 변하지 않는 값을 생성하고자 할 때 사용
  - const 키워드 사용
  - 코딩할 때 바꾸지 말아야할 부분을 바꿀수도 있어서 그러한 실수를 방지하기 위해 사용한다.

```sh
    //* const
    NSString *const constStr1 = @"* const";
    //const *
    const NSString *constStr2 = @"const *";
    
    //value 변경 (O) pointer 변경 (X)
    constStr1 = @"변경";
    //value 변경 (X) pointer 변경 (O)
    constStr2 = @"변경";
    
    NSLog(@"1:%@, 2:%@",constStr1,constStr2);
    
    //결과: 1:* const, 2:변경
    //이유: pointer const(reference type) or value const(value type) 차이
```

</br>

### 열거형(enumeration)

  - 유사한 종류의 여러 값을 유의미한 이름으로 한 곳에 모아 정의(그룹)
  - 열거형의 각 요소는 주로 정수형(NSInteger)상수 값
  - 한가지의 특성을 결정할때 사용

```sh
    typedef NS_ENUM(dataType, name)
    {
        상수 = NSInteger,
        상수 = NSInteger...
    }
```

</br>

### 옵션(option)

  - 열거형과 유사한 모습으로 옵샨값을 정의
  - 주로 비트플래그를 사용하여 정의
  - 여러가지의 상태를 설정할때 비트논리 연산(or)를 통해 전달, 비트논리 연산(and)를 통해 해석
  - 1 << 0 0001을 0번 움직여라

```sh
    typedef NS_OPTIONS(dataType, name)
    {
        상수 = 0,
        상수 = 1 << 0,
        상수 = 1 << 1
    }
```

</br>

### 매크로(macro)

  - 전처리자(Preprocessor)의 일종인 #define을 사용하여 정의
  - 단순한 수식 또는 변치않을 값을 정의하는데 주로 이용
  - objective-c 에서는 사용을 자제한다. 상수/열거형/함수등으로 대체 가능
  - dataType이 정해져 있지않아 오류를 범할수 있고 값이 변경되어 예상치 못한 결과를 가져올 수 있다.

```sh
    #define name value
```

</br>

### 정적 변수(static)

  - 한 번 생성하면 다시 생성되지 않는 변수
  - 프로그램이 시작된 후 처음 생성되면 그 이후에 다시 생성되지 않는다.
  - objective-c 에서는 default값으로 auto(메서드가 끝나면 사라진다)이다.
  - 메모리의 DATA(전역변수, 정적변수) 영역에 생성된다.
  - singleton을 만들때 사용된다.

```sh
    static datayType name = value;
```
