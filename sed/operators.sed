#!/bin/sed -f

# Comments with a #
/#/ { p; d; }
# Comments with //
\%//% { p; d; }

# Single line /* ... */ comments
\%/[*].*[*]/% { p; d; }
# Multi-line /* ... */ comments
\%/[*]%,\%[*]/% { p; d; }

# handle binary operators:
s/\b\s*[+^%*></=-]\s*\b/ & /g
# handle ==, >=, <=, etc
s/\b\s*!=\s*\b/ != /g
s/\b\s*==\s*\b/ == /g
s/\b\s*<=\s*\b/ <= /g
s/\b\s*>=\s*\b/ >= /g
s/\b\s*&&\s*\b/ \&\& /g
s/\b\s*||\s*\b/ || /g
#handle opening curly braces
s/\([^ ]\){/\1 {/g
