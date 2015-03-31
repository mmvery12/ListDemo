//
//  DemoCell.m
//  ListDemo
//
//  Created by FeiNiu-Mac on 15/3/25.
//  Copyright (c) 2015年 FeiNiu-Mac. All rights reserved.
//

#import "DemoCell.h"
#import "UIImageView+AFNetworking.h"
@interface DemoCell ()
{
    NSMutableArray *_constrainArray;
    
    UIImageView *_imageView;
    UIView *_contentView;
    UIView *_tipView;
    UILabel *_stTitleLabel;
    UILabel *_pgTitleLable;
    UILabel *_titleLabel;
    UILabel *_subTitleLabel;
    UILabel *_priceLabel;
    UIButton *_statsBtn;
    BtnStatus _status;
    CellStyle _style;
}
@end

@implementation DemoCell
@synthesize imageUrl = _imageUrl;
@synthesize title = _title;
@synthesize subTitle = _subTitle;
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [[UIImageView alloc] init];
        _contentView = [[UIView alloc] init];
        _tipView = [[UIView alloc] init];
        _stTitleLabel = [[UILabel alloc] init];
        _pgTitleLable = [[UILabel alloc] init];
        _titleLabel = [[UILabel alloc] init];
        _subTitleLabel = [[UILabel alloc] init];
        _priceLabel = [[UILabel alloc] init];
        _statsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [self addSubview:_imageView];
        [self addSubview:_contentView];
        [_contentView addSubview:_tipView];
        [_tipView addSubview:_stTitleLabel];
        [_tipView addSubview:_pgTitleLable];
        [_contentView addSubview:_titleLabel];
        [_contentView addSubview:_subTitleLabel];
        [_contentView addSubview:_priceLabel];
        [_contentView addSubview:_statsBtn];
        
        _imageView.translatesAutoresizingMaskIntoConstraints =
        _tipView.translatesAutoresizingMaskIntoConstraints =
        _contentView.translatesAutoresizingMaskIntoConstraints =
        _stTitleLabel.translatesAutoresizingMaskIntoConstraints =
        _pgTitleLable.translatesAutoresizingMaskIntoConstraints =
        _titleLabel.translatesAutoresizingMaskIntoConstraints =
        _subTitleLabel.translatesAutoresizingMaskIntoConstraints =
        _priceLabel.translatesAutoresizingMaskIntoConstraints =
        _statsBtn.translatesAutoresizingMaskIntoConstraints = NO;
        
        _titleLabel.numberOfLines = 2;
        
        
        _titleLabel.font =
        _priceLabel.font =
        _subTitleLabel.font = [UIFont systemFontOfSize:12];
        
        _imageView.backgroundColor = [UIColor redColor];
        _tipView.backgroundColor = [UIColor lightGrayColor];
        _stTitleLabel.backgroundColor =
        _pgTitleLable.backgroundColor =
        _titleLabel.backgroundColor = [UIColor blueColor];
        _priceLabel.backgroundColor = [UIColor purpleColor];
        _subTitleLabel.backgroundColor = [UIColor yellowColor];
        _contentView.backgroundColor = [UIColor greenColor];
        _statsBtn.backgroundColor = [UIColor blueColor];
        _constrainArray = [NSMutableArray array];
        
    }
    return self;
}

-(void)removeAllConstraints
{
    [self removeConstraints:self.constraints];
    [_imageView removeConstraints:_imageView.constraints];
    [_contentView removeConstraints:_contentView.constraints];
    [_tipView removeConstraints:_tipView.constraints];
    [_stTitleLabel removeConstraints:_stTitleLabel.constraints];
    [_pgTitleLable removeConstraints:_pgTitleLable.constraints];
    [_titleLabel removeConstraints:_titleLabel.constraints];
    [_subTitleLabel removeConstraints:_subTitleLabel.constraints];
    [_priceLabel removeConstraints:_priceLabel.constraints];
    [_statsBtn removeConstraints:_statsBtn.constraints];
}

