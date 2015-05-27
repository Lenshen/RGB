//
//  ViewController.m
//  RGB
//
//  Created by 鲍先生 on 15/5/25.
//  Copyright (c) 2015年 鲍先生. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISlider *Rslider;
@property (weak, nonatomic) IBOutlet UISlider *Gslider;
@property (weak, nonatomic) IBOutlet UISlider *Bslider;

@property (weak, nonatomic) UIColor *backgroundColorOfLabel;
@property (weak, nonatomic) IBOutlet UILabel *Rlabel;
@property (weak, nonatomic) IBOutlet UILabel *Glabel;
@property (weak, nonatomic) IBOutlet UILabel *Blabel;
@property (weak, nonatomic) IBOutlet UILabel *ColorLabel;

@end

@implementation ViewController
-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.Rslider  addTarget:self action:@selector(RsliderValueChange:) forControlEvents:UIControlEventValueChanged];
    [self.Gslider  addTarget:self action:@selector(GsliderValueChange:) forControlEvents:UIControlEventValueChanged];
    [self.Bslider  addTarget:self action:@selector(BsliderValueChange:) forControlEvents:UIControlEventValueChanged];
    [self addObserver:self forKeyPath:@"backgroundColorOfLabel" options:NSKeyValueObservingOptionInitial context:nil];
    

    
}
-(void)RsliderValueChange:(UISlider *)sender
{
    UISlider *slider = sender;
    self.backgroundColorOfLabel = [UIColor colorWithRed:slider.value green:self.Gslider.value blue:self.Bslider.value alpha:1];
    self.Rlabel.text = [NSString stringWithFormat:@"%f",slider.value];

}
-(void)GsliderValueChange:(UISlider *)sender
{
    UISlider *slider = sender;
    self.backgroundColorOfLabel = [UIColor colorWithRed:self.Rslider.value green:slider.value blue:self.Bslider.value
                                                  alpha:1];
    self.Rlabel.text = [NSString stringWithFormat:@"%f",slider.value];
    
}
-(void)BsliderValueChange:(UISlider *)sender
{
    UISlider *slider = sender;
    self.backgroundColorOfLabel = [UIColor colorWithRed:1 green:1 blue:slider.value alpha:1];
    self.Rlabel.text = [NSString stringWithFormat:@"%f",slider.value];
    
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"backgroundColorOfLabel"]) {
        self.ColorLabel.backgroundColor = self.backgroundColorOfLabel;
        self.Rlabel.textColor = self.backgroundColorOfLabel;
        self.Glabel.textColor = self.backgroundColorOfLabel;
        self.Blabel.textColor = self.backgroundColorOfLabel;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}

@end







//- (void)dealloc{
//    [self.backgroundColorOfLabel removeObserver:self forKeyPath:@"backgroundColorOfLabel"];
//}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    if([segue.identifier isEqualToString:@"changeFrame"]){
//        [[segue destinationViewController] setColorLabelBackgroundColor:self.backgroundColorOfLabel];
//    }
//}


