//
//  ViewController.m
//  prize1
//
//  Created by 极客学院 on 16/2/19.
//  Copyright © 2016年 极客学院. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *personList;   // 显示抽奖人信息的label

@property(nonatomic,strong)NSTimer*timer1;          // 计时器

@property(nonatomic,strong)NSArray*personArray;     // 参与抽奖人数组

@end


@implementation ViewController

#pragma  懒加载
-(NSArray*)personArray
{
    if (_personArray == nil) {
        NSString*strPath = [[NSBundle mainBundle]pathForResource:@"person.plist" ofType:nil];
        _personArray = [NSArray arrayWithContentsOfFile:strPath];
        

    }
    
    return _personArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
   // self.personArray;
}

- (IBAction)start:(id)sender {
    
    if (self.timer1.isValid) { // 如果计时器在运行
        [self.timer1 invalidate]; // 关闭计时器
    }
    
    // 启动一个计时器，指定每0.3秒运行一次TimerFunc函数
    self.timer1 = [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(TimerFunc) userInfo:nil repeats:YES];
    
   }

- (IBAction)end:(id)sender {
    
    if (self.timer1.isValid) { // 如果计时器在运行
        [self.timer1 invalidate]; // 关闭计时器
    }
}

// 计时器响应函数
-(void)TimerFunc
{
    // 1 生成随机数
    int iRand = arc4random()%self.personArray.count;
    
    // 2 显示随机数对应的人名
    self.personList.text = [NSString stringWithFormat:@"%@",self.personArray[iRand]];
    

}
@end
