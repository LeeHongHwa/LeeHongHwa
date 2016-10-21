# Application Life Cycle 2

</br>

### Application Life Cycle 2
#### iOS 어플리케이션의 상태변화 모식도

  - Not Running: 실행되지 않았거나, 시스템에 의해 종료된 상태
  - Inactive: 실행 중이지만 이벤트를 받고 있지 않은 상태(alert 혹은 home button 을 double tap 할 경우)
  - Active: 어플리케이션이 실질적으로 활동하고 있는 상태(user interaction이 일어날 수 있는 상태)
  - Background: 백그라운드 상태에서 실질적인 동작을 하고 있는 상태, 백그라운드 상태유지를 설정 하지 않았다면 언제 Suspended상태로 될지 모른다.
  - Suspended: 백그라운드 상태에서 활동을 멈춘 상태. 빠른 재실행을 위하여 메모리에 적재된 상태이지만 실질적으로는 동작하고 있지는 않다. 메모리가 부족하게되면 언제든지 강제종료한다.

</br>

#### iOS 어플리케이션의 상태변화에 따른 다른 시스템의 App Delegate 객체 메소드 호출

  - willFinishLaunchingWithOptions: 어플리케이션이 최초 실행될 때 호출되는 메서드
  - didFinishLaunchingWithOptions: 어플리케이션이 실행된 직후 사용자의 화면에 보여지기 직전에 호출, 초기값을 지정해 준다(appearance메서드를 통해  Key Color, Font 등등)
  - applicationDidBecomeActive: 어플리케이션이 Active 상태로 전환된 직후 호출
  - applicationWillResignActive: 어플리케이션이 Inactive 상태로 전환되기 직전에 호출되고 실질적으로 화면에서 사라지는 시점인 경우가 많기 때문에 현재의 어플리케이션 상황 등을 저장할 때 주로 사용된다.
  - applicationDidEnterBackground: 어플리케이션이 백그라운드 상태로 전환된 직후 호출됩니다. 언제 강제종료가 될지모르니 이전 상태인 ResignActive에서 현재 상황을 저장 하는것 이다.
  - applicationWillEnterForeground: 어플리케이션이 Active 상태가 되기 직전에, 화면에 보여지기 직전의 시점에 호출이 됩니다.
  - applicationWillTerminate: 어플리케이션이 종료되기 직전에 호출되는 메서드이나 호출이 안될때도 있습니다.