#!/usr/bin/env python3
import re
from pathlib import Path

root = Path(__file__).resolve().parents[1]
book = root / 'book'

modified = []

for p in book.rglob('*.typ'):
    text = p.read_text(encoding='utf-8')
    lines = text.splitlines(keepends=True)
    out_lines = []
    in_code = False
    changed = False
    for line in lines:
        if line.strip().startswith('```'):
            in_code = not in_code
            out_lines.append(line)
            continue
        if not in_code:
            # Replace **something** with *something* but avoid changing occurrences like `**` alone
            new_line = re.sub(r"\*\*(.+?)\*\*", r"*\1*", line)
            if new_line != line:
                changed = True
            out_lines.append(new_line)
        else:
            out_lines.append(line)
    if changed:
        p.write_text(''.join(out_lines), encoding='utf-8')
        modified.append(str(p.relative_to(root)))

print('Modified files:')
for m in modified:
    print(m)
print(f'Total modified: {len(modified)}')
