# Block, Animation

</br>

### Block

  - Block은 Objective-c의 객체이다.
  - C, C++, Objective-C에 추가된 확장 문법이다.
  - ^을 literal문법으로 첫 시작시 사용한다.
  - 외부 값을 capture해서 사용한다.
  - 블럭 내부에서는 블럭 외부의 변수를 읽기 전용(read only)으로만 참조 할 수 있다. 외부 변수를 사용하기 위해서 __block이라고 선언 한다.

```sh
	//선언
	returnType(^blockName)(parameterType)

	//정의
	^(parameterType parameterName){...};

	//편의성을 위한 typedef
	typedef returnType(^blockName)(parameterType);

```