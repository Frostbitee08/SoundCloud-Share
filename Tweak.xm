@interface SCPlayableListItem
-(id)tracklistPlayableItem;;
@end

@interface SCPlayableItem
@property (nonatomic,retain) NSURL* permalinkURL; 
@property (nonatomic,copy) NSString* tracklistTitle;
@end

%hook SCiPhonePlayerContentView

-(void)share:(id)arg1 {
	//Get Settings
	NSMutableDictionary *settings = [NSMutableDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.frostbitee08.scsettings.plist"];
	if ([[settings valueForKey:@"Enabled"] boolValue]) {
		//Grab track
		SCPlayableListItem *listItem = MSHookIvar<SCPlayableListItem *>(self, "_trackListItem");
		SCPlayableItem *track = (SCPlayableItem *)[listItem tracklistPlayableItem];

		//Create and display ActivityView
		id delegate = MSHookIvar<id>(self, "delegate");
	    NSArray *itemsToShare;
	    if ([[settings valueForKey:@"TrackTitle"] boolValue]) {
			itemsToShare = @[track.tracklistTitle, track.permalinkURL];
	    }
	    else {
	    	itemsToShare = @[track.permalinkURL];
	    }

	    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:itemsToShare applicationActivities:nil];
	    activityVC.excludedActivityTypes = @[UIActivityTypePrint, UIActivityTypeAssignToContact, UIActivityTypeSaveToCameraRoll];
	    [delegate presentViewController:activityVC animated:YES completion:nil];
	}
	else {
		%orig;
	}
}

%end