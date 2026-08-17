import re

file_path = r"c:\Users\KwonHyeonjin\Documents\스텔란티스 ai 앱파일\index.html"

with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

# Check if our replacements need to be made
print("Has DT CREW div:", 'joint-sub-crew-rh' in content)
print("Has 발생시간:", '발생시간' in content)
print("Has 시업 전:", '시업 전' in content)
print("Has joint-sub-rh:", 'joint-sub-rh' in content)
print("Has joint-act-start:", 'joint-act-start' in content)
print("Has joint-clean-before:", 'joint-clean-before' in content)

# Find and check the submat section
start = content.find('joint-sub-rh')
if start != -1:
    print("\nSubmat context:")
    print(repr(content[start-200:start+100]))
