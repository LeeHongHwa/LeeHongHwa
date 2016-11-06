# 데이터 저장 방법(Property list)

</br>

###  데이터 저장 방법

  - 파일 저장 (Poperty List, SQLite, 아카이빙)
  - iOS DataBase 이용 - Core Data
  - Network - Server DB 이용

</br>

### Property List - plist

  - 심플한 "파일" 저장 방법 중 하나
  - Key, Value 구조로 데이터 저장
  - File 형태로 저장되다 보니 외부에서 Access 가능 (보안 취약)

#### 파일 위치

  - 파일이 저장되는 곳 Bundle & Documents 폴더
  - Bundel은 프로젝트에 추가된 Resorce가 모인 곳
  - 프로그램이 실행되며 저장하는 파일은 Documents 폴더에 저장
  - plist파일은 데이터만 불러오는 역할은 Bundle을 통해서, plist파일에 데이터를 쓰고 불러오는 역할은 Documents폴더에 저장된 파일로 사용

#### 사용

```sh
    //파일 불러오기
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = [paths objectAtIndex:0];
    NSString *docuPath = [basePath stringByAppendingString:@"UserData.plist"];
    
    //Document folder에 파일 있는지 확인
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:docuPath])
    {
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"UserData"
                                                               ofType:@"plist"];
        [fileManager copyItemAtPath:bundlePath
                             toPath:docuPath
                              error:nil];
    }
    //데이터 변경
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithContentsOfFile:docuPath];
    [dic setObject:추가 데이터
            forKey:키값];
    //저장
    [dic writeToFile:docuPath atomically:NO];
```