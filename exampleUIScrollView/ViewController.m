//
//  ViewController.m
//  exampleUIScrollView
//
//  Created by student on 12/01/2016.
//  Copyright © 2016 dungdang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@end

@implementation ViewController
{
    UIImageView *photo;
    UIToolbar *toolbar;
    UISlider * slider;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120, 30)];
    [label setFont:[UIFont boldSystemFontOfSize:16.0]];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTextColor:[UIColor whiteColor]];
    [label setText:[NSString stringWithFormat:@"2.2f",self.scrollView.]]
    toolbar = [UIToolbar new];
    [toolbar sizeToFit];
    slider = [[UISlider alloc] initWithFrame:CGRectMake(8, 0, self.view.bounds.size.width - 16, 40)];
    slider.minimumValue = 0.1;
    slider.maximumValue = 4.0;
    slider.value= slider.minimumValue;
    
    [slider addTarget:self
               action:@selector(onSliderChange:)
     forControlEvents:UIControlEventValueChanged];
    UIBarButtonItem * barButton = [[UIBarButtonItem alloc] initWithCustomView:slider];
    toolbar.items = @[barButton];
    toolbar.frame = CGRectMake(0, self.view.bounds.size.height-toolbar.bounds.size.height, toolbar.bounds.size.width, toolbar.bounds.size.height);
    [self.view addSubview:toolbar];
    CGRect scrollRect = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height- toolbar.bounds.size.height);
    self.scrollView = [[UIScrollView alloc] initWithFrame:scrollRect];
    photo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Eiffel.jpg"]];
    photo.frame = CGRectMake(0, 20, photo.bounds.size.width, photo.bounds.size.height);
    [self.scrollView addSubview:photo];
    self.scrollView.delegate= self;
    self.scrollView.minimumZoomScale = slider.minimumValue;
    self.scrollView.maximumZoomScale = slider.maximumValue;
    self.scrollView.zoomScale= slider.value;
    [self.view addSubview:self.scrollView];
}
- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return photo;
}
//- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
//    NSLog(@"%2.2f", self.scrollView.zoomScale);
//}
- (void) onSliderChange: (UISlider*) sender{
    [self.scrollView setZoomScale:sender.value animated:true];
}
- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
    slider.value = self.scrollView.zoomScale;
    NSLog(@"%2.2f", self.scrollView.zoomScale);
    
}
@end
