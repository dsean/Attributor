//
//  TextStatesViewController.m
//  Attributor
//
//  Created by 楊 德忻 on 2014/6/25.
//  Copyright (c) 2014年 楊 德忻. All rights reserved.
//

#import "TextStatesViewController.h"

@interface TextStatesViewController ()
@property (weak, nonatomic) IBOutlet UILabel *colorfulCharatersLabel;
@property (weak, nonatomic) IBOutlet UILabel *outlinedCharatersLabel;

@end

@implementation TextStatesViewController



- (void)setTextToAnalyze:(NSAttributedString *)textToAnalyze {
    _textToAnalyze = textToAnalyze;
    if (self.view.window) {
        [self upDateUI];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self upDateUI];
}

- (NSAttributedString *)charactersWithAttribute:(NSString *)attributeName {
    NSMutableAttributedString *characters = [[NSMutableAttributedString alloc] init];
    
    int index =0;
    while (index < [self.textToAnalyze length]) {
        NSRange range;
        id value = [self.textToAnalyze attribute:attributeName atIndex:index effectiveRange:&range];
        if (value) {
            [characters appendAttributedString:[self.textToAnalyze attributedSubstringFromRange:range]];
            NSUInteger index = range.location + range.length;
        }
        else {
            index ++;
        }
    }
    return characters;
}

- (void)upDateUI {
    self.colorfulCharatersLabel.text = [NSString stringWithFormat:@"%d colorful characters", [[self charactersWithAttribute:NSForegroundColorAttributeName] length]];
     self.outlinedCharatersLabel.text = [NSString stringWithFormat:@"%d outlined characters", [[self charactersWithAttribute:NSStrokeWidthAttributeName] length]];
}
@end
