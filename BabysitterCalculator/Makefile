.DEFAULT_GOAL := default

XCODEBUILD := xcodebuild
BUILD_LOGS = build_logs
BUILD_FLAGS = -project $(PROJECT) -scheme $(SCHEME) -destination $(DESTINATION) -configuration $(CONFIGURATION)
CONFIGURATION = Debug

PROJECT = BabysitterCalculator.xcodeproj
SCHEME ?= BabysitterCalculator
DESTINATION ?= 'platform=OS X,arch=x86_64'

#################################
# xcpretty Output Configuration #
#################################

XCPRETTY :=
ifneq ($(BUILD_LOGS),)
	XCPRETTY += | tee $(BUILD_LOGS)/xcode_raw_$(SCHEME).log
endif
ifneq ($(shell type -p xcpretty),)
	XCPRETTY += | xcpretty -c && exit $${PIPESTATUS[0]}
endif

clean:
	if [ -d "$(BUILD_LOGS)" ]; then rm -Rf $(BUILD_LOGS); fi
	mkdir -p $(BUILD_LOGS)
	$(XCODEBUILD) clean $(BUILD_FLAGS) $(XCPRETTY)

build: clean
	$(XCODEBUILD) build $(BUILD_FLAGS) $(XCPRETTY)
	swift build

test: clean
	$(XCODEBUILD) test $(BUILD_FLAGS) $(XCPRETTY)

default: build 
