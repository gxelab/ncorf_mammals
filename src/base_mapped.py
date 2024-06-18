import sys
import re

txt_file = re.sub('.*/', '', sys.argv[1])
for line in open(sys.argv[1], 'r'):
    m = re.search('SN\tbases mapped:\t(\d+)', line)
    if m:
        bases_mapped = m.group(1)
    m = re.search('SN\tbases mapped \(cigar\):\t(\d+)', line)
    if m:
        bases_mapped_cigar = m.group(1)
    m = re.search('SN\taverage length:\t(\d+)', line)
    if m:
        average_length = m.group(1)
        break

s = [txt_file, bases_mapped, bases_mapped_cigar, average_length]
print('\t'.join(s))
