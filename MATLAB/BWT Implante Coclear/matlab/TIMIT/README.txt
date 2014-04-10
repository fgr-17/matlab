
The CMU/CSTR kdt US English TIMIT database for speech synthesis

                Carnegie Mellon University and
                     Edinburgh University
                     Copyright 1997-2002
                     All rights reserved

This directory contains a recordings of a US English speaker 
delivering the 452 "TIMIT" phonetically rich set of utterances.

The waveform files were collected at University of Edinburgh's Center
for Speech Technology and are distributed under their Copyright.

The TIMIT prompts are probabaly copyright of Texas Instruments and MIT
(though I've been unable to confirm that).  Although recordings of
these prompts as distributed in the speech recognition "TIMIT"
database by LDC (http://www.ldc.upenn.edu/), its not clear if the
prompts themselves are free for other uses.  There for this work
should be considered for research use only and databases that record
these prompts probably can't be used commercially.  I have tried to
find out from various people but can't get a definitely answer.

The lab.hand/ directory contains hand specified phonemes, and
festival/utts.hand/ contain utterances created from these hand
specified labels, by a process that no longer exists.  The aligned of
lexical entries, speaker-specific pronunciations is hard unless it is
origianlyl designed to keep alignment.  Synthesizers built from the
utts.hand are better than those built by the fully automatic process,
but it would be difficult to improve the utts.hand/ utterances without
approrpiate tools.

The directory structure is 
 bin/
     basic scripts for building prompts, labelling feature files etc.
 cep/
     
 etc/
     prompt file, and some labelling templates 
 festival/
     utterances, and clunits catalogue file
 festvox/
     scheme voice definition files (used at run-time)
 lab/
     for autolabelled phone labels
 lab.hand/
     hand specified phone labels
 lar/
     recorded EGG signal files
 mcep/
     MFCC (Mel Frequency Cepstrum Coefficients) for clustering and join costs
 pm/
     Pitchmark files as extract from waveforms (or EGG signal)
 pm_lab/
     derived pitchmark labeled files from pm/ enabling emulabel (and others
     display programs) to show the pitchmarks and waveform files.
 prompt-cep/
     cepstrum files for prompt files in autolabelling
 prompt-lab/
     label files for synthesized prompts 
 prompt-wav/
     waveforms of synthesized prompts
 wav/
     recorded spoken nonsense words (in Microsoft riff (wav) format).
     If you are using Xwaves you should convert these to NIST format






