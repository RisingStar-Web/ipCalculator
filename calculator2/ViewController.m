//
//  ViewController.m
//  calculator2
//
//  Created by Андрей Зябкин on 16.02.16.
//  Copyright © 2016 Андрей Зябкин. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//Флаг - какое поле редактируется
int flag;

//bool isTextBig;
//bool isAnswerTextBig;
//bool isFromToBig;

float startHeight;

NSDictionary *exponentAttributes;
NSDictionary *textAttributes;

bool isJustOpened;



//Произошло нажатие на IP
-(void)textTapped{
    
    
    //Очищаем ранее введенное
    [ipField setText:@""];
    
    flag=1;
    NSLog(@"TEXT");
}

//Произошло нажатие на Mask
-(void)maskFieldTapped{
    
    
    //Очищаем ранее введенное
    [maskField setText:@""];
    
    flag=2;
    NSLog(@"MASK");
}

//Произошло нажатие на fromWhat
-(void)fromWhatTapped{
    
    //Очищаем ранее введенное
    [fromWhat setText:@""];
    
    flag=2;
    NSLog(@"FROM");

  
    
    //Анимированно гасим неактивные кнопки
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationDelay:0];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    
    
    
    [UIView commitAnimations];
    
    
}

//Произошло нажатие на toWhat
-(void)toWhatTapped{
    
    //Очищаем ранее введенное
    [toWhat setText:@""];
    
    flag=3;
    NSLog(@"TO");
    
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationDelay:0];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    
    
    [UIView commitAnimations];
    
}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    /*
    CGRect frame= answerText.frame;
    frame.origin.y=fromWhat.frame.origin.y+fromWhat.frame.size.height;
    frame.size.height=one.frame.origin.y-frame.origin.y;
    [answerText setFrame:frame];
    */
    

    //Понимаем на какое поле нажато
    UITapGestureRecognizer *gestureTextRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(textTapped)];
    [ipField addGestureRecognizer:gestureTextRecognizer];
    
    UITapGestureRecognizer *gestureMaskRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(maskFieldTapped)];
    [maskField addGestureRecognizer:gestureMaskRecognizer];
    
    /*
    UITapGestureRecognizer *gestureFromWhatRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fromWhatTapped)];
    [fromWhat addGestureRecognizer:gestureFromWhatRecognizer];
    
    UITapGestureRecognizer *gestureToWhatRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toWhatTapped)];
    [toWhat addGestureRecognizer:gestureToWhatRecognizer];
     */
    
    
    
    //Понимаем, что кнопка перемен основ нажата
    [rotate setUserInteractionEnabled:YES];
    UITapGestureRecognizer *tapRotateGesture =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rotateTap)];
    [rotate addGestureRecognizer:tapRotateGesture];
    
    
    //Выравнивание поля ввода
    //CGRect textViewSize=CGRectMake(0, 8, self.view.bounds.size.width, 50);
    //text.bounds=textViewSize;
    //[text setBounds:textViewSize];
    
    //Выравнивание поля ответа
    //CGRect answerTextRect=CGRectMake(0, A.bounds.origin.y-answerText.bounds.size.height, answerText.bounds.size.width, answerText.bounds.size.height);
    //[answerText setBounds:answerTextRect];
    
    //Обозначем, что редактируется вводимое число
    flag=1;
    //Обозначем, что приложение только что запущено
    isJustOpened=true;
    
    
    //Инициализируем вид степени
    exponentAttributes = @{NSForegroundColorAttributeName : [UIColor redColor], NSBaselineOffsetAttributeName : @(8)};
    //UIFont *font=[UIFont systemFontOfSize:18];
    //textAttributes=@{NSForegroundColorAttributeName : [UIColor darkGrayColor]};
    //textAttributes=[[NSDictionary alloc] initWithObjectsAndKeys:font,@{NSForegroundColorAttributeName : [UIColor darkGrayColor]}, nil];
    textAttributes=@{NSForegroundColorAttributeName : [UIColor darkGrayColor], NSFontAttributeName:[UIFont systemFontOfSize:18]};



    //Делаем динамическое изменение шрифта
    NSArray *labelsArray = [NSArray arrayWithObjects:ipDec, wildcardLabel, netmaskLabel,
                            networkLabel, broadcastLabel, hostMinLabel, hostMaxLabel, hostsLabel,
                            ipBinLabel, netmaskBinLabel, wildcardBinLabel,networkBinLabel, broadcastBinLabel, hostMinBinLabel, hostMaxBinLabel,
                            ipHexLabel, netmaskHexLabel, wildcardHexLabel,networkHexLabel, broadcastHexLabel, hostMinHexLabel, hostMaxHexLabel, nil];
    
    
    for (int i=0; i<labelsArray.count; i++){
        UILabel *currentLabel=[labelsArray objectAtIndex:i];
        currentLabel.numberOfLines=1;
        //currentLabel.minimumScaleFactor
        currentLabel.adjustsFontSizeToFitWidth = YES;
    }
    
    ipLabel.adjustsFontSizeToFitWidth=YES;

}



