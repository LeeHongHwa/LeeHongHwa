//
//  ItemView.m
//  VendingMachine
//
//  Created by youngmin joo on 2016. 10. 11..
//  Copyright © 2016년 WingsCompany. All rights reserved.
//

#import "ItemView.h"

@interface ItemView()

//@{@"title:String, @"cost":String, @"imageName":String}
@property NSDictionary *data;

@end

@implementation ItemView

- (instancetype)initWithData:(NSDictionary *)data
{
    self = [super init];
    if (self) {
        self.data = data;
        [self createView];
    }
    return self;
}


- (void)createView
{
    //imageView
    UIImageView *img = [[UIImageView alloc] init];
    img.frame = CGRectMake(0, 0, self.frame.size.width, 200 - 35);
    img.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    img.image = [UIImage imageNamed:[self.data objectForKey:@"imageName"]];
    [self addSubview:img];
    
    //title
    UILabel *titleLb = [[UILabel alloc] init];
    titleLb.frame = CGRectMake(0, 200 - 35, self.frame.size.width, 20);
    titleLb.text = [self.data objectForKey:@"title"];
    titleLb.font = [UIFont boldSystemFontOfSize:16];
    titleLb.textAlignment = NSTextAlignmentCenter;
    titleLb.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self addSubview:titleLb];
    //cost
    UILabel *costLB = [[UILabel alloc] init];
    costLB.frame = CGRectMake(0, 200 - 15, self.frame.size.width, 15);
    costLB.text = [self.data objectForKey:@"cost"];
    costLB.font = [UIFont systemFontOfSize:15];
    costLB.textAlignment = NSTextAlignmentCenter;
    costLB.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self addSubview:costLB];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [btn addTarget:self action:@selector(onTouchupInsideItem:) forControlEvents:UIControlEventTouchUpInside];
    btn.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self addSubview:btn];
}

- (void)onTouchupInsideItem:(UIButton *)sender
{
    //self.delegate에 delegate method가 구현이 되있나 확인
    if ([self.delegate respondsToSelector:@selector(didSelectedItemView:)]) {
        [self.delegate didSelectedItemView:self];
    }
}

- (NSString *)getTitle
{
    return [self.data objectForKey:@"title"];
}

- (NSInteger)getCost
{
    return [[self.data objectForKey:@"cost"] integerValue];
}


@end
