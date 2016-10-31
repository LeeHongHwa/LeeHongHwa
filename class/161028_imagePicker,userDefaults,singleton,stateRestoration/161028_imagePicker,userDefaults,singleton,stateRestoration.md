# imagePicker, userDefaults, singleton, stateRestoration

</br>

### imagePicker

#### UIImagePickerController

  - 다양한 소스로부터 사진을 가져오는 기능이 구현되어있는 클래스
  - UIImagePickerControllerSourceType : 라이브러리, 사진 앨범, 카메라가 있다.
  - @property(nonatomic) BOOL allowsEditing 을 통해 사진을 편집할 수 있다.

</br>

### NSUserDefaults

  - 사용자의 환경설정 내용을 반영구적으로 저장하기위해 사용
  - 주로 standardUserDefaults 라는 프로퍼티를 사용하여 싱글턴 객체로 사용
  - suiteName을 통한 생성자 method를 통해 별도의 분리된 NSUserDefaults 생성 가능
  - synchronize를 메서드를 통해 기존의 데이터와 병합

#### 관리할 수 있는 데이터의 종류

  - float, double, NSInteger, BOOL
  - NSURL, NSData(이진데이터로 변환해서 저장), NSNumber, NSDate
  - NSStirng, NSArray, NSDictionary

#### 주요 항목

  - standardUserDefaults : 싱글턴 객체 사용(프로그램에서 하나)
  - - (void)setObject:(nullable id)value forKey:(NSString *)defaultName; : 데이터 저장
  - - (nullable id)objectForKey:(NSString *)defaultName; : 데이터 불러오기
  - - (void)removeObjectForKey:(NSString *)defaultName; : 데이터 삭제
  - synchronize : 데이터를 저장한 것을 파일시스템에 동기화

</br>

### singleton

  - 어플리케이션 전 영역의 걸쳐 하나의 클래스가 단 하나의 인스턴스를 생성하는 디자인 패턴
  - 어플리케이션 내부에서 유일하게 하나만 필요한 객체에서 사용(셋팅, 데이터)
  - 클래스 method로 객체를 만들며 static을 이용하여 단 1개의 인스턴스만 생성
  - 애플리케이션 전역에서 공유하는 객체 생성

</br>

### stateRestoration

  - applicationDidEnterBackground 상태로 넘어갔을때 현상태를 저장하여 애플리케이션이 다시 시작될때 현상태를 유지하여 보여준다. 사용자에게 기분좋은 경험을 제공해준다.

#### 주요 항목
  - AppDelegate
  - - (BOOL)application:(UIApplication *)application shouldSaveApplicationState:(NSCoder *)coder : viewController 위치 저장
  - - (BOOL)application:(UIApplication *)application shouldRestoreApplicationState:(NSCoder *)coder : : viewController 위치 불러오기

  - viewController
  - - (void)encodeRestorableStateWithCoder:(NSCoder *)coder : viewController안에 있는 view들을 저장
  - - (void)decodeRestorableStateWithCoder:(NSCoder *)coder : viewController안에 있는 view들을 불러오기
