# Thread, iOS MultiThread(NSThread, GCD)

</br>

### Thread

  - 스레드(thread)는 어떠한 프로그램 내에서, 특히 프로세스 내에서 실행되는 흐름의 단위를 말한다. 일반적으로 한 프로그램은 하나의 스레드를 가지고 있지만, 프로그램 환경에 따라 둘 이상의 스레드를 동시에 실행할 수 있다. 이러한 실행 방식을 멀티스레드(multithread)라고 한다.

#### iOS Thread
  - 모든 app은 기본적으로 main thread를 가지고 있다.
  - UIKit 클래스는 main thread에서만 사용된다
  - 기본적인 UI 및 모든 행동은 main thread에서 실행된다.

#### Single Thread
  - 하나의 스레드를 가지며 순차적으로 실행한다.

#### Multi Thread
  - 다중 스레드를 가지며 병렬적으로 실행한다.

#### 동기 방식, 비동기 방식
  - 비동기(Asynchronous): 요청과 그 결과가 동시에 일어나지 않을 거라는 약속, 순차적으로 처리 (x)
  - 동기(Synchronous): 요청과 그 결과가 동시에 일어난다는 약속, 순차적으로 처리 (o)

#### 교착상태(deadlock)
  - 두 개 이상의 작업이 서로 상대방의 작업이 끝나기 만을 기다리고 있기 떄문에 결과적으로 아무것도 완료되지 못하는 상태를 가리킨다.

</br>

### MultiThread

#### iOS MultiThread 방법
  - NSThread: 직접 thread를 만들어서 제어 하는 방식
  - GCD: Block 기반의 기법으로 코드 가독성이 좋고 간편하다.
  - NSOperation: GCD기반의 rapper Class, 간단하게 사용가능하고 고수준 API를 제공한다. 그렇지만 성능이 느리다.
  - performSelector: Selector를 이용한 방식, ARC이전에 주로 사용한 방식이었으나 GCD이후엔 많이 사용되지 않는다.
  같은 클래스 안에서 사용되는 이유는 ARC를 신경 쓰지않아도 되기때문이다.
  - NSTimer: 간단한 interval Notification을 제공해 주는 Class, 특이하게도 NSTimer는 mainLoop(thread)에서 실행된다.

</br>

### NSThread
  - main thread 외 다른 thread를 만드는 클래스
  - UI는 절대 추가 thread애서 실행시키면 안된다.
  - Selector로 실행된 method가 종료후 자연스럽게 thread도 종료되어 사라진다.
  - cancel 명령으로 강제 종료가 되지 않는다.

</br>

### GCD(Grand Central Dispatch)
  - 비동기로 여러작업을 수행시키는 강력하고 쉬운 방법이다.
  - dispatch queue를 이용해 작업들을 컨트롤 한다.
  - Block을 활용해서 구현한다.

#### dispatch queue
  - thread라고 생각하면 된다.
  - dispatch queue는 GCD의 핵심으로 GCD로 실행한 작업들을 관리하는 queue이다.
  - 모든 dispatch queue는 FIFO(First In, First Out) 데이터 구조이다.
  - dispatch queue는 크게 Serial dispatch queue와 Concurrent dispatch queue 2종류로 나눌수 있다.

</br>

### GCD(Grand Central Dispatch)
  - 비동기로 여러작업을 수행시키는 강력하고 쉬운 방법이다.
  - dispatch queue를 이용해 작업들을 컨트롤 한다.
  - Block을 활용해서 구현한다.

#### dispatch queue
  - thread라고 생각하면 된다.
  - dispatch queue는 GCD의 핵심으로 GCD로 실행한 작업들을 관리하는 queue이다.
  - 모든 dispatch queue는 FIFO(First In, First Out) 데이터 구조이다.
  - dispatch queue는 크게 Serial dispatch queue와 Concurrent dispatch queue 2종류로 나눌수 있다.
  - Serial dispatch queue는 순차적으로 작없을 처리한다.
  - Concurrent dispatch queue는 병렬적으로 작업을 처리한다.

#### 구조적 분류
  - Main dispatch queue(Main Thread)
  - Global dispatch queue(System base queue)
  - Private dispatch queue(Custom queue)

#### Main dispatch queue
  - Main Thread를 가르키며 기본 UI를 제어하는 queue이다.
  - serial 방식으로 들어온 순서대로 진행되며 앞에 작업이 종료될 때까지 뒤의 작업들은 대기 한다.

#### Global dispatch queue
  - app 전역에 사용되는 queue로서 concurrent 방식의 queue이다.
  - 총 4개의 queue로 이뤄져 있으며 중요도에 따라 High, Default, Low, Background queue중 선택되어 실행된다.

#### Private dispatch queue
  - 사용자 정의 queue이며 serial or concurrent 방식으로 queue를 만들수 있다.