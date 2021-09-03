//
//  GTNormalTableViewCell.m
//  iOSAppDev
//
//  Created by nigelli on 2021/9/2.
//

#import "GTNormalTableViewCell.h"

@interface GTNormalTableViewCell ()

@property (nonatomic, strong, readwrite) UILabel *titleLabel;
@property (nonatomic, strong, readwrite) UILabel *sourceLabel;
@property (nonatomic, strong, readwrite) UILabel *commentLabel;
@property (nonatomic, strong, readwrite) UILabel *timeLabel;
@property (nonatomic, strong, readwrite) UIImageView *rightImageView;
@property (nonatomic, strong, readwrite) UIButton *deleteButton;

@end

@implementation GTNormalTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:({
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(16, 16, 180, 20)];
            self.titleLabel.font = [UIFont systemFontOfSize:18];
            self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
            self.titleLabel.textColor = [UIColor redColor];
            self.titleLabel;
        })];

        [self.contentView addSubview:({
            self.sourceLabel = [[UILabel alloc] initWithFrame:CGRectMake(16, 36, 50, 20)];
            self.sourceLabel.font = [UIFont systemFontOfSize:15];
            self.sourceLabel.lineBreakMode = NSLineBreakByTruncatingTail;
            self.sourceLabel.textColor = [UIColor magentaColor];
            self.sourceLabel;
        })];

        [self.contentView addSubview:({
            self.commentLabel = [[UILabel alloc] initWithFrame:CGRectZero];
            self.commentLabel.font = [UIFont systemFontOfSize:15];
            self.commentLabel.lineBreakMode = NSLineBreakByTruncatingTail;
            self.commentLabel.textColor = [UIColor greenColor];
            self.commentLabel;
        })];

        [self.contentView addSubview:({
            self.timeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
            self.timeLabel.font = [UIFont systemFontOfSize:15];
            self.timeLabel.lineBreakMode = NSLineBreakByTruncatingTail;
            self.timeLabel.textColor = [UIColor blueColor];
            self.timeLabel;
        })];

        [self.contentView addSubview:({
            self.rightImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
            self.rightImageView.contentMode = UIViewContentModeScaleToFill;
            self.rightImageView.backgroundColor = [UIColor redColor];
            self.rightImageView;
        })];
    }

    return self;
}

- (void)layoutSubviews {
    self.sourceLabel.frame.origin = CGPointMake(16, self.titleLabel.frame.origin.y + self.titleLabel.frame.size.height + 8);

    self.commentLabel.frame = CGRectMake(self.sourceLabel.frame.origin.x + self.sourceLabel.frame.size.width + 8, self.sourceLabel.frame.origin.y, 50, 20);
    self.timeLabel.frame = CGRectMake(self.commentLabel.frame.origin.x + self.commentLabel.frame.size.width + 8, self.commentLabel.frame.origin.y, 50, 20);
    self.rightImageView.frame = CGRectMake(self.frame.origin.x + self.frame.size.width - 16 - 80, 8, 80, 80);
}

- (void)loadData:(NSDictionary *)data {
    self.titleLabel.text = [data objectForKey:@"title"];
    [self.titleLabel sizeToFit];

    self.sourceLabel.text = [data objectForKey:@"source"];
    [self.sourceLabel sizeToFit];

    self.commentLabel.text = [data objectForKey:@"comment"];
    [self.commentLabel sizeToFit];

    self.timeLabel.text = [data objectForKey:@"time"];
    [self.timeLabel sizeToFit];

    self.rightImageView.image = [UIImage imageNamed:[data objectForKey:@"image"]];
}

@end
