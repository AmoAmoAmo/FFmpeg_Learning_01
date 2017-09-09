//
//  ViewController.m
//  FFmpegStudying_01
//
//  Created by Josie on 2017/9/8.
//  Copyright © 2017年 Josie. All rights reserved.
//

#import "ViewController.h"

#define DocumentDir [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]
#define BundlePath(res) [[NSBundle mainBundle] pathForResource:res ofType:nil]
#define DocumentPath(res) [DocumentDir stringByAppendingPathComponent:res]


extern int ffmpeg_main(int argc, char * argv[]);


@interface ViewController ()

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}
- (IBAction)ClickFrameBtn:(UIButton *)sender {
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        char *movie = (char *)[BundlePath(@"shake it off.mp4") UTF8String];
        char *outPic = (char *)[DocumentPath(@"%05d.jpg") UTF8String]; //
        printf("-------- DocumentPath = %s\n",outPic); // 沙盒目录
        char* a[] = {
            "ffmpeg",
            "-i",
            movie,
            "-r",
            "10",
            outPic
        };
        ffmpeg_main(sizeof(a)/sizeof(*a), a);
    });
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
