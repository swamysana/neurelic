# Rule to create or update README.md
# It depends on guessinggame.sh to get its line count
README.md: guessinggame.sh
	# Start with the main project title
	echo "# Guessing Game Project" > README.md
	echo "" >> README.md  # Add a blank line for Markdown readability

	# Add a section for build information
	echo "## Build Information" >> README.md
	# Include the date and time when 'make' was run
	# $(shell date) executes the 'date' command and captures its output
	echo "- **Generated On:** $(shell date)" >> README.md
	# Include the number of lines in the guessinggame.sh script
	# `wc -l < guessinggame.sh` counts lines from the file via stdin, outputting just the number
	echo "- **Lines of Code (guessinggame.sh):** $(shell wc -l < guessinggame.sh)" >> README.md
	echo "" >> README.md # Add another blank line
