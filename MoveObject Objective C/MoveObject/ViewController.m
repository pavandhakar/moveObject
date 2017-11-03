//
//  ViewController.m
//  MoveObject
//
//  Created by pavan on 10/27/17.
//  Copyright © 2017 Pavan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    BOOL val;
    BOOL EndMove;
    int changeMoveX;
    int changeMoveY;
    
    UITapGestureRecognizer *singleTap;
    UIImageView *showimage,*showimage1;
    UIButton *done;
    UILabel *detail,*detail2;
    UIView *customView;
    BOOL NoOfPisition;
    CGFloat h;
    UILabel *_lbl_CountPoint;

}
@property (strong, nonatomic) IBOutlet UIButton *btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    changeMoveX=1;
    changeMoveY=1;
    _lbl_CountPoint=[[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width-150, 50, 150, 100)];
    _lbl_CountPoint.backgroundColor=[UIColor redColor];
    [self.view addSubview:_lbl_CountPoint];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"Drag me!" forState:UIControlStateNormal];
    UIImage *img=[UIImage imageNamed:@"pavan.jpg"];
    button.tag=0;
    
    [button setBackgroundImage:img forState:UIControlStateNormal];
    // add drag listener
    [button addTarget:self action:@selector(wasDragged:withEvent:)
     forControlEvents:UIControlEventTouchDragInside];
    // add click
    [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    // center and size
    NSString *pois=[[NSUserDefaults standardUserDefaults]objectForKey:@"btnPisition"];
    if (pois != nil) {
        // set old size (after deag )
        CGPoint u= CGPointFromString(pois);
        button.frame=CGRectMake(u.x, u.y, 80, 80);
        button.center=CGPointMake(u.x, u.y);
    }else{
        //add size
    button.frame = CGRectMake((self.view.bounds.size.width - 100)/2.0,
                              (self.view.bounds.size.height - 50)/2.0,
                              80, 80);
    }
    // add it, centered
    [self.view addSubview:button];
    
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [button1 setTitle:@"Drag me2!" forState:UIControlStateNormal];
//    button1.backgroundColor=[UIColor clearColor];
    button1.tag=1;
    img=[UIImage imageNamed:@"karishma.jpg"];
    [button1 setBackgroundImage:img forState:UIControlStateNormal];

    // add drag listener
    [button1 addTarget:self action:@selector(wasDragged:withEvent:)
     forControlEvents:UIControlEventTouchDragInside];
    // add click
    [button1 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    // center and size
    NSString *pois1=[[NSUserDefaults standardUserDefaults]objectForKey:@"btnPisition1"];
    if (pois1 != nil) {
        // set old size (after deag )
        CGPoint u1= CGPointFromString(pois1);
        button1.frame=CGRectMake(u1.x, u1.y, 100, 100);
        button1.center=CGPointMake(u1.x, u1.y);
    }else{
        //add size
        button1.frame = CGRectMake((self.view.bounds.size.width - 50)/2.0,
                                  (self.view.bounds.size.height - 30)/2.0,
                                  100, 100);
    }
    // add it, centered
    [self.view addSubview:button1];
  
}

//-(void)click{
//    if (val) {
//        NSLog(@"\n\n\n\n\nDrag");
//        val=NO;
//    }
//    else{
//
//        NSLog(@"\n\n\n\n\nClick");
//    }
//}
-(IBAction)click:(id)sender{
    id k=sender;
    if (val) {
        NSLog(@"\n\n\n\n\nDrag");
        val=NO;
    }
    else{
        
        NSLog(@"\n\n\n\n\nClick ");
    }
}
- (void)wasDragged:(UIButton *)button withEvent:(UIEvent *)event
{
    val=YES;
    // get the touch
    UITouch *touch = [[event touchesForView:button] anyObject];
    
    // get delta
    CGPoint previousLocation = [touch previousLocationInView:button];
    CGPoint location = [touch locationInView:button];
    CGFloat delta_x = location.x - previousLocation.x;
    CGFloat delta_y = location.y - previousLocation.y;
    
    // move button
    button.center = CGPointMake(button.center.x + delta_x,
                                button.center.y + delta_y);
    if (button.tag==0) {
        NSString *theCenter = NSStringFromCGPoint(button.center);
        [[NSUserDefaults standardUserDefaults]setObject:theCenter forKey:@"btnPisition"];
    }
    else{
        NSString *theCenter = NSStringFromCGPoint(button.center);
        [[NSUserDefaults standardUserDefaults]setObject:theCenter forKey:@"btnPisition1"];
    }
   
    
    
}
- (IBAction)move:(id)sender {
//    [self LR];
    [self rendamMove];
    _btn.hidden=YES;
    
}

-(void)rendamMove{
    CGRect basketTopFrame = _Switch3Way.frame;
    
    CGFloat x1=_Switch3Way.frame.origin.x;
    CGFloat y1=_Switch3Way.frame.origin.y;

//    basketTopFrame.origin.x = self.view.frame.size.width-_Switch3Way.frame.size.width;
    
    int w=self.view.frame.size.width;
    int h=self.view.frame.size.height;
    int WrandomNumber = arc4random() % w;
    int HrandomNumber = arc4random() % h;

        if (WrandomNumber+_Switch3Way.frame.origin.x>w) {
            WrandomNumber=w-_Switch3Way.frame.size.width;
            if (changeMoveX==2) {
                WrandomNumber=100;
            }else{
                changeMoveX++;
            }
        }
        if (_Switch3Way.frame.origin.y+HrandomNumber>h) {
            HrandomNumber=h-_Switch3Way.frame.size.height;
            if (changeMoveY==2) {
                HrandomNumber=100;
            }else{
                changeMoveY++;
            }
        }
        if (HrandomNumber<65) {
            HrandomNumber=65;
        }
 
    
//    if (_Switch3Way.frame.origin.x+WrandomNumber>w) {
//        WrandomNumber=w-WrandomNumber;
//        if (WrandomNumber<0) {
//            WrandomNumber=0;
//        }
//        if (WrandomNumber>w) {
//            WrandomNumber=w;
//        }
//    }
//    if (_Switch3Way.frame.origin.y+HrandomNumber>h) {
//        HrandomNumber=h-HrandomNumber;
//        if (HrandomNumber<65) {
//            HrandomNumber=65;
//        }
//        if (HrandomNumber>h) {
//            HrandomNumber=h;
//        }
//    }
    basketTopFrame.origin.x = WrandomNumber;
    basketTopFrame.origin.y = HrandomNumber;
    CGFloat ti=pow(WrandomNumber-x1, 2);
    CGFloat ty=pow(HrandomNumber-y1, 2);
    CGFloat s=sqrt(ti+ty)/100;
    NSLog(@"%f",s);
    
    [UIView animateWithDuration:s/4 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        _Switch3Way.frame = basketTopFrame;
        
    } completion:^(BOOL finished){
        if (!EndMove) {
            [self rendamMove];
        }
    }];
}
-(void)LR{
    CGRect basketTopFrame = _Switch3Way.frame;
    
    basketTopFrame.origin.x = self.view.frame.size.width-_Switch3Way.frame.size.width-_Switch3Way.frame.origin.x;
    
    [UIView animateWithDuration:2.3 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        _Switch3Way.frame = basketTopFrame;
        
        
        int w=self.view.frame.size.width;
        int h=self.view.frame.size.height;
        NSInteger WrandomNumber = arc4random() % w;
        NSInteger HrandomNumber = arc4random() % h;
        if (_Switch3Way.frame.origin.x+WrandomNumber>w) {
            WrandomNumber=w-WrandomNumber;
        }
        if (_Switch3Way.frame.origin.y+HrandomNumber>h) {
            HrandomNumber=h-HrandomNumber;
        }
        CGRect basketTopFrame = _Switch3Way.frame;
        basketTopFrame.origin.x = WrandomNumber;
        basketTopFrame.origin.y = HrandomNumber;
        
    } completion:^(BOOL finished){
        [self LR];
    }];
}




