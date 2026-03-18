#!/usr/bin/env fish
# Register AWS secret patterns with git-secrets
git-secrets --register-aws 2>/dev/null; or true
