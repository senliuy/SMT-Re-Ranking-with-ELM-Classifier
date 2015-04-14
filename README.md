            ============================================================
            ==   Read this document to get the guideline of the code  ==
            ============================================================
Description: This code is used for Re-ranking in Statistical Machine Translation

Attention: This system doesn't provide BLEU calculation methods, so you need to get BLEU values from outside systems.
    The following will give you guide about how to use our system and get BLEUs from outside

Use Method:
Needed Tools: Matlab, Compiled MOSES or other BLEU calculation methods.

1. Data:
    The Data can be .mat format or text format, you need to select your loading method before you running the code.

2. Data pre-processing

    2.1 After running DataProcessing1, this system will generate some text files(SentenceMatrix.txt and AlignmentedEn.txt).
    If you want to calculate BLEU values, this files can be directly used in MOSES model.

    2.2 And if you want to calculate BLEU values fron online 'asiya', there provide a scirpt('GenerateAsiyaFile.m') to 
    divide text into small pieces(You can set the number of sentences of each file in this script)

    2.3 After get BLEU value (each line contains a BLEU value of your sentence), you should store as name of 'BLEU_Result.txt' 
    and copy it to the system's root directory.
    
    2.4 Then running DataProcessing2 to finish the pre-porcessing. In this step, it generate the files that need by the ELM.

3. ELM training.


    3.1 Running ELM.m to train the Reranking model. In this file, you can modify 'TrainingSentenceNum' to select the number of 
    sentences that you want to train, and the rest of the corpus is used for testing. Pay attention that the TrainingSentenceNum
    must be smaller than the all sentences. You can modify 'NumberofHiddenNeurons' and 'ActiovationFunction' to modify the          detials of the training network.

    3.2 After running ELM.m, it gives training time, testing time, training accuracy and testing accuracy.
    
4. Calculate BLEUs
    Running PostProcessing, you can get the reranked BLUEs and baseline of training and testing BLEUs.
