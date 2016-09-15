//
//  CATransactionViewController.m
//  CALayer_Learn
//
//  Created by zhilong.lin on 16/3/4.
//  Copyright © 2016年 zhilong.lin. All rights reserved.
//

#import "CATransactionViewController.h"

@interface CATransactionViewController ()
@property (nonatomic, strong)CALayer *layer;
@property (nonatomic, strong)CALayer *anotherLayer;
@end

@implementation CATransactionViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
    
    self.restorationIdentifier = NSStringFromClass([self class]);
    self.restorationClass = [self class];
    // Do any additional setup after loading the view, typically from a nib.
}

+ (UIViewController *)viewControllerWithRestorationIdentifierPath:(NSArray *)identifierComponents coder:(NSCoder *)coder {
    UIViewController *vc = [self new];
    return vc;
}

- (void)encodeRestorableStateWithCoder:(NSCoder *)coder {
    [super encodeRestorableStateWithCoder:coder];
}

- (void)decodeRestorableStateWithCoder:(NSCoder *)coder {
    [super decodeRestorableStateWithCoder:coder];
}

- (void)setup {
    //初始化一个layer,添加到主视图
    _layer=[CALayer layer];
    _layer.bounds = CGRectMake(0, 0, 200, 200);
    _layer.position = CGPointMake(160, 150);
    _layer.backgroundColor = [UIColor redColor].CGColor;
    _layer.borderColor = [UIColor blackColor].CGColor;
    _layer.opacity = 1.0f;
    [self.view.layer addSublayer:_layer];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"启动" forState:UIControlStateNormal];
    [button setFrame:CGRectMake(0, 0, 50, 50)];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(changeLayerProperty) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    _anotherLayer=[CALayer layer];
    _anotherLayer.bounds = CGRectMake(0, 0, 200, 200);
    _anotherLayer.position = CGPointMake(160, 450);
    _anotherLayer.backgroundColor = [UIColor redColor].CGColor;
    _anotherLayer.borderColor = [UIColor blackColor].CGColor;
    _anotherLayer.opacity = 1.0f;
    [self.view.layer addSublayer:_anotherLayer];
}

-(IBAction)changeLayerProperty
{
    
    
    
//    [CATransaction begin];
//    
//    //显式事务默认开启动画效果,kCFBooleanTrue关闭
//    
////    [CATransaction setValue:(id)kCFBooleanFalse
////     
////                     forKey:kCATransactionDisableActions];
//    
//    //动画执行时间
//    
//    [CATransaction setValue:[NSNumber numberWithFloat:.25f] forKey:kCATransactionAnimationDuration];
//    
//    //[CATransaction setAnimationDuration:[NSNumber numberWithFloat:5.0f]];
//    
//    _anotherLayer.cornerRadius = (_anotherLayer.cornerRadius == 0.0f) ? 100.0f : 0.0f;
//    
////    _layer.opacity = (_layer.opacity == 1.0f) ? 0.5f : 1.0f;
//    
//    [CATransaction commit];
//    
//    
//    [CATransaction flush];
//    //设置变化动画过程是否显示，默认为YES不显示
//    [CATransaction setDisableActions:NO];
//    //设置圆角
//    _layer.cornerRadius = (_layer.cornerRadius == 0.0f) ? 30.0f : 0.0f;
//    //设置透明度
//    _layer.opacity = (_layer.opacity == 1.0f) ? 0.5f : 1.0f;
    
    
    [CATransaction begin];
    [CATransaction begin];
    [CATransaction setDisableActions:NO];
    _layer.cornerRadius = (_layer.cornerRadius == 0.0f) ? 30.0f : 0.0f;
    [CATransaction commit];
    //上面的动画并不会立即执行，需要等最外层的commit
    [NSThread sleepForTimeInterval:3];
    //显式事务默认开启动画效果,kCFBooleanTrue关闭
    [CATransaction setValue:(id)kCFBooleanFalse
                     forKey:kCATransactionDisableActions];
    //动画执行时间
    [CATransaction setValue:[NSNumber numberWithFloat:3.0f] forKey:kCATransactionAnimationDuration];
    //[CATransaction setAnimationDuration:[NSNumber numberWithFloat:5.0f]];
    _anotherLayer.cornerRadius = (_anotherLayer.cornerRadius == 0.0f) ? 30.0f : 0.0f;
    
    
    [CATransaction commit];
}

@end
