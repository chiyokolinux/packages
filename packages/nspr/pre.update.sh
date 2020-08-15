 #!/bin/bash
cd nspr
sed -ri 's#^(RELEASE_BINS =).*#\1#' pr/src/misc/Makefile.in
sed -i 's#$(LIBRARY) ##'            config/rules.mk  
