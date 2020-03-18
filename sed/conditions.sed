#!/bin/sed -f

# Comments with a #
/#/ { p; d; }
# Comments with //
\%//% { p; d; }

# Single line /* ... */ comments
\%/[*].*[*]/% { p; d; }
# Multi-line /* ... */ comments
\%/[*]%,\%[*]/% { p; d; }
# handle whitespace immediately inside of either the opening or closing
s/(\s\+/(/g
s/\s\+)/)/g
# handle parenthetical condition should not possess any whitespace preceding
s/if\s\+(/if(/g
s/while\s+(/while(/g
