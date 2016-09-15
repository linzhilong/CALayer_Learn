//
//  CAKeyframeAnimationViewController.m
//  CALayer_Learn
//
//  Created by zhilong.lin on 16/9/14.
//  Copyright © 2016年 zhilong.lin. All rights reserved.
//

#import "CAKeyframeAnimationViewController.h"

@interface CAKeyframeAnimationViewController ()

@end

@implementation CAKeyframeAnimationViewController

//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    //create a path
//    UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
//    [bezierPath moveToPoint:CGPointMake(0, 150)];
//    [bezierPath addCurveToPoint:CGPointMake(300, 150) controlPoint1:CGPointMake(75, 0) controlPoint2:CGPointMake(225, 300)];
//    //draw the path using a CAShapeLayer
//    CAShapeLayer *pathLayer = [CAShapeLayer layer];
//    pathLayer.path = bezierPath.CGPath;
//    pathLayer.fillColor = [UIColor clearColor].CGColor;
//    pathLayer.strokeColor = [UIColor redColor].CGColor;
//    pathLayer.lineWidth = 3.0f;
//    [self.view.layer addSublayer:pathLayer];
//    //add the ship
//    CALayer *shipLayer = [CALayer layer];
//    shipLayer.frame = CGRectMake(0, 0, 64, 64);
//    shipLayer.position = CGPointMake(0, 150);
//    shipLayer.contents = (__bridge id)[UIImage imageNamed: @"Ship.png"].CGImage;
//    [self.view.layer addSublayer:shipLayer];
//    //create the keyframe animation
//    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
//    animation.keyPath = @"position";
//    animation.duration = 4.0;
//    animation.path = bezierPath.CGPath;
//    animation.rotationMode = kCAAnimationRotateAuto;
//    [shipLayer addAnimation:animation forKey:nil];
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //add the ship
    CALayer *shipLayer = [CALayer layer];
    shipLayer.frame = CGRectMake(0, 0, 128, 128);
    shipLayer.position = CGPointMake(150, 150);
    shipLayer.contents = (__bridge id)[UIImage imageNamed: @"Ship.png"].CGImage;
    [self.view.layer addSublayer:shipLayer];
    //animate the ship rotation
//    CABasicAnimation *animation = [CABasicAnimation animation];
//    animation.keyPath = @"transform";
//    animation.duration = 2.0;
//    animation.toValue = [NSValue valueWithCATransform3D: CATransform3DMakeRotation(M_PI, 0, 0, 1)];
//    [shipLayer addAnimation:animation forKey:nil];
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.rotation";
    animation.duration = 2.0;
    animation.byValue = @(M_PI * 2);
    [shipLayer addAnimation:animation forKey:nil];
}

@end
