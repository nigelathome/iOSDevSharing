//
//  GTNormalTableViewCell.m
//  iOSAppDev
//
//  Created by nigelli on 2021/9/2.
//

#import "GTNormalTableViewCell.h"

@interface GTNormalTableViewCell ()

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
            self.commentLabel = [[UILabel alloc] initWithFrame:CGRectZero];
            self.commentLabel.font = [UIFont systemFontOfSize:18];
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
    self.commentLabel.frame = CGRectMake(16, 16, 180, 20);
    self.timeLabel.frame = CGRectMake(16, self.commentLabel.frame.origin.y + self.commentLabel.frame.size.height + 8, 50, 20);
    self.rightImageView.frame = CGRectMake(self.frame.origin.x + self.frame.size.width - 16 - 80, 8, 80, 80);
}

- (void)loadData:(NSDictionary *)data {
    self.commentLabel.text = [data objectForKey:@"comment"];
    self.timeLabel.text = [data objectForKey:@"time"];
    self.rightImageView.image = [UIImage imageNamed:[data objectForKey:@"image"]];
}

@end