-(void)updateConstraints
{
    switch (_style) {
        case CellStyleRows:
            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(5@1000)-[_imageView]-(5@1000)-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_imageView)]];
            
            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(5@1000)-[_contentView]-(5@1000)-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_contentView)]];
            
            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-(5@1000)-[_imageView]-(5@1000)-[_contentView]-(5@1000)-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_imageView,_contentView)]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_imageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_imageView attribute:NSLayoutAttributeHeight multiplier:1 constant:0]];
            
            break;
        case CellStyleColumns:
            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(5@1000)-[_imageView]-(5@1000)-[_contentView]-(5@1000)-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_imageView,_contentView)]];
            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-(5@1000)-[_imageView]-(5@1000)-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_imageView)]];
            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-(5@1000)-[_contentView]-(5@1000)-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_contentView)]];
            [self addConstraint:[NSLayoutConstraint constraintWithItem:_imageView attribute: NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_imageView attribute:NSLayoutAttributeWidth multiplier:1 constant:0]];
            break;
        default:
            break;
    }
    
    [_contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_titleLabel(>=10@1000)]-(5@1000)-[_subTitleLabel(>=10,<=20@1000)]-(5@1000)-[_tipView(>=10@1000)]-(5@1000)-[_priceLabel(>=20@1000)]-(5@1000)-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_titleLabel,_subTitleLabel,_tipView,_priceLabel)]];
    
    [_contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[_titleLabel]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_titleLabel)]];
    
    [_contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[_subTitleLabel]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_subTitleLabel)]];
    
    [_contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[_tipView]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_tipView)]];
    
    [_contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[_priceLabel]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_priceLabel)]];
    
    switch (_status) {
        case BtnStatus0:
            
            [_contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[_priceLabel]-(5@1000)-[_statsBtn(40@1000)]-(0@1000)-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_priceLabel,_statsBtn)]];
            break;
        case BtnStatus1:
            [_contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[_priceLabel]-(5@1000)-[_statsBtn(60@1000)]-(0@1000)-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_priceLabel,_statsBtn)]];
            
            break;
        case BtnStatus2:
            [_contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[_priceLabel]-(5@1000)-[_statsBtn(30@1000)]-(0@1000)-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_priceLabel,_statsBtn)]];
            
            break;
        case BtnStatus3:
            [_contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[_priceLabel]-(5@1000)-[_statsBtn(50@1000)]-(0@1000)-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_priceLabel,_statsBtn)]];
            
            break;
        case BtnStatus4:
            [_contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[_priceLabel]-(5@1000)-[_statsBtn(70@1000)]-(0@1000)-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_priceLabel,_statsBtn)]];
            break;
        default:
            break;
    }
    [_contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_statsBtn(44@1000)]-(0@1000)-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_priceLabel,_statsBtn)]];
    [_contentView addConstraint:[NSLayoutConstraint constraintWithItem:_subTitleLabel attribute:NSLayoutAttributeLeading|NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:_priceLabel attribute:NSLayoutAttributeLeading|NSLayoutAttributeTrailing multiplier:1 constant:0]];
    [_contentView addConstraint:[NSLayoutConstraint constraintWithItem:_tipView attribute:NSLayoutAttributeLeading|NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:_priceLabel attribute:NSLayoutAttributeLeading|NSLayoutAttributeTrailing multiplier:1 constant:0]];
    
    [super updateConstraints];
}

-(void)layoutSubviews
{
    
    [super layoutSubviews];

}

-(void)setImageUrl:(NSString *)imageUrl
{
    [_imageView setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:nil];
}

-(void)setTitle:(NSString *)title
{
    _titleLabel.text = title;
}

-(void)setSubTitle:(NSString *)subTitle
{
    _subTitleLabel.text = subTitle;
}

-(void)setPriceTitle:(NSString *)priceTitle
{
    _priceLabel.text = priceTitle;
}

-(void)currentShow:(BtnStatus)status :(CellStyle)style
{
    _status = status;
    _style = style;
    [self removeAllConstraints];
    [self setNeedsUpdateConstraints];
}

@end


