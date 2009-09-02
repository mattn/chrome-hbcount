ifndef CHROME
ifneq ($(windir),)
CHROME = "$(USERPROFILE)/Local Settings/Application Data/Google/Chrome/Application/chrome.exe"
DEST = "$(shell pwd)\chrome-hbcount"
else
DEST = $(shell pwd)/chrome-hbcount
CHROME = $(shell which google-chrome)
ifeq ($(CHROME),)
CHROME = $(shell which chromium-browser)
endif
ifeq ($(CHROME),)
CHROME = chrome
endif
endif
endif

SRCS = hbcount.gif hbcount.html hbcount.js manifest.json

all : chrome-hbcount.crx

first : $(SRCS)
	-@rm -r $(DEST)
	@mkdir $(DEST)
	@cp $(SRCS) $(DEST)/.
	$(CHROME) --enable-extensions --pack-extension=$(DEST)

chrome-hbcount.crx : $(SRCS)
	-@rm -r $(DEST)
	@mkdir $(DEST)
	@cp $(SRCS) $(DEST)/.
	$(CHROME) --enable-extensions --pack-extension=$(DEST) --pack-extension-key=chrome-hbcount.pem
