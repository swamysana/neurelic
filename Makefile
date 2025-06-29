# Default target: builds the README.md
all: README.md

# Target to create the README.md file
# It depends on guessinggame.sh because it needs to read its line count
README.md: guessinggame.sh
	# Title of the project
	echo "# Guessing Game Project" > README.md
	echo "" >> README.md
	# Overview of the project
	echo "## Project Overview" >> README.md
	echo "This project features a simple guessing game implemented in Bash." >> README.md
	echo "" >> README.md
	# Build Information section
	echo "## Build Information" >> README.md
	# Date and Time when the 'make' command was run
	# `date` command outputs the current date and time
	echo "- **Date and Time of Make Run:** $(shell date)" >> README.md
	# Number of lines of code in the guessinggame.sh script
	# `wc -l` counts lines, `awk '{print $$1}'` extracts just the number
	echo "- **Lines of Code in guessinggame.sh:** $(shell wc -l guessinggame.sh | awk '{print $$1}')" >> README.md
	echo "" >> README.md
	# Instructions on how to run the game
	echo "To run the game, use: \`bash guessinggame.sh\`" >> README.md

# Clean target: removes the generated README.md file
# This is a common target to clean up generated files
clean:
	# `rm -f` removes files without prompting for confirmation
	rm -f README.md
