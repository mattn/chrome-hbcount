ifndef CHROME
ifneq ($(windir),)

# Windows
DEST = "$(shell pwd)\chrome-hbcount"
CHROME = "$(USERPROFILE)/Local Settings/Application Data/Google/Chrome/Application/chrome.exe"

else

# Other Platform: Linux? Mac?
DEST = $(shell pwd)/chrome-hbcount

CHROME = $(shell which crxmake)
ifeq ($(CHROME),)
CHROME = $(shell which google-chrome)
endif
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
	@-rm -r $(DEST)
	@mkdir $(DEST)
	@cp $(SRCS) $(DEST)/.
	$(CHROME) --pack-extension=$(DEST)

chrome-hbcount.crx : $(SRCS)
	@-rm -r $(DEST)
	@mkdir $(DEST)
	@cp $(SRCS) $(DEST)/.
	$(CHROME) --pack-extension=$(DEST) --pack-extension-key=chrome-hbcount.pem

clean:
	-@rm *.crx
	-@rm -r $(DEST)
