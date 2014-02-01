#import <Preferences/Preferences.h>

@interface scsettingsListController: PSListController {
}
@end

@implementation scsettingsListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"scsettings" target:self] retain];
	}
	return _specifiers;
}
@end

// vim:ft=objc
