//
//  startScreenViewController.m
//  calculator2
//
//  Created by Андрей Зябкин on 16.01.17.
//  Copyright © 2017 Андрей Зябкин. All rights reserved.
//

#import "startScreenViewController.h"

@interface startScreenViewController ()

@end

@implementation startScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //sleep(0.1);
    
    
    //Анимация открытия экрана
    [UIView animateWithDuration:1.0 delay:0.2 options:0 animations:^{
       
        CGRect frame1 = self->convertLabel.frame;
        CGRect frame2 = self->logoLabel.frame;
        CGRect frame3 = self->meLabel.frame;
        
        frame1.origin.x=frame1.origin.x+self.view.bounds.size.width;
        frame2.origin.x=frame2.origin.x-self.view.bounds.size.width;
        frame3.origin.x=frame3.origin.x+self.view.bounds.size.width;
        
        self->convertLabel.frame=frame1;
        self->logoLabel.frame=frame2;
        self->meLabel.frame=frame3;
        
    }
                     completion:^( BOOL completed ){
                         [self performSegueWithIdentifier:@"start" sender:self];
    }];
    [UIView commitAnimations];
    
}

/*

//Анимация открытия приложения
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    UIViewController *controller =segue.destinationViewController;
    controller.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
}

*/

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
