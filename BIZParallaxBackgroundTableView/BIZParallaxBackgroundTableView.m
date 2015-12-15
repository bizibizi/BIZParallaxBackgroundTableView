//
//  BIZParallaxBackgroundTableView.m
//  BIZParallaxBackgroundTableView.m
//
//  Created by IgorBizi@mail.ru on 5/9/15.
//  Copyright (c) 2015 IgorBizi@mail.ru. All rights reserved.
//

#import "BIZParallaxBackgroundTableView.h"


#define kScreenHeight [UIScreen mainScreen].bounds.size.height


@interface BIZParallaxBackgroundTableView () <UITableViewDelegate>
@property (nonatomic) CGFloat scrollViewOffsetY;
@property (strong, nonatomic) UIImageView *rootImageView;
@property (nonatomic, strong) UIImage *parallaxImage;
@end


@implementation BIZParallaxBackgroundTableView


- (void)setParallaxBackgroundImage:(UIImage *)image delegate:(id<UITableViewDelegate>)delegate
{
    _parallaxImage = image;
    _parallaxDelegate = delegate;
    [self setup];
}

- (void)setup
{
    self.backgroundView = [[UIView alloc] init];
    self.rootImageView = [[UIImageView alloc] initWithFrame:self.bounds];
    self.rootImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self.backgroundView addSubview:self.rootImageView];
    
    self.parallaxScrollSpeed = kParallaxScrollSpeedNormal;
    
    for (int i = 0; i < 2; i ++)
    {
        [self appendImageView];
    }
    
    self.delegate = self;
}

- (void)appendImageView
{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:self.parallaxImage];
    CGFloat x = 0;
    CGFloat y = -self.parallaxImage.size.height/2 + self.rootImageView.subviews.count * self.parallaxImage.size.height;
    CGFloat w = self.bounds.size.width;
    CGFloat h = self.parallaxImage.size.height;
    imageView.frame = CGRectMake(x, y, w, h);
    [self.rootImageView addSubview:imageView];
}

- (void)removeParallax
{
    [self.backgroundView removeFromSuperview];
    self.backgroundView = nil;
    [self setNeedsLayout];
    [self layoutIfNeeded];
}


#pragma mark - UIScrollViewDelegate


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.scrollViewOffsetY = scrollView.contentOffset.y;
    [self updateParallexOffset];
}

- (void)updateParallexOffset
{
    CGRect frame = self.rootImageView.frame;
    frame.origin.y = -self.scrollViewOffsetY / self.parallaxScrollSpeed;
    CGFloat lastImageViewOffsetY = (self.rootImageView.subviews.count - 1) * self.parallaxImage.size.height;
    BOOL needToAddImageView = (self.scrollViewOffsetY > lastImageViewOffsetY - kScreenHeight) ? YES : NO;
    if (needToAddImageView) {
        [self appendImageView];
    }
    
    [UIView animateWithDuration:0.075 animations:^{
        self.rootImageView.frame = frame;;
    }];
}


#pragma mark - UITableViewDelegate


- (void)tableView:(UITableView *)tableView willDisplayCell:(nonnull UITableViewCell *)cell forRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    cell.backgroundColor = self.overlayColor ? self.overlayColor : [UIColor clearColor];
    
    if ([self.parallaxDelegate respondsToSelector:@selector(tableView:willDisplayCell:forRowAtIndexPath:)]) {
        [self.parallaxDelegate tableView:tableView willDisplayCell:cell forRowAtIndexPath:indexPath];
    }
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    if ([self.parallaxDelegate respondsToSelector:@selector(tableView:willDisplayHeaderView:forSection:)])  {
        [self.parallaxDelegate tableView:tableView willDisplayHeaderView:view forSection:section];
    }
}

- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section
{
    if ([self.parallaxDelegate respondsToSelector:@selector(tableView:willDisplayFooterView:forSection:)])  {
        [self.parallaxDelegate tableView:tableView willDisplayFooterView:view forSection:section];
    }
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath
{
    if ([self.parallaxDelegate respondsToSelector:@selector(tableView:didEndDisplayingCell:forRowAtIndexPath:)])  {
        [self.parallaxDelegate tableView:tableView didEndDisplayingCell:cell forRowAtIndexPath:indexPath];
    }
}

- (void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section
{
    if ([self.parallaxDelegate respondsToSelector:@selector(tableView:didEndDisplayingHeaderView:forSection:)])  {
        [self.parallaxDelegate tableView:tableView didEndDisplayingHeaderView:view forSection:section];
    }
}

- (void)tableView:(UITableView *)tableView didEndDisplayingFooterView:(UIView *)view forSection:(NSInteger)section
{
    if ([self.parallaxDelegate respondsToSelector:@selector(tableView:didEndDisplayingFooterView:forSection:)])  {
        [self.parallaxDelegate tableView:tableView didEndDisplayingFooterView:view forSection:section];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.parallaxDelegate respondsToSelector:@selector(tableView:heightForRowAtIndexPath:)])  {
        return [self.parallaxDelegate tableView:tableView heightForRowAtIndexPath:indexPath];
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if ([self.parallaxDelegate respondsToSelector:@selector(tableView:heightForHeaderInSection:)]) {
        [self.parallaxDelegate tableView:tableView heightForHeaderInSection:section];
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if ([self.parallaxDelegate respondsToSelector:@selector(tableView:heightForFooterInSection:)]) {
        [self.parallaxDelegate tableView:tableView heightForFooterInSection:section];
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.parallaxDelegate respondsToSelector:@selector(tableView:estimatedHeightForRowAtIndexPath:)]) {
        [self.parallaxDelegate tableView:tableView estimatedHeightForRowAtIndexPath:indexPath];
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section
{
    if ([self.parallaxDelegate respondsToSelector:@selector(tableView:estimatedHeightForHeaderInSection:)]) {
        [self.parallaxDelegate tableView:tableView estimatedHeightForHeaderInSection:section];
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section
{
    if ([self.parallaxDelegate respondsToSelector:@selector(tableView:estimatedHeightForFooterInSection:)]) {
        [self.parallaxDelegate tableView:tableView estimatedHeightForFooterInSection:section];
    }
    return 0;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if ([self.parallaxDelegate respondsToSelector:@selector(tableView:viewForHeaderInSection:)]) {
        return [self.parallaxDelegate tableView:tableView viewForHeaderInSection:section];
    }
    return nil;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if ([self.parallaxDelegate respondsToSelector:@selector(tableView:viewForFooterInSection:)]) {
        return [self.parallaxDelegate tableView:tableView viewForFooterInSection:section];
    }
    return nil;
}

- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath
{
    if ([self.parallaxDelegate respondsToSelector:@selector(tableView:accessoryTypeForRowWithIndexPath:)]) {
        return [self.parallaxDelegate tableView:tableView accessoryTypeForRowWithIndexPath:indexPath];
    }
    return UITableViewCellAccessoryNone;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    if ([self.parallaxDelegate respondsToSelector:@selector(tableView:accessoryButtonTappedForRowWithIndexPath:)]) {
        [self.parallaxDelegate tableView:tableView accessoryButtonTappedForRowWithIndexPath:indexPath];
    }
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.parallaxDelegate respondsToSelector:@selector(tableView:shouldHighlightRowAtIndexPath:)]) {
        return [self.parallaxDelegate tableView:tableView shouldHighlightRowAtIndexPath:indexPath];
    }
    return NO;
}

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.parallaxDelegate respondsToSelector:@selector(tableView:didHighlightRowAtIndexPath:)]) {
        [self.parallaxDelegate tableView:tableView didHighlightRowAtIndexPath:indexPath];
    }
}

- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.parallaxDelegate respondsToSelector:@selector(tableView:didUnhighlightRowAtIndexPath:)]) {
        [self.parallaxDelegate tableView:tableView didUnhighlightRowAtIndexPath:indexPath];
    }
}

- (nullable NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.parallaxDelegate respondsToSelector:@selector(tableView:willSelectRowAtIndexPath:)]) {
        return [self.parallaxDelegate tableView:tableView willSelectRowAtIndexPath:indexPath];
    }
    return nil;
}