//Нажата кнопка смены основ местами
-(void)rotateTap{
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.7];
    [UIView setAnimationDelay:0];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    
    //NSString *tempText=fromWhat.text;
    //[fromWhat setText:toWhat.text];
    //[toWhat setText:tempText];
    
    CGAffineTransform transform = rotate.transform;
    transform = CGAffineTransformRotate(transform, M_PI);
    rotate.transform = transform;
    
    UITextView *tempView=fromWhat;
    fromWhat=toWhat;
    toWhat=tempView;
    
    UITapGestureRecognizer *gestureFromWhatRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fromWhatTapped)];
    [fromWhat addGestureRecognizer:gestureFromWhatRecognizer];
    
    UITapGestureRecognizer *gestureToWhatRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toWhatTapped)];
    [toWhat addGestureRecognizer:gestureToWhatRecognizer];

    
    //[rotate setTransform:CGAffineTransformMakeRotation(M_PI)];
    
    [UIView commitAnimations];
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





//Обработка касаний кнопок

-(IBAction)buttonPressed:(id)sender{
    
    
    UIButton *buttonPress=(UIButton *)sender;
    NSLog(@"%@ \n",buttonPress.currentTitle);
    
    UITextView *field;
    
    switch (flag) {
            //Если редактируется вводимое число
        case 1:{
            field =ipField;
        }
            break;
            
            //Если редактируется из какой системы переводить
        case 2:{
            field =maskField;
        }
            break;
    }
    
    NSString *currentString=field.text;
    
    //Удаляем вписанный текст, если программа только что запущена
    if(isJustOpened){
        currentString=@"";
        isJustOpened=false;
    }
    
    
    //Количество точек
    NSUInteger numOfDots;
    
    //Если это кнопки цифр, а не действий - добавляем в текстовое поле
    if (![buttonPress.currentTitle isEqual:@"<-"] & ![buttonPress.currentTitle isEqual:@"CE"]){
        
        //Количество точек
        numOfDots = [[[currentString stringByAppendingString:buttonPress.currentTitle] componentsSeparatedByString:@"."] count] - 1;
        
        
        if (numOfDots<4 && !(numOfDots==3 && [[currentString substringWithRange:NSMakeRange(currentString.length-3, 3)] rangeOfString:@"."].location>currentString.length-3)){
            
            NSString *lastChar;
            if (currentString.length>1)
                lastChar=[currentString substringFromIndex:(currentString.length-1)];
            //NSLog([NSString stringWithFormat:@"HOLA: %@", [currentString substringFromIndex:(currentString.length-1)]]);
            
            //Проверяем, чтобы двух точек подряд не было
            if (!([buttonPress.currentTitle isEqualToString:@"."] && [lastChar isEqualToString:@"."] && [buttonPress.currentTitle isEqualToString:lastChar]))
                //Записываем набранную строку
                currentString=[currentString stringByAppendingString:buttonPress.currentTitle];
            
            //Проверяем - не пора ли поставить точку
            if (currentString.length>2 && currentString.length<15 && [[currentString substringWithRange:NSMakeRange(currentString.length-3, 3)] rangeOfString:@"."].location==NSNotFound && numOfDots<3){
                currentString=[currentString stringByAppendingString:@"."];
            }
        }
        
    }
    //Backspase
    else if ([buttonPress.currentTitle isEqual:@"<-"] && ![currentString isEqualToString:@""]){
        currentString=[currentString substringToIndex:currentString.length-1];
    }
    else if ([buttonPress.currentTitle isEqual:@"CE"]){
        currentString=@"";
    }
    
    //Проверяем, чтобы вначале не стоял 0 и точка
    if ([currentString isEqualToString:@"0"] || [currentString isEqualToString:@"."]){
        //if(![[currentString stringByAppendingString:buttonPress.currentTitle] isEqualToString:@"0."])
        currentString=@"";
    }
    
    //Ограничиваем длину текста
    if(currentString.length<16){
        //Устанавливаем новый текст
        field.text=currentString;
    }
    
    
    
}


