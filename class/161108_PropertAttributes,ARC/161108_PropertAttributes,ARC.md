# Propert Attributes, ARC(Automatic Reference Counting)

</br>

### Propert Attributes

#### nullable, nonnull, null_unspecified, null_resettable
 
  - property가 nil이 할당될 수 있는지에 대한 여부 이 중에 하나만 사용 가능
  - 객체 타입에만 사용
  - nullable: property가 null일 수 있다.
  - nonnull: property가 null일 수 없다.
  - null_unspecified: 프로퍼티의 null 여부가 지정되어 있지 않다.(default)
  - null_resettable: 객체가 init 되면서 해당 프로퍼티에 기본값을 할당하므로 nil일 수 없지만 추후에 값을 nil로 변경 가능하다.

#### readwrite, readonly

  - readwrite: getter, setter method를 자동 생성(default)
  - readonly: getter만 자동 생성(값을 외부에서 바꿀수 없게 한다.)

#### getter, setter

  - getter: getter method의 이름을 수동지정(isUseAutoLogin(질문)과 같은 BOOL값을 명시하기 위해 사용한다)
  - setter: setter method의 이름을 수동지정
  - default getter: property name, setter: set + property name

</br>

### ARC(Automatic Reference Counting)
  - 반자동으로 참조 값의 메모리 관리

#### 메모리 규칙
  - alloc을 하면 retain count가 1 증가
  - retain을 호출하면 retain count가 1 증가
  - release를 호출하면 retain count가 1 감소
  - retain count가 0이 되면 객체가 메모리에서 해제된다(자동으로 dealloc method 호출)
  - dealloc을 호출하면 메모리에서 해제된다.

#### ARC 규칙
  - retain count를 임의로 조절할 수 없다.
  - retain count는 코드 블럭을 벗어나면 1 감소한다.(ex method가 실행이 다 된 후)
  - strong 참조가 해제되면 retain count가 1 감소한다.
  - dealloc을 명시적으로 호출할 수 없다.
  - Objective-c 참조형 객체에만 적용된다.
  - 주의사항: 순환참조 문제로 인해 메모리에서 해제되지 못한 좀비 객체가 많아져서 시스템과 성능에 악영향을 끼칠 수 있다.

</br>

### 메모리 관련 property attributes

#### retain, unsafe_unretained
  - property의 retain count에 관한 설정
  - retain: property에 set 할 때 retain count를 1 증가 시킴(ARC가 아닌 환경에서 default)
  - unsafe_unretained: property에 set 할 때 retain count 변경 없음, 대신 property가 참조하는 값이 메모리에서 해제될 경우 property는 기존 주소값을 계속 가지고 있어서 오류가 난다. 이로인해 nil값을 set해준다.

#### strong, weak
  - property의 retain count에 관한 설정
  - strong: property에 set할때 retain count를 1 증가 시킴 만약에 property가 메모리에서 해제된다면 참조값의 retain count를 1 감소 시킨다. (ARC default)
  - weak: property에 set할때 retain count 변경이 없다. 메모리에서 해제될경우 잘못된 주소값을 가지고 있는 unsafe_unretained와는 달리 자동으로 nil값을 set한다.

#### copy, assign
  - property에 값을 넘기는 방법에 관한 설정
  - copy: 객체 타입에서 사용. 객체를 새로 생성하여 프로퍼티에 할당.(같은 주소를 참조하는게 아니라 새로운 객체에 복사하는 것) 
  - assign: value type에서 사용(value type default)

</br>  

### 변수
  - __weak: 객체를 alloc해서 주소값을 저장할 경우 retain count 변경이 없다.
  - __strong: 객체를 alloc해서 주소값을 저장할 경우 retain count를 1 증가 시킴 (default)