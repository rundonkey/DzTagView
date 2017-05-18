//
//  ViewController.m
//  DzTagView
//
//  Created by 张达 on 2017/5/18.
//  Copyright © 2017年 张达. All rights reserved.
//

#import "ViewController.h"
#import "DzTag.h"
#import "DzTagView.h"
#import "UIImage+ImageCompress.h"
@interface ViewController ()

@property(strong,nonatomic)NSMutableArray * dataArr;
@property(strong,nonatomic)DzTagView        * tagView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tagView = [[DzTagView alloc] init];
    // 整个tagView对应其SuperView的上左下右距离
    self.tagView.padding = UIEdgeInsetsMake(15, 15, 10, 10);
    // 上下行之间的距离
    self.tagView.lineSpacing = 10;
    // item之间的距离
    self.tagView.interitemSpacing = 20;
    // 最大宽度
    self.tagView.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width-30;;
    [self.dataArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        // 初始化标签
        DzTag *tag = [[DzTag alloc] initWithText:self.dataArr[idx]];
        // 标签相对于自己容器的上左下右的距离
        tag.padding = UIEdgeInsetsMake(3, 15, 3, 15);
        // 弧度
        tag.cornerRadius = 11.0f;
        // 字体
        tag.font = [UIFont boldSystemFontOfSize:14];
        // 边框宽度
        tag.borderWidth = 0.5;
        // 选中背景
        tag.sebgColor = [UIImage imageWithColor:[UIColor colorWithRed:68/255.0 green:142/255.0 blue:247/255.0 alpha:1] forSize:CGSizeMake(28, 28)];
        // 边框颜色
        tag.borderColor = [UIColor colorWithRed:191/255.0 green:191/255.0 blue:191/255.0 alpha:1];
        // 字体颜色
        tag.textColor = [UIColor colorWithRed:204/255.0 green:204/255.0 blue:209/255.0 alpha:1];
        // 是否可点击
        tag.enable = YES;
        // 加入到tagView
        [self.tagView addTag:tag];
    }];
#pragma mark -- 回调block
    // 点击事件回调
    __weak __typeof(&*self) weakSelf =self;
    self.tagView.didTapTagAtIndex = ^(NSUInteger idx,UIButton * btn){
        
        NSLog(@"%@",btn.currentTitle);
        
    };
    // 获取刚才加入所有tag之后的内在高度
    CGFloat tagHeight = self.tagView.intrinsicContentSize.height;
    NSLog(@"高度%lf",tagHeight);
    self.tagView.frame = CGRectMake(15, 30,[UIScreen mainScreen].bounds.size.width - 30, tagHeight);
    [self.tagView layoutSubviews];
    [self.view addSubview:self.tagView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSMutableArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [[NSMutableArray alloc] initWithArray:@[@"嘿哈",@"萨瓦迪卡",@"刺客信条吗",@"嘿哈嘿哈嘿哈嘿哈",@"嘿哈嘿哈嘿哈嘿哈",@"嘿哈",@"嗯哼",@"呵呵哒",@"嘿哈嘿哈嘿哈嘿哈嘿哈嘿哈嘿哈嘿哈",@"嘿哈嘿",@"嘿哈嘿哈嘿",@"嘿哈",@"嘿哈嘿哈嘿哈嘿哈嘿哈"]];
    }
    return _dataArr;
}
@end