//Переводим по частям в шестнадцатеричную или двоичную систему
-(NSString*)makeHexDec:(NSString*)ipString system:(int)sysNum{
    
    NSArray *ipPartsArray=[ipString componentsSeparatedByString:@"."];
    NSString *hexString=@"";
    
    int partLength;
    if (sysNum==16)
        partLength=2;
    else
        partLength=8;
    
    int count=(int)[ipPartsArray count];
    
    //Если компонентов меньше 4 - ошибка
    if (count!=4){
        NSLog(@"Error with ip");
        return @"0";
    }
    else{
        for (int i=0; i<4; i++) {
            NSString *currentComp = (decToOther([[ipPartsArray objectAtIndex:i] floatValue], sysNum));
            //Добавляем 0 вначале, если число меньше максимального количества разрядов
            while (currentComp.length<partLength)
                currentComp=[@"0" stringByAppendingString:currentComp];
            //Добавляем в общую шестнадцатеричную строку
            hexString=[hexString stringByAppendingString:currentComp];
            if (i<3)
                hexString=[hexString stringByAppendingString:@"."];
        }
    }

    return hexString;
}

//Переводим из двоичной системы в десятичную
-(NSString *)makeDecFromBin:(NSString*)ipString{
    NSArray *ipPartsArray=[ipString componentsSeparatedByString:@"."];
    NSString *decString=@"";
    
    int count=(int)[ipPartsArray count];
    
    //Если компонентов меньше 4 - ошибка
    if (count!=4){
        NSLog(@"Error with ip");
        return @"0";
    }
    else{
        for (int i=0; i<4; i++) {
            NSString *currentComp = (otherToDec([ipPartsArray objectAtIndex:i], 2));
            //Добавляем в общую строку
            decString=[decString stringByAppendingString:currentComp];
            if (i<3)
                decString=[decString stringByAppendingString:@"."];
        }
    }
    
    return decString;
}

//Вычисляем Wildcard
-(NSString*)wildcardCalculate:(NSString*)maskString{
    NSArray *maskPartsArray=[maskString componentsSeparatedByString:@"."];
    NSString *wildcard=@"";
    
    int count=(int)[maskPartsArray count];
    //Если компонентов меньше 4 - ошибка
    if (count!=4){
        NSLog(@"Error with ip");
        return @"0";
    }
    else{
        for (int i=0; i<4; i++) {
            int currentCompInt = 255-(int)[[maskPartsArray objectAtIndex:i] integerValue];
            NSString *currentComp = [NSString stringWithFormat:@"%d",currentCompInt];
            wildcard=[wildcard stringByAppendingString:currentComp];
            if (i<3)
                wildcard=[wildcard stringByAppendingString:@"."];
        }
    }
    return wildcard;
}


