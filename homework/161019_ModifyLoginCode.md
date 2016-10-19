# 161019 Modify Login Code

</br>

```sh
	
	//명확성
	@property (weak, nonatomic) IBOutlet UILabel *loginTitle;		(x)
	@property (weak, nonatomic) IBOutlet UILabel *loginTitleLabel;	(o)

	//명확성
	@property (weak, nonatomic) IBOutlet UIButton *autoLogin;		(x)
	@property (weak, nonatomic) IBOutlet UIButton *autoLoginButton;	(o)

	//축약어 사용 금지 (예외 있음)
	@property (weak, nonatomic) IBOutlet UITextField *idTF;						(x)
	@property (weak, nonatomic) IBOutlet UITextField *identificationTextField;	(o)

	//축약어 사용 금지 (예외 있음)
	@property (weak, nonatomic) IBOutlet UITextField *pwTF;					(x)
	@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;	(o)

	//축약어 사용 금지 (예외 있음)
	@property (weak, nonatomic) IBOutlet UIButton *loginBtn;	(x)
	@property (weak, nonatomic) IBOutlet UIButton *loginButton;	(o)

	//명확성
	- (IBAction)loginAlert:(id)sender					(x)
	- (IBAction)alertIdentificationDidLogin:(id)sender	(o)
	{

		//명확성
	    UIAlertController *loginAlert			(x)
	    UIAlertController *IdentificationAlert	(o)

	    = [UIAlertController alertControllerWithTitle:@"로그인" message:[NSString stringWithFormat:@"%@로 로그인이 완료되었습니다.",self.identificationTextField.text] preferredStyle:UIAlertControllerStyleAlert];
	    
	    //축약어 사용 금지 (예외 있음)
	    UIAlertAction *okBtn			(x)
	    UIAlertAction *confirmAction	(o)

	     = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleCancel handler:nil];
	    [IdentificationAlert addAction:confirmAction];
	    [self presentViewController:IdentificationAlert animated:YES completion:Nil];
	}

	//축약어 사용 금지 (예외 있음)
	- (IBAction)checkBtn:(id)sender 	(x)
	- (IBAction)checkButton:(id)sender 	(o)

	{
	    if ([sender isKindOfClass:[UIButton class]]) 
	    {
	        UIButton *checkButton = (UIButton *)sender;
	        checkButton.selected = !checkButton.selected;
	    }
	}

```