-(void)bottom{
    CGRect basketTopFrame = _Switch3Way.frame;
    basketTopFrame.origin.y = self.view.frame.size.height-_Switch3Way.frame.size.height;
    [UIView animateWithDuration:3.3 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{ _Switch3Way.frame = basketTopFrame; } completion:^(BOOL finished){
        [self RL];
        [self bottom];
    }];
}
-(void)RL{
    CGRect napkinBottomFrame = _Switch3Way.frame;
    napkinBottomFrame.origin.x = 0;
    [UIView animateWithDuration:2.3 delay:0.0 options: UIViewAnimationOptionCurveEaseOut animations:^{ _Switch3Way.frame = napkinBottomFrame; } completion:^(BOOL finished){
        [self Top];
        [self LR];
    }];
}
-(void)Top{
    CGRect basketTopFrame = _Switch3Way.frame;
    basketTopFrame.origin.y = 50;
    [UIView animateWithDuration:3.3 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{ _Switch3Way.frame = basketTopFrame; } completion:^(BOOL finished){
        [self LR];
    }];
}

//-(void)LR{
//    CGRect basketTopFrame = _Switch3Way.frame;
//    basketTopFrame.origin.x = self.view.frame.size.width-_Switch3Way.frame.size.width;
//
//    [UIView animateWithDuration:2.3 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{ _Switch3Way.frame = basketTopFrame; } completion:^(BOOL finished){
//        [self bottom];
//        [self RL];
//    }];
//}
//-(void)bottom{
//    CGRect basketTopFrame = _Switch3Way.frame;
//    basketTopFrame.origin.y = self.view.frame.size.height-_Switch3Way.frame.size.height;
//    [UIView animateWithDuration:3.3 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{ _Switch3Way.frame = basketTopFrame; } completion:^(BOOL finished){
//        [self RL];
//        [self bottom];
//    }];
//}
//-(void)RL{
//    CGRect napkinBottomFrame = _Switch3Way.frame;
//    napkinBottomFrame.origin.x = 0;
//    [UIView animateWithDuration:2.3 delay:0.0 options: UIViewAnimationOptionCurveEaseOut animations:^{ _Switch3Way.frame = napkinBottomFrame; } completion:^(BOOL finished){
//        [self Top];
//        [self LR];
//    }];
//}
//-(void)Top{
//    CGRect basketTopFrame = _Switch3Way.frame;
//    basketTopFrame.origin.y = 50;
//    [UIView animateWithDuration:3.3 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{ _Switch3Way.frame = basketTopFrame; } completion:^(BOOL finished){
//        [self LR];
//    }];
//}


