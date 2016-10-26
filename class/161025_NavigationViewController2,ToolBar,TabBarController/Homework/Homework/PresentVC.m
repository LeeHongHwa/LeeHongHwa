//
//  PresentVC.m
//  Homework
//
//  Created by david on 2016. 10. 26..
//  Copyright © 2016년 david. All rights reserved.
//

#import "PresentVC.h"

@interface PresentVC ()


@end

@implementation PresentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}
//-(void)encodeRestorableStateWithCoder:(NSCoder *)coder
//{
//    
//    NSData *imageData=UIImagePNGRepresentation(self.imgViewProfilePicture.image);
//    [coder encodeObject:imageData forKey:@"PROFILE_PICTURE"];
//    [super encodeRestorableStateWithCoder:coder];
//}
//
//-(void)decodeRestorableStateWithCoder:(NSCoder *)coder
//{
//    
//    self.imgViewProfilePicture.image=[UIImage imageWithData:[coder decodeObjectForKey:@"PROFILE_PICTURE"]];
//    [super decodeRestorableStateWithCoder:coder];
//    
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
