# Network Basic

</br>

### Network

  - 어떤 연결을 통해 컴퓨터의 자원을 공유하는 것

</br>

### Client Server Model
  - Network architecture 중 하나
  - Server: Client의 요청에 따라서 데이터를 제공해 주는 컴퓨터
  - Client: Server로 부터 요청한 데이터를 받는 컴퓨터
  - 각각의 컴퓨터가 Client, Server의 역할에 맞게 구성되어 Network통신이 이뤄진다면 Client Server Model이라고 부를 수 있다.

</br>

### Protocol
  - 프로토콜은 컴퓨터끼리 또는 컴퓨터와 단말기 사이에 상호통신 할때 데이터를 에러없이 원할하고 신뢰성있게 주고받기 위해 필요한 약속을 규정하는 것으로서 통신규약이라고 한다.
  - Transport Layer(Protocol)의 종류: TCP, UDP
  - Application Layer(Protocol)의 종류: FTP, HTTP, HTTPS, SSH, SMTP 등등

</br>

###  URI, URL

#### URI
  - 통합 자원 식별자(Uniform Resource Identifier)는 인터넷에 있는 자원을 나타내는 유일한 주소이다. URI의 존재는 인터넷에서 요구되는 기본적으로서 인터넷 프로토콜에 항상 붙어 다닌다.
  - URL은 URI에 포함이된다.
  - URI는 요구사항은 같지만 원하는것이 다를경우 파일관리자를 통하여 데이터를 제공해준다.

#### URL
  - 통합 자원 식별자(Uniform Resource Locator)는 네트워크 상에서 자원이 어디 있는지를 알려주기 위한 규약이다.
  - protocol://host:port:port/path(실제 위치) ,여기까지가 URL

</br>

### Restful

#### iOS MultiThread 방법
  - REST(Representational State Transfer)는 WWW와 같은 분산 하이퍼미디어 시스템을 위한 소프트웨어 아키텍쳐의 한 형식이다.
  - 엄격한 의미로 REST는 네트워크 아키텍쳐 원리의 모음이다. 여기서 '네트워크 아키텍쳐 원리' 란 자원을 정의하고 자원에 대한 주소를 지정하는 방법 전반을 일컫는다.

#### Restful 사용 원칙
  - Resource: URI들을 쉽게 자원의 내용을 이해할수 있게 만들어야 한다.
  - Representations: 객체와 속성을 나타내는 데이터를 JSON이나 XML구조로 전환해서 표현한다.
  - Messages: HTTP Methods(PUSH, GET, PUT, PATCH, DELETE)를 사용한다.
  - Stateless: Server와 Client의 요청사항은 저장하지 않는다. Client는 Session 상태를 유지한다.