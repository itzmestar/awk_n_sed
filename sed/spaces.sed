#!/bin/sed -f

# Comments with a #
/#/ { p; d; }
# Comments with //
\%//% { p; d; }

# Single line /* ... */ comments
\%/[*].*[*]/% { p; d; }
# Multi-line /* ... */ comments
\%/[*]%,\%[*]/% { p; d; }

# handle trailing whitespace after a line:
s/\s\+$//g
s/\([^[:space:]]\)[[:space:]]\{2,\}/\1 /g
