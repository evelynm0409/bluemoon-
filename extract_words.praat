# Title: extract_words.praat
# Purpose: extract labeled words from a single sound file
# This script assumes that only one sound file is selected

form Extract words
	positive Tier 1
endform

tgd = selected("TextGrid", 1)
prefix$ = selected$("TextGrid", 1)
snd = selected("Sound", 1)
#createDirectory: output_dir$
output_dir$ = chooseDirectory$: "Select the stimuli directory"

select tgd
nint = Get number of intervals... tier

for i from 1 to nint
	label'i'$ = Get label of interval... tier i
	start'i' = Get start point... tier i
	end'i' = Get end point... tier i
endfor

plus snd
count = 0

View & Edit

padding = 0.5

for i from 1 to nint
	label$ = label'i'$
	start = start'i' - padding
	end = end'i' + padding

	if label$ != ""
		count = count + 1
		number$ = string$(count)
		if count < 10
			number$ = "0" + number$
		endif

		label$ = prefix$ + "_" + number$ + ".wav"

		editor TextGrid 'prefix$'
			Move cursor to: start
			Select: start, end
			Save selected sound as WAV file: output_dir$ + "/" + label$
		endeditor
	endif
endfor

pauseScript: "Done!"
