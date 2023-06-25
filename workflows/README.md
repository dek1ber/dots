# VM Workflows

This is a personalized set of bootstrap scripts designed to let me quickly set up a VM environment. To run this project, all you have to do is:

I currently have 5 different "workflows" set up:
- Debian-based penetration testing workflow with extensive github projects + preferred packages 
- Debian-based penetration testing workflow with preferred packages 
- Ubuntu-based development workflow with preferred packages (both apt and pip) + personal dotfiles 
- Fedora-based development workflow with preferred packages (both dnf and pip) + personal dotfiles 
- BSD-based development workflow with preferred packages + personal dotfiles 

## BE CAREFUL 
The full pentest workflow (option 1) will take a while to do (due to the number of github repos), AND will overwrite data in your /opt/tools directory!!!

ALSO this script is meant to clean up the home directory! Meaning that all of the standard XDG home directories except for ~/Downloads will be deleted!

Credits:
- https://github.com/madmantm/pentest-tools/blob/master/install-pentest-tools.sh (plus all repos listed)
