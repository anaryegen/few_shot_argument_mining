import numpy as np

def compute(dir):
	f = open(dir)
	f1_claim = []
	f1_premise = []
	f1_macro = []
	f1_micro = []
	for l in f:
		if l.startswith(' Claim_f1'):
		#if l.startswith('eval_f1_macro'):
			#_, v = l.split(' = ')
			_, v = l.split(': ')
			f1_claim.append(float(v[:-2]))
		elif l.startswith(' Premise_f1'):
	#if l.startswith('eval_f1_macro'):
		#_, v = l.split(' = ')
			_, v = l.split(': ')
			f1_premise.append(float(v[:-2]))
		elif l.startswith(' overall_f1'):
	#if l.startswith('eval_f1_macro'):
		#_, v = l.split(' = ')
			_, v = l.split(': ')
			f1_micro.append(float(v[:-2]))

	for c, p in zip(f1_claim, f1_premise):
		macro_avg = (c+p) / 2
		f1_macro.append(macro_avg)
		
	print("F1_Micro: {}".format(f1_micro))
	print("F1_Micro avg: {}, F1_Micro std: {}".format(np.mean(f1_micro), np.std(f1_micro)))
	print('\n')
	print("F1_Macro: {}".format(f1_macro))
	print("F1_Macro avg: {}, F1_Macro std: {}".format(np.mean(f1_macro), np.std(f1_macro)))
	print('\n')
	print("F1_Claim: {}".format(f1_claim))
	print("F1_Claim avg: {}, F1_Claim std: {}".format(np.mean(f1_claim), np.std(f1_claim)))
	print('\n')
	print("F1_Premise: {}".format(f1_premise))
	print("F1_Premise avg: {}, F1_Premise std: {}".format(np.mean(f1_premise), np.std(f1_premise)))
 	
	return
for i in [5,10,20,50]:
        print("abstrct_es_gl_deberta/{}%-test/eval_results.txt".format(i))
        compute("abstrct_es_gl_deberta/{}%-test/eval_results.txt".format(i))
        print('\n')
	#compute('output/abstrct_fewshot_fr/{}%/eval_results.txt'.format(i))
	#compute('output/conll_mmcv2/{}shot/eval_results.txt'.format(i))
