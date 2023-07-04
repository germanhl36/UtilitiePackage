#!/bin/zsh

xcodebuild archive \            
-scheme Utilities \
-configuration Release \            
-destination 'generic/platform=iOS' \                                   
-archivePath './build/Utilities.framework-iphoneos.xcarchive' \       
SKIP_INSTALL=NO \
BUILD_LIBRARIES_FOR_DISTRIBUTION=YES

xcodebuild archive \            
-scheme Utilities \
-configuration Release \            
-destination 'generic/platform=iOS Simulator' \                         
-archivePath './build/Utilities.framework-iphonesimulator.xcarchive' \
SKIP_INSTALL=NO \
BUILD_LIBRARIES_FOR_DISTRIBUTION=YES


xcodebuild archive \            
-scheme Utilities \
-configuration Release \            
-destination 'generic/platform=macOS,arch=x86_64,variant=Mac Catalyst' \
-archivePath './build/Utilities.framework-catalyst.xcarchive' \
SKIP_INSTALL=NO \
BUILD_LIBRARIES_FOR_DISTRIBUTION=YES




xcodebuild -create-xcframework \
-framework './build/Utilities.framework-iphonesimulator.xcarchive/Products/Library/Frameworks/Utilities.framework' \
-framework './build/Utilities.framework-iphoneos.xcarchive/Products/Library/Frameworks/Utilities.framework' \
-framework './build/Utilities.framework-catalyst.xcarchive/Products/Library/Frameworks/Utilities.framework' \
-output './build/Utilities.xcframework'
