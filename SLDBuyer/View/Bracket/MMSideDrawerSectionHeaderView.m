// Copyright (c) 2013 Mutual Mobile (http://mutualmobile.com/)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "MMSideDrawerSectionHeaderView.h"
#import <QuartzCore/QuartzCore.h>
#import "DLeftHeaderMenu.h"

#define leftMenu_width          150
#define leftMenu_height         35



@implementation MMSideDrawerSectionHeaderView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setClipsToBounds:YES];
    
    UIImage *logoImage = [UIImage imageNamed:@"Bracket_logo.png"];
    CGSize imageSize = logoImage.size;
    CGRect imageRect = CGRectMake((frame.size.width-imageSize.width)/2, (3.3*frame.size.height/4-imageSize.height)/2, imageSize.width, imageSize.height);
    _logoImageView = [[UIImageView alloc]initWithFrame:imageRect];
    _logoImageView.image = logoImage;
    [self addSubview:_logoImageView];
    
    [self addLeftHeaderMenu];
    
    return self;
}

- (void)setLeftMenuDelegate:(id)leftMenuDelegate {
    [_leftHeaderMenu setLeftMenuDelegate:leftMenuDelegate];
}

- (void)removeLeftHeaderMenu {
    [_leftHeaderMenu removeFromSuperview];
}

- (void)addLeftHeaderMenu {
    _leftHeaderMenu = [[DLeftHeaderMenu alloc]initWithFrame:CGRectMake((self.frame.size.width-leftMenu_width)/2, self.frame.size.height-leftMenu_height-15, leftMenu_width, leftMenu_height)];
    [self addSubview:_leftHeaderMenu];
}

@end