//Вычисляем номер подсети
-(NSString*)maskNumberCalculate:(NSString*)maskBinString{
    
    NSString *maskNumber;
    
    maskBinString=[maskBinString stringByReplacingOccurrencesOfString:@"." withString:@""];
    
    //Считаем количество повторений единицы
    int numberOfOccurrences = (int)[[maskBinString componentsSeparatedByString:@"1"] count] - 1;
    maskNumber=[NSString stringWithFormat:@"%d",numberOfOccurrences];
    
    return maskNumber;
}


//Вставляем разделение точками
-(NSString *)insertDotsToString:(NSString *)inputString interval:(int)interval{
    NSMutableString *stringWithDots=[NSMutableString stringWithString:inputString];
    
    for (int i=1; i<4; i++){
        /*if (i%2==0)
            [stringWithDots insertString:@"." atIndex:interval*i+1];
        else
            [stringWithDots insertString:@"." atIndex:interval*i];
         */
        [stringWithDots insertString:@"." atIndex:interval*i+i-1];
    }
    
    return stringWithDots;
}


//Если нажато РАВНО
-(IBAction)ravnoPressed:(id)sender{
    
    
    //Строка с ответом
    answerString=@"IP hex: ";
    
    
    NSString *ipString=ipField.text; //IP введенный пользователем
    NSString *maskString=maskField.text; //Маска, введенная пользователем
    NSString *ipHexString; //IP в 16 ричном формате
    NSString *ipBinString; //IP в 2 ичном формате
    NSString *maskHexString; //Маска в 16 ричном формате
    NSString *maskBinString; //Маска в 2 ичном формате
    NSString *numberOfMask; //Номер маски
    NSString *hostsNumber; //Количество хостов
    NSString *wildcardString; //Wildcard
    NSString *wildcardBinString; //Wildcard
    NSString *wildcardHexString; //Wildcard
    NSString *network;
    NSString *networkBinString;
    NSString *networkHexString;
    NSString *hostMinBin;
    NSString *hostMaxBin;
    NSString *broadcastBin;
    NSString *broadcastHex;
    NSString *hostMinDec;
    NSString *hostMaxDec;
    NSString *hostMinHex;
    NSString *hostMaxHex;
    NSString *broadcastDec;
    
    //Проверяем корректность введенных данных
    if (ipString.length<7 ||
        maskString.length<7 ||
        [maskString componentsSeparatedByString:@"."].count<4 ||
        [ipString componentsSeparatedByString:@"."].count<4
        ){
        //[answerText setText:@"Error"];
        
        NSLog(@"ERROR");
        return;
    }
    
    NSArray *ipPartsArray=[ipString componentsSeparatedByString:@"."];
    NSArray *maskPartsArray=[maskString componentsSeparatedByString:@"."];
    for (int i=0; i<ipPartsArray.count; i++){
        NSString* currentPartIp=[ipPartsArray objectAtIndex:i];
        NSString* currentPartMask=[maskPartsArray objectAtIndex:i];
        if (currentPartIp.integerValue>255 || currentPartMask.integerValue>255)
            return;
    }
    
  
    
    //NSLog(@"WOW: %ld", [ipString stringByReplacingOccurrencesOfString:@"." withString:@""].integerValue);
    
    //Переводим IP в 16 ричный формат
    ipHexString=[self makeHexDec:ipString system:16];
    //Переводим IP в 2 ичный формат
    ipBinString=[self makeHexDec:ipString system:2];
    //Переводим маску в 16 ричный формат
    maskHexString=[self makeHexDec:maskString system:16];
    //Переводим маску в 2 ичный формат
    maskBinString=[self makeHexDec:maskString system:2];
    //Вычисляем wildcard
    wildcardString=[self wildcardCalculate:maskString];
    
    //Вычисляем номер подсети
    numberOfMask=[self maskNumberCalculate:maskBinString];
    
    NSString *maskBinStringTemp=[maskBinString stringByReplacingOccurrencesOfString:@"." withString:@""];
    //Проверяем верная ли маска
    for (int i=0; i<numberOfMask.integerValue; i++)
        if ([[maskBinStringTemp substringWithRange:NSMakeRange(i,1)] isEqualToString:@"0"])
            //Неверная маска
            return;
    
    //Расчитываем количество хостов
    int hostsNum=(int)pow(2, (32-(int)numberOfMask.integerValue))-2;
    hostsNumber=[NSString stringWithFormat:@"%d",hostsNum];
    
    //Расчитываем сеть
    NSString *firstPartOfIpString=[ipBinString stringByReplacingOccurrencesOfString:@"." withString:@""];
    NSString *secondPartOfIpString=@"00000000000000000000000000000000000000";
    firstPartOfIpString=[firstPartOfIpString substringToIndex:numberOfMask.integerValue];
    secondPartOfIpString=[secondPartOfIpString substringToIndex:32-numberOfMask.intValue];
    networkBinString=[firstPartOfIpString stringByAppendingString:secondPartOfIpString];
    
    //Вычисляем минимальный хост, максимальный хост и броадкаст
    hostMinBin=[networkBinString stringByReplacingCharactersInRange:NSMakeRange(networkBinString.length-1, 1) withString:@"1"];
    hostMinBin=[self insertDotsToString:hostMinBin interval:8];
    
    NSString *one=@"11111111111111111111111111111111111111111";
    one=[one substringToIndex:32-numberOfMask.intValue];
    broadcastBin=[firstPartOfIpString stringByAppendingString:one];
    
    hostMaxBin=[broadcastBin stringByReplacingCharactersInRange:NSMakeRange(broadcastBin.length-1, 1) withString:@"0"];
    hostMaxBin=[self insertDotsToString:hostMaxBin interval:8];
    
    //broadcastBin=[networkBinString stringByReplacingCharactersInRange:NSMakeRange(32-numberOfMask.intValue, numberOfMask.intValue) withString:[one substringToIndex:numberOfMask.integerValue]];
    
    networkBinString=[self insertDotsToString:networkBinString interval:8];
    broadcastBin=[self insertDotsToString:broadcastBin interval:8];
    network=[self makeDecFromBin:networkBinString];
    hostMinDec=[self makeDecFromBin:hostMinBin];
    hostMaxDec=[self makeDecFromBin:hostMaxBin];
    broadcastDec=[self makeDecFromBin:broadcastBin];
   
    
    //Переводим в двоичный формат
    wildcardBinString=[self makeHexDec:wildcardString system:2];
    
    //Переводим в шестнадцатеричный формат
    wildcardHexString=[self makeHexDec:wildcardString system:16];
    networkHexString=[self makeHexDec:broadcastDec system:16];
    broadcastHex=[self makeHexDec:broadcastDec system:16];
    hostMinHex=[self makeHexDec:hostMinDec system:16];
    hostMaxHex=[self makeHexDec:hostMaxDec system:16];
    
    //Выводим на экран результат
    //[ipDec setText:ipString];
    
    //if (hexOrBinSwitch.selectedSegmentIndex==0){ //Если выбрана двоичная система
    //        [ipBinLabel setText:ipBinString];
    //}
    
    
    //Добавляем перед номером макси /
    numberOfMask = [@"/ " stringByAppendingString:numberOfMask];
    
    [ipDec setText:ipString];
    [maskNumField setText:numberOfMask];
    [wildcardLabel setText:wildcardString];
    [netmaskLabel setText:maskString];
    [networkLabel setText:network];
    [broadcastLabel setText:broadcastDec];
    [hostMinLabel setText:hostMinDec];
    [hostMaxLabel setText:hostMaxDec];
    [hostsLabel setText:hostsNumber];
    
    [ipBinLabel setText:ipBinString];
    [netmaskBinLabel setText:maskBinString];
    [wildcardBinLabel setText:wildcardBinString];
    [networkBinLabel setText:networkBinString];
    [broadcastBinLabel setText:broadcastBin];
    [hostMinBinLabel setText:hostMinBin];
    [hostMaxBinLabel setText:hostMaxBin];
    
    [ipHexLabel setText:ipHexString];
    [netmaskHexLabel setText:maskHexString];
    [wildcardHexLabel setText:wildcardHexString];
    [networkHexLabel setText:networkHexString];
    [broadcastHexLabel setText:broadcastHex];
    [hostMinHexLabel setText:hostMinHex];
    [hostMaxHexLabel setText:hostMaxHex];

    
    
    
    [ipHexLabel setText:ipHexString];
    
}




