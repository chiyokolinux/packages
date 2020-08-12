 #!/bin/bash
sed -i 's/\(__atomic_compare_exchange\)/\1_db/' src/dbinc/atomic.h
