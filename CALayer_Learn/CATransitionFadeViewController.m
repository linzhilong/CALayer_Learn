//
//  CATransitionFadeViewController.m
//  CALayer_Learn
//
//  Created by zhilong.lin on 16/9/14.
//  Copyright © 2016年 zhilong.lin. All rights reserved.
//

#import "CATransitionFadeViewController.h"

@interface CATransitionFadeViewController ()
@property (nonatomic, strong) UIImageView *ballView;
@property (nonatomic, copy) NSArray *images;
@property (nonatomic, strong) UIView *layerView;
@property (nonatomic, strong) CALayer *shapeLayer;
@end

@implementation CATransitionFadeViewController

//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
//    [self.view addSubview:self.imageView];
//    //set up images
//    self.images = @[[UIImage imageNamed:@"Ship.png"],
//                    [UIImage imageNamed:@"boat.png"],
//                    [UIImage imageNamed:@"Ship.png"],
//                    [UIImage imageNamed:@"boat.png"]];
//
//    self.imageView.image = self.images[0];
//}
//
//
//- (IBAction)switchImage
//{
//    //set up crossfade transition
//    CATransition *transition = [CATransition animation];
//    transition.type = kCATransitionFade;
//    //apply transition to imageview backing layer
//    [self.imageView.layer addAnimation:transition forKey:nil];
//    //cycle to next image
//    UIImage *currentImage = self.imageView.image;
//    NSUInteger index = [self.images indexOfObject:currentImage];
//    index = (index + 1) % [self.images count];
//    self.imageView.image = self.images[index];
//}
//
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //get the touch point
    CGPoint point = [[touches anyObject] locationInView:self.view];
    //check if we've tapped the moving layer
    if ([self.ballView.layer.presentationLayer hitTest:point]) {
        [self setAngle:M_PI_4 forHand:self.ballView animated:YES];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.layerView];
    //create timing function
//    CAMediaTimingFunction *function = [CAMediaTimingFunction functionWithControlPoints:0.5 :0.5 :0.75 :0.75];
//    //get control points
//    CGPoint controlPoint1, controlPoint2;
//    [function getControlPointAtIndex:1 values:(float *)&controlPoint1];
//    [function getControlPointAtIndex:2 values:(float *)&controlPoint2];
//    //create curve
//    UIBezierPath *path = [[UIBezierPath alloc] init];
//    [path moveToPoint:CGPointZero];
//    [path addCurveToPoint:CGPointMake(1, 1)
//            controlPoint1:CGPointMake(0, 0.5) controlPoint2:CGPointMake(0.5, 0.75)];
//    //scale the path up to a reasonable size for display
//    [path applyTransform:CGAffineTransformMakeScale(200, 200)];
//    //create shape layer
    
    UIImage *ballImage = [UIImage imageNamed:@"Ship.png"];
    self.ballView = [[UIImageView alloc] initWithImage:ballImage];
    [self.view addSubview:self.ballView];
    
//    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
//    shapeLayer.strokeColor = [UIColor redColor].CGColor;
//    shapeLayer.fillColor = [UIColor clearColor].CGColor;
//    shapeLayer.lineWidth = 4.0f;
////    shapeLayer.path = path.CGPath;
//    shapeLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"Ship.png"].CGImage);
//    [self.layerView.layer addSublayer:shapeLayer];
    //flip geometry so that 0,0 is in the bottom-left
//    self.layerView.layer.geometryFlipped = YES;
}

- (void)setAngle:(CGFloat)angle forHand:(UIView *)handView animated:(BOOL)animated
{
    //generate transform
    CATransform3D transform = CATransform3DMakeRotation(angle, 0, 0, 1);
    if (animated) {
        //create transform animation
        CABasicAnimation *animation = [CABasicAnimation animation];
        animation.keyPath = @"transform";
        animation.fromValue = [handView.layer.presentationLayer valueForKey:@"transform"];
        animation.toValue = [NSValue valueWithCATransform3D:transform];
        animation.duration = 0.5;
        animation.delegate = self;
        animation.timingFunction = [CAMediaTimingFunction functionWithControlPoints:1 :0 :0.75 :1];
        //apply animation
        handView.layer.transform = transform;
        [handView.layer addAnimation:animation forKey:nil];
    } else {
        //set transform directly
        handView.layer.transform = transform;
    }
}

- (UIView *)layerView {
    if (!_layerView) {
        _layerView = [[UIView alloc] initWithFrame:self.view.bounds];
//        _layerView.backgroundColor = [UIColor blackColor];
    }
    return _layerView;
}

//- (void)setAngle:(CGFloat)angle forHand:(CALayer *)handViewLayer animated:(BOOL)animated
//{
//    //generate transform
//    CATransform3D transform = CATransform3DMakeRotation(angle, 0, 0, 1);
//    if (animated) {
//        //create transform animation
//        CABasicAnimation *animation = [CABasicAnimation animation];
//        animation.keyPath = @"transform";
//        animation.fromValue = [handViewLayer.presentationLayer valueForKey:@"transform"];
//        animation.toValue = [NSValue valueWithCATransform3D:transform];
//        animation.duration = 0.5;
//        animation.delegate = self;
//        animation.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0 :0.5 :0.75 :0.75];
//        //apply animation
//        handViewLayer.transform = transform;
//        [handViewLayer addAnimation:animation forKey:nil];
//    } else {
//        //set transform directly
//        handViewLayer.transform = transform;
//    }
//}
@end