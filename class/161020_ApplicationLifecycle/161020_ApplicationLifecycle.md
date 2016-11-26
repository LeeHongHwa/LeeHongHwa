# Application Lifecycle
</br>

### NSObject Lifecycle

```sh
	/*
	 alloc을 통해 객체를 메모리에서 생성.
	 */
	+ (instancetype)alloc
	{   NSLog(@"My Class instance alloc");
	    return [super alloc];
	}

	/*
	 dealloc을 통해 객체를 메모리에서 해제
	 ARC(Automatic Reference Counting)때문에 dealloc 메서드를 호출 안하고 nil값을 주면 자동으로 객체가 메모리에서 해제된다.
	 */
	- (void)dealloc
	{
	    NSLog(@"My Class instance dealloc");
	}

	/*
	 init을 통해 객체 초기화
	 new를 사용하는경우 alloc과 init을 한꺼번에 처리해서 init을 override를 고려한다면 alloc과 init을 따로 해주어야한다.
	 */
	- (instancetype)init
	{
	    NSLog(@"My Class instance init");
	    return [super init];
	}
```
</br>

### Application Lifecycle

  - didFinishLaunchingWithOptions에서 window 객체를 만들어 주고 그위에 UIViewController와 rootView를 만들어 준다. 이 과정에서 상황에 따라 보여주고 싶은 rootView를 storyboardWithName를 통해 지정할 수 있다.

#### UIViewController Lifecycle Method

```sh
	@implementation ViewController

	//UIViewController의 view가 생성될 때 호출, 아직 UIViewController가 초기화 되지 않은 상태
	- (void)loadView
	{
	    [super loadView];
	}

	//UIViewController가 인스턴스화 된 직후 호출한 것으로 처음 한 번 세팅해 주어야 하는 값들을 넣기에 적절
	//화면 전환시 WillApper와 DisApper가 계속 호출되므로 viewDidLoad에 초기값을 세팅해 주는것이 좋다
	- (void)viewDidLoad
	{
	    [super viewDidLoad];
	}

	//view가 화면에 보여지기 직전에 호출, 화면이 보여지기 전에 준비할 때 사용
	//animated는 view가 애니메이션을 동반하여 보여지게 되는지 시스템에서 전달해주는 불리언 값
	//보통 애니메이션으로 변경된값을 다시 기본값으로 세팅해줄 때 사용
	- (void)viewWillAppear:(BOOL)animated
	{
	    [super viewWillAppear:YES];
	}

	//view의 하위뷰들의 레이아웃이 결정되기 직전 호출 (autoLayout 설정 준비)
	- (void)viewWillLayoutSubviews
	{
	    [super viewWillLayoutSubviews];
	}

	//view의 하위뷰들의 레이아웃이 결정된 후 호출, 주로 view의 하위뷰들이 사이즈 조정이 필요할 때 호출 (autoLayout 설정 완료)
	- (void)viewDidLayoutSubviews
	{
	    [super viewDidLayoutSubviews];
	}

	//view가 화면에 보여진 직후에 호출, 화면이 표시된 이후 애니메이션 등(소리나 영상)을 보여주고 싶을 떄 유용
	- (void)viewDidAppear:(BOOL)animated
	{
	    [super viewDidAppear:YES];
	}

	//view가 화면에서 사라지기 직전에 호출
	- (void)viewWillDisappear:(BOOL)animated
	{
	    [super viewWillDisappear:YES];
	}

	//view가 화면에서 사라진 직후에 호출
	- (void)viewDidDisappear:(BOOL)animated
	{
	    [super viewDidDisappear:YES];
	}

	//메모리 관리 차원 메서드: 다시 생성될 수 있는 자원은 지금 당장 없애라
	- (void)didReceiveMemoryWarning {
	    [super didReceiveMemoryWarning];
	}

	@end
```