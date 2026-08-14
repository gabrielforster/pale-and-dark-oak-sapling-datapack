NAME := pale-oak-saplings
ZIP := $(NAME).zip

.PHONY: build clean

build: $(ZIP)

$(ZIP): pack.mcmeta data
	rm -f $(ZIP)
	zip -r $(ZIP) pack.mcmeta data -x '*.DS_Store'

clean:
	rm -f $(ZIP)
