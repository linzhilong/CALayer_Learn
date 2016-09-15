//
//  MaskViewController.m
//  CALayer_Learn
//
//  Created by zhilong.lin on 16/3/4.
//  Copyright © 2016年 zhilong.lin. All rights reserved.
//

#import "MaskViewController.h"

@interface MaskViewController ()
@end

@implementation MaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.restorationIdentifier = NSStringFromClass([self class]);
    self.restorationClass = [self class];
    
    [self setup];
    self.edgesForExtendedLayout = UIRectEdgeTop;
    // Do any additional setup after loading the view, typically from a nib.
}

//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    self.navigationController.navigationBar.hidden = NO;
//}

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
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = CGRectMake(10, 10, 300, 200);
    shapeLayer.fillColor =  [[UIColor redColor] CGColor];
    shapeLayer.strokeColor  = [[UIColor blueColor] CGColor];
    shapeLayer.lineCap = kCALineCapRound;
    [shapeLayer setLineJoin:kCALineJoinRound];
    [shapeLayer setLineDashPattern:@[@1, @20, @10, @30]];
    shapeLayer.lineWidth = 5;
//    shapeLayer.miterLimit = 20.f;
    shapeLayer.lineDashPhase = 15;
//    shapeLayer.opacity = 0.2;
    UIBezierPath * path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 300, 200)];
    shapeLayer.path = [path CGPath];
//    shapeLayer.masksToBounds = YES;
//    shapeLayer.strokeStart = 0.1;
//    shapeLayer.strokeEnd = 0.5;
    shapeLayer.fillRule = kCAFillRuleEvenOdd;
    
    CAGradientLayer *gradientLayer =  [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(0, 10, 200, 40);
    [gradientLayer setColors:[NSArray arrayWithObjects:(id)[[UIColor redColor] CGColor],(id)[[UIColor blueColor] CGColor], (id)[[UIColor blackColor] CGColor],nil]];
    [gradientLayer setLocations:@[@0, @0.5, @1]];
    [gradientLayer setStartPoint:CGPointMake(0, 0.5)];
    [gradientLayer setEndPoint:CGPointMake(1, 0.5)];
//    gradientLayer.masksToBounds = YES;
//        gradientLayer.opacity = 0.1;
    
//    [gradientLayer setMask:shapeLayer]; //用progressLayer来截取渐变层
    [self.view.layer addSublayer:gradientLayer];
}

@end
/*
 
*/
