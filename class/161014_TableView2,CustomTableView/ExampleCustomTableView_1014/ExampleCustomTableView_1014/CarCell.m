//
//  CarCell.m
//  ExampleCustomTableView_1014
//
//  Created by david on 2016. 10. 14..
//  Copyright © 2016년 david. All rights reserved.
//

#import "CarCell.h"

//()를 쓰는이유는 ?? 확장때문인가??
//왜 프로퍼티를 사용해야하지 ?? 다른 메서드에서 사용하기위해?
@interface CarCell()

///자동차 이미지
@property UIImageView *carImgView;
///배경 이미지
@property UIView *coverView;
///자동차 이름
@property UILabel *carNameLb;

@end

@implementation CarCell

//이건왜 주석??
//- (void)awakeFromNib {
//    [super awakeFromNib];
//    // Initialization code
//}

//초기화override
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        [self createView];
    }
    return self;
}

//updateLayout
- (void)layoutSubviews
{
    [super layoutSubviews];
    [self updateLayout];
}

//왜 void이지?? 세팅만 하면 되는 역할이다?
- (void)createView
{
    //자동차 이미지 뷰
    self.carImgView = [[UIImageView alloc] init];
    self.carImgView.contentMode = UIViewContentModeScaleAspectFill;
    self.carImgView.clipsToBounds = YES;
    [self.contentView addSubview:self.carImgView];
    
    //배경 뷰
    self.coverView = [[UIView alloc] init];
    self.coverView.backgroundColor = [[UIColor alloc] initWithRed:30.f/255.f green:30.f/255.f blue:30.f/255.f alpha:0.5];
    [self.carImgView addSubview:self.coverView];
    
    //자동차 이름
    self.carNameLb = [[UILabel alloc] init];
    self.carNameLb.textColor = [UIColor whiteColor];
    self.carNameLb.font = [UIFont boldSystemFontOfSize:40];
    self.carNameLb.textAlignment = NSTextAlignmentCenter;
    [self.coverView addSubview:self.carNameLb];
}

//이미지 셋
- (void)setCarImgImgedName:(NSString *)name
{
    self.carImgView.image = [UIImage imageNamed:name];
}

//이미지 이름 셋
- (void)setCarName:(NSString *)name
{
    self.carNameLb.text = name;
}

//크기 조절을 view에서 하는 이유는? tableView에서 delegate를 통하여 height 값을 조절하던데 ?
- (void)updateLayout
{
    self.carImgView.frame = self.bounds;
    self.coverView.frame = CGRectMake(0, 0, self.carImgView.frame.size.width, self.carImgView.frame.size.height);
    self.carNameLb.frame = CGRectMake(0, 0, self.coverView.frame.size.width, self.coverView.frame.size.height);
}
//얜 뭐지??
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