- (nullable NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.parallaxDelegate respondsToSelector:@selector(tableView:willDeselectRowAtIndexPath:)]) {
        return [self.parallaxDelegate tableView:tableView willDeselectRowAtIndexPath:indexPath];
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.parallaxDelegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
        [self.parallaxDelegate tableView:tableView didSelectRowAtIndexPath:indexPath];
    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.parallaxDelegate respondsToSelector:@selector(tableView:didDeselectRowAtIndexPath:)]) {
        [self.parallaxDelegate tableView:tableView didDeselectRowAtIndexPath:indexPath];
    }
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.parallaxDelegate respondsToSelector:@selector(tableView:editingStyleForRowAtIndexPath:)]) {
        return [self.parallaxDelegate tableView:tableView editingStyleForRowAtIndexPath:indexPath];
    }
    return UITableViewCellEditingStyleNone;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(3_0)
{
    if ([self.parallaxDelegate respondsToSelector:@selector(tableView:titleForDeleteConfirmationButtonForRowAtIndexPath:)]) {
        return [self.parallaxDelegate tableView:tableView titleForDeleteConfirmationButtonForRowAtIndexPath:indexPath];
    }
    return nil;
}

- (nullable NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.parallaxDelegate respondsToSelector:@selector(tableView:editActionsForRowAtIndexPath:)]) {
        return [self.parallaxDelegate tableView:tableView editActionsForRowAtIndexPath:indexPath];
    }
    return nil;
}

- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.parallaxDelegate respondsToSelector:@selector(tableView:shouldIndentWhileEditingRowAtIndexPath:)]) {
        return [self.parallaxDelegate tableView:tableView shouldIndentWhileEditingRowAtIndexPath:indexPath];
    }
    return NO;
}

- (void)tableView:(UITableView*)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.parallaxDelegate respondsToSelector:@selector(tableView:willBeginEditingRowAtIndexPath:)]) {
        [self.parallaxDelegate tableView:tableView willBeginEditingRowAtIndexPath:indexPath];
    }
}

- (void)tableView:(UITableView*)tableView didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.parallaxDelegate respondsToSelector:@selector(tableView:didEndEditingRowAtIndexPath:)]) {
        [self.parallaxDelegate tableView:tableView didEndEditingRowAtIndexPath:indexPath];
    }
}

- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
{
    if ([self.parallaxDelegate respondsToSelector:@selector(tableView:targetIndexPathForMoveFromRowAtIndexPath:toProposedIndexPath:)]) {
        return [self.parallaxDelegate tableView:tableView targetIndexPathForMoveFromRowAtIndexPath:sourceIndexPath toProposedIndexPath:proposedDestinationIndexPath];
    }
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.parallaxDelegate respondsToSelector:@selector(tableView:indentationLevelForRowAtIndexPath:)]) {
        return [self.parallaxDelegate tableView:tableView indentationLevelForRowAtIndexPath:indexPath];
    }
    return 0;
}

- (BOOL)tableView:(UITableView *)tableView shouldShowMenuForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.parallaxDelegate respondsToSelector:@selector(tableView:shouldShowMenuForRowAtIndexPath:)]) {
        return [self.parallaxDelegate tableView:tableView shouldShowMenuForRowAtIndexPath:indexPath];
    }
    return NO;
}

- (BOOL)tableView:(UITableView *)tableView canPerformAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(nullable id)sender
{
    if ([self.parallaxDelegate respondsToSelector:@selector(tableView:canPerformAction:forRowAtIndexPath:withSender:)]) {
       return [self.parallaxDelegate tableView:tableView canPerformAction:action forRowAtIndexPath:indexPath withSender:sender];
    }
    return NO;
}

- (void)tableView:(UITableView *)tableView performAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(nullable id)sender
{
    if ([self.parallaxDelegate respondsToSelector:@selector(tableView:performAction:forRowAtIndexPath:withSender:)]) {
        [self.parallaxDelegate tableView:tableView performAction:action forRowAtIndexPath:indexPath withSender:sender];
    }
}



@end
