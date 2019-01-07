from random import seed, shuffle
seed()

for dataset in ["a", "b"]:
	files = []
	infile = open("set_" + dataset + ".txt")
	outfile = open("mapping_" + dataset + ".txt", "w")
	randfile = open("random_" + dataset + ".txt", "w")
	lines = infile.readlines()

	for group in ["ke", "ki"]:
		for subject in ["f1", "f2", "m1", "m2"]:

			for i in range(30):
				k = i + 1
				if k < 10:
					suffix = "0" + str(k)
				else:
					suffix = str(k)
				token = group + subject + dataset + "_" + suffix
				files.append((token, lines[i].strip()))
	shuffle(files)
	for token, word in files:
		outfile.write("{},{}\n".format(token, word))
		randfile.write("\t\"{}\" \"|1|2|3|4|5\"\n".format(token))
