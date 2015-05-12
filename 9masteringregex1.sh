#!/bin/bash

# cat times.file | egrep "[0-9]?[0-9]:[0-9][0-9] (AM|PM)"
# cat times.file | egrep -i "(1[012]|[1-9]):[0-5][0-9] (am|pm)"
cat times.file | egrep -i "(0[0-9]|[0-2][0-3]):[0-5][0-9] (am|pm)"
