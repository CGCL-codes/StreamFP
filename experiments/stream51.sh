#!/bin/sh

# bash experiments/cifar-100.sh
# experiment settings
DATASET=stream51
N_CLASS=51

# save directory
OUTDIR=outputs/${DATASET}/10-task

# hard coded inputs
GPUID='0'
CONFIG=configs/stream51_prompt.yaml
REPEAT=5
OVERWRITE=1

#MEMORY=0
MEMORYS="102"

SKIP=0
#LIMITS="10 100 150 250"
LIMITS="10"
ATTUNE=1

###############################################################
GPU=0
# process inputs
mkdir -p $OUTDIR
NAMES="streamprompt"
METHODS=$NAME
SELECTIONS=$NAME

for limit in $LIMITS
do
    for name in $NAMES
    do
        export CUDA_VISIBLE_DEVICES=$GPU
        python -u run.py --config $CONFIG --gpuid $GPUID --repeat $REPEAT --overwrite $OVERWRITE \
            --learner_type prompt --learner_name CODAPrompt \
            --prompt_param 100 8 0.0 --log_dir ${OUTDIR}/coda-p\
            --file_name results_log//skip-${SKIP}_limit-${limit}/${DATASET}_${name}.csv\
            --selection_method ${name} --skip_batch $SKIP --traintime_limit ${limit} \
            --mem_size ${MEMORYS} --update_method ${name} \
            --prompt_attune $ATTUNE
    done
done
