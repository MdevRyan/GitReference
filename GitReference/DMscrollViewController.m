//
//  DMscrollViewController.m
//  GitReference
//
//  Created by Indie Ner on 5/20/14.
//
//

#import "DMscrollViewController.h"

static NSString * const Command = @"command";
static NSString * const Reference = @"reference";

@interface DMscrollViewController ()

@end

@implementation DMscrollViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
         
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height * 1.5);
    [self.view addSubview:scrollView];
    
    //Main Label
    CGRect mainRect = CGRectMake(0, 0, self.view.frame.size.width, 75);
    UILabel *mainLabel = [[UILabel alloc] initWithFrame:mainRect];
    [mainLabel setText:@"Scroll View"];
    mainLabel.textAlignment = NSTextAlignmentCenter;
    [scrollView addSubview:mainLabel];
    
    //Git Commands
    NSArray *commands = [self gitCommands];
    
    for (int i = 0; i < commands.count; i++) {
        CGRect yRect = CGRectMake(0, i * 75 + 50, self.view.frame.size.width, 70);
        UILabel *commandLabel = [[UILabel alloc] initWithFrame:yRect];
        commandLabel.numberOfLines = 2;
        NSString * textString = [[NSString alloc] init];
        textString = [textString stringByAppendingString:[commands[i] objectForKey:Command]];
        textString = [textString stringByAppendingString:[commands[i] objectForKey:Reference]];
        [commandLabel setText:textString];
        commandLabel.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:commandLabel];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)gitCommands {
    
    return @[@{Command: @"git status", Reference: @": shows changed files"},
             @{Command: @"git diff", Reference: @": shows actual changes"},
             @{Command: @"git add .", Reference: @": adds changed files to the commit"},
             @{Command: @"git commit -m \"notes\"", Reference: @": commits the changes"},
             @{Command: @"git push origin _branch_", Reference: @": pushes commits to branch named _branch_"},
             @{Command: @"git log", Reference: @": displays progress log"},
             @{Command: @"git comment --amend", Reference: @": re-enter last commit message"}
             ];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
