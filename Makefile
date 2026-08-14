NAME := oak-sapling-boost
ZIP := $(NAME).zip

.PHONY: build clean

build:
	rm -f $(ZIP)
	zip -r $(ZIP) pack.mcmeta data -x '*.DS_Store'

clean:
	rm -f $(ZIP)
