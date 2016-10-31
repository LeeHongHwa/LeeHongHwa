# Precompiled Header, NSNotificationCenter, NSNotification

</br>

### Precompiled Header(PCH file)
  - 미리 컴파일된 헤더
  - 컴파일 시간 단축
  - 프로젝트 전역에서 공통적으로 사용될 내용을 미리 컴파일 해 둘 수 있는 헤더파일(버전체크 등)
  - 프로젝트 빌드할 때 미리 컴파일 해 둔 후 캐시
  - 모든 소스코드에서 자동으로 import

#### 사용방법

  - PCH file 생성
  - target check
  - build setting -> prefix header 검색 -> Precompile Prefix Header: YES -> Prifix Header 상대경로 지정 &(SRCROOT/$(PRODUCT_NAME)/PrefixHeader.pch

</br>

### NSNotificationCenter

  - 특정 이벤트가 발생하였음을 알리기 위해 불특정 다수의 객체에게 알리기 위해 사용하는 클래스
  - 어떤 객체라도 특정 이벤트가 발생했다는 알림을 받을 것이라고 관찰자(Observer)로 등록을 해두면 노티피케이션 센터가 모든 관찰자 객체에게 알림을 준다.
  - 페이스북에서 친구를 등록해두면 친구의 이벤트가 내 뉴스피드나 알림으로 오는것과 같은 이치
  - 보통 방송국(broadcast)에 비유를 하는데 시청자(addObserver) 방송하는사람(postNotification)이라고 비유할 수 있다.
  - 데이터를 공유 하고 있을때 데이터가 변경됨에 따라 데이터를 공유하는 객체들이 알림을 받을때 사용 할수도 있고 배터리 부족에 따른 처리를 해줄 수도 있다.

#### NSNotification

  - 수신

```sh
    [[NSNotificationCenter defaultCenter] addObserver:수신자
                                             selector:수신 받을 때 실행될 것
                                                 name:통신이름
                                               object:발신인];
```
  - 발신

```sh
    [[NSNotificationCenter defaultCenter] postNotificationName:통신이름
                                                        object:발신자
                                                      userInfo:발신정보];
```