//Если нажато поле - из какой системы переводить
-(IBAction)fromWhatPressed{
    
    //Обозначаем, что редактируется - из какой системы переводить
    flag=2;

}

//Если нажато поле - в какую систему переводить
-(IBAction)toWhatPressed{
    
     //Обозначаем, что редактируется - в какую систему переводить
    flag=3;
    
}






//Перезапись строки задом-наперед
NSString* reverseString(NSString* original) {
    const char* chars = [original cStringUsingEncoding:NSASCIIStringEncoding];
    int length = (int)strlen(chars);
    char* new = (char*)malloc(length+1);
    for (int i = 0; i < length; i++)
        new[i] = chars[length - i - 1];
    new[length] = '\0';
    NSString* reverseString = [NSString stringWithCString:new encoding:NSASCIIStringEncoding];
    free(new);
    return reverseString;
}

//Перевод в десятичную систему
NSString* otherToDec(NSString *original, int base) {
    const char* str = [original.uppercaseString cStringUsingEncoding:NSASCIIStringEncoding];
    
    int len = (int)strlen(str);
    int power = len - 1;
    long long i, j;
    double slagaemoe, number;
    number = 0;

    
    for (i = 0; i < len; ++i) {
        if (str[i] >= 'A' && str[i] <= 'Z')
            j = str[i] - 65 + 10;
        else
            j = str[i] - 48;

        slagaemoe=j * pow(base, power);
        number += slagaemoe;
        power--;
    }
    
    //Строка с числом-ответом
    NSString *answerString=[NSString stringWithFormat:@"%d",(int)number];

    return answerString;
}


