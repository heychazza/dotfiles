# Install Fonts
alias fontbook="open -b com.apple.FontBook"

op document get n2ix6hndq6vs7krxpm24gb63ae --out-file="fonts/BerkeleyMonoVariable-Regular.ttf"
op document get aceerq3xlrg54j7gsosqbue2bm --out-file="fonts/BerkeleyMonoVariable-Italic.ttf"

fontbook fonts/*.ttf