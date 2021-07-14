//
//  ComposeViewController.m
//  ColLaTeX
//
//  Created by felipeccm on 7/14/21.
//

#import "ComposeViewController.h"
@import Parse;

@interface ComposeViewController () <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *contentLabel;
@property (weak, nonatomic) IBOutlet UIView *buttonView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentViewBottomConstraint;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.contentLabel.delegate = self;
    
    // Bring button to front of view
    [self.view bringSubviewToFront:self.buttonView];
    
    // Configure labels
    self.titleLabel.text = self.document.name;
    self.contentLabel.text = self.document.content;
}

- (IBAction)didTapScreen:(id)sender {
    [self.view endEditing:true];
}


- (void)textViewDidBeginEditing:(UITextView *)textView{
    self.contentViewBottomConstraint.constant += 240;
    [self.contentLabel updateConstraints];
}

- (void)textViewDidEndEditing:(UITextView *)textView{
    self.contentViewBottomConstraint.constant -= 240;
    [self.contentLabel updateConstraints];
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
