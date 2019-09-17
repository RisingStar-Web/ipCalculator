//
//  ViewController.h
//  calculator2
//
//  Created by Андрей Зябкин on 16.02.16.
//  Copyright © 2016 Андрей Зябкин. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    IBOutlet UITextField *textLeft;
    IBOutlet UITextField *textRight;
    
    //Кнопки
    IBOutlet UIButton *one;
    IBOutlet UIButton *two;
    IBOutlet UIButton *three;
    IBOutlet UIButton *four;
    IBOutlet UIButton *five;
    IBOutlet UIButton *six;
    IBOutlet UIButton *seven;
    IBOutlet UIButton *eight;
    IBOutlet UIButton *nine;
    IBOutlet UIButton *DEL;
    IBOutlet UIButton *CLEAR;
    IBOutlet UIButton *DOT;
    IBOutlet UIButton *EQUAL;
    IBOutlet UIButton *NOL;
    
    //Кнопка перемены основ местами
    IBOutlet UILabel *rotate;
    
    //Поля
    IBOutlet UITextView *ipField;
    IBOutlet UITextView *maskField;
    IBOutlet UITextView *maskNumField;
    IBOutlet UITextView *answerText;
    
    IBOutlet UITextView *fromWhat;
    IBOutlet UITextView *toWhat;
    
    
    NSString *answerString;
    
    IBOutlet UILabel *ipLabel;
    
    
    //Строки вывода
    IBOutlet UILabel *ipDec;
    
    IBOutlet UILabel *netmaskLabel;
    IBOutlet UILabel *wildcardLabel;
    IBOutlet UILabel *networkLabel;
    IBOutlet UILabel *broadcastLabel;
    IBOutlet UILabel *hostMinLabel;
    IBOutlet UILabel *hostMaxLabel;
    IBOutlet UILabel *hostsLabel;
    
    IBOutlet UILabel *ipBinLabel;
    IBOutlet UILabel *netmaskBinLabel;
    IBOutlet UILabel *wildcardBinLabel;
    IBOutlet UILabel *networkBinLabel;
    IBOutlet UILabel *broadcastBinLabel;
    IBOutlet UILabel *hostMinBinLabel;
    IBOutlet UILabel *hostMaxBinLabel;
    
    IBOutlet UILabel *ipHexLabel;
    IBOutlet UILabel *netmaskHexLabel;
    IBOutlet UILabel *wildcardHexLabel;
    IBOutlet UILabel *networkHexLabel;
    IBOutlet UILabel *broadcastHexLabel;
    IBOutlet UILabel *hostMinHexLabel;
    IBOutlet UILabel *hostMaxHexLabel;
    
    
    IBOutlet UISegmentedControl *hexOrBinSwitch;
}

//-(IBAction)onePressed;
//-(IBAction)twoPressed;
//-(IBAction)threePressed;
//-(IBAction)fourPressed;
//-(IBAction)fivePressed;
//-(IBAction)sixPressed;
//-(IBAction)sevenPressed;
//-(IBAction)eightPressed;
//-(IBAction)ninePressed;
//-(IBAction)APressed;
//-(IBAction)BPressed;
//-(IBAction)CPressed;
//-(IBAction)DPressed;
//-(IBAction)DELPressed;
//-(IBAction)CLEARPressed;
//-(IBAction)DOTPressed;
//-(IBAction)EQUALPressed;
//-(IBAction)NOLPressed;
//-(IBAction)RESHETKAPressed;
//-(IBAction)ZVEZDAPressed;


//Нажата одна из кнопок на клавиатуре
-(IBAction)buttonPressed:(id)sender;
-(IBAction)fromWhatPressed;
-(IBAction)toWhatPressed;

-(IBAction)ravnoPressed:(id)sender;




@end