-(void)viewDidAppear:(BOOL)animated{
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected)];
    singleTap.numberOfTapsRequired = 2;
    _lbl_CountPoint.userInteractionEnabled = YES;
    [_lbl_CountPoint addGestureRecognizer:singleTap];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(doneButtonAction) name:@"hidePavanPhoto" object:nil];
}
-(void)tapDetected
{
    CGFloat hight=self.view.frame.size.height/2;
    CGFloat width=self.view.frame.size.width;
    _lbl_CountPoint.userInteractionEnabled=NO;
    
    customView=[[UIImageView alloc] initWithFrame:CGRectMake(0,0,hight,hight*2)];
    customView.backgroundColor=[UIColor brownColor];
    [self.view addSubview:customView];
    
    showimage = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,0,0)];
    showimage.image=[UIImage imageNamed:@"pavan.jpg"];
    showimage.clipsToBounds=YES;
    showimage.layer.cornerRadius=0;
    [self.view addSubview:showimage];
    
    showimage1 = [[UIImageView alloc] initWithFrame:CGRectMake(0,hight,0,0)];
    showimage1.image=[UIImage imageNamed:@"karishma.jpg"];
    showimage1.clipsToBounds=YES;
    showimage1.layer.cornerRadius=0;
    [self.view addSubview:showimage1];
    
    detail = [[UILabel alloc] initWithFrame:CGRectMake(width,hight-70,width,70)];
    detail.text=@" pavan dhakar (IOS Developer)\n mobile no. 7859977254\n Developed by Pavan";
    detail.font=[UIFont systemFontOfSize:16];
    detail.textColor=[UIColor redColor];
    detail.numberOfLines=5;
    [self.view addSubview:detail];
    
    detail2 = [[UILabel alloc] initWithFrame:CGRectMake(width,hight*2-70,width,70)];
    detail2.text=@" Gaurava Srivastava (IOS Developer)\n mobile no. 9555307990\n Developed by Gaurav";
    detail2.font=[UIFont systemFontOfSize:16];
    detail2.textColor=[UIColor redColor];
    detail2.numberOfLines=5;
    [self.view addSubview:detail2];
    
    done=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    [done setTitle:@"X" forState:UIControlStateNormal];
    done.titleLabel.font = [UIFont systemFontOfSize: 30];
    done.layer.cornerRadius=25;
    done.clipsToBounds=YES;
    done.backgroundColor=[UIColor blackColor];
    [done addTarget:self action:@selector(doneButtonAction) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:done];
    
    [UIView animateWithDuration:2.00
                          delay:0
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         CGFloat hight=self.view.frame.size.height/2;
                         showimage.frame = CGRectMake(0,0,hight,hight);
                         showimage1.frame = CGRectMake(0,hight,hight,hight);
                         done.frame=CGRectMake(showimage.frame.origin.x+30, showimage.frame.origin.y+30, 50, 50);
                         showimage.layer.cornerRadius=hight/2;
                         showimage1.layer.cornerRadius=hight/2;
                         detail.frame =CGRectMake(0,hight-70,self.view.frame.size.width,70);
                         detail2.frame=CGRectMake(0,hight*2-70,self.view.frame.size.width,70);
                     }
                     completion:^(BOOL finished){
                     }];
}
-(void)doneButtonAction
{
    [done removeFromSuperview];
    [showimage removeFromSuperview];
    [showimage1 removeFromSuperview];
    _lbl_CountPoint.userInteractionEnabled=YES;
    [detail removeFromSuperview];
    [detail2 removeFromSuperview];
    [customView removeFromSuperview];
}
-(void)viewWillDisappear:(BOOL)animated{
    [self doneButtonAction];
    EndMove=YES;
}

@end