//Перевод из десятичной системы
NSString* decToOther(float number, int base) {
    
    //Строки для записи ответов
    NSMutableString* final = NSMutableString.string;
    NSMutableString* answer = NSMutableString.string;
    
    //Временные переменные
    int temp, j;
    j = -1;
    int celoe;
    //bool isFloat=false;
    

    celoe=(int)number; //Выделяем целую часть
    
    
    //Дробные числа
        NSString *numStr=[NSString stringWithFormat:@"%g",(int)number];
        //NSString* num = [NSString stringWithFormat:@"%g", myFloat];
        [answer appendString:[NSString stringWithFormat:NSLocalizedString(@"ConvertFrom10int", nil),numStr,base]];


    
    if(celoe<base){
        temp=celoe%base;
        [answer appendFormat:NSLocalizedString(@"AOST", nil), 0, temp];
    }
    
    do {
        
        temp = celoe % base;
        if (temp < 10){
            [final appendFormat:@"%c", 48 + temp];
            NSLog(@"= %d, ост %d", celoe-temp, temp);
        }
        else{
            [final appendFormat:@"%c", 65 + temp - 10];
            NSLog(@"= %d ост %d", celoe-temp, temp);
        }
        
        
        celoe = celoe / base;
        
        
        if(celoe==0){
//            if([answer rangeOfString:NSLocalizedString(@"AOST", nil)].location==NSNotFound){
//
//                    [answer appendFormat:NSLocalizedString(@"AOST", nil), number, temp];
//            }
            break;
        }
        
        [answer appendFormat:NSLocalizedString(@"AOST", nil), celoe, temp];
        //Пока делится с остатком
        if(celoe>=base){
            [answer appendFormat:@"%d:%d=",celoe,base];
        }

    
        
    } while (celoe != 0);

    //Выводим результат перевода
    //[answer appendFormat:NSLocalizedString(@"Answer", nil),reverseString(final)]; //Выводим ОТВЕТ, если нет дроби
    return reverseString(final);

}








@end
