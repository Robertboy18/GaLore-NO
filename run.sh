CUDA_VISIBLE_DEVICES=0 torchrun --standalone --nproc_per_node 1 torchrun_main.py \
    --model_config configs/llama_60m.json \
    --lr 0.01 \
    --galore_scale 0.25 \
    --rank 128 \
    --update_proj_gap 200 \
    --batch_size 256 \
    --total_batch_size 512 \
    --num_training_steps 1000 \
    --warmup_steps 100 \
    --weight_decay 0 \
    --dtype bfloat16 \
    --eval_every 100 \
    --optimizer galore_adamw \
    --min_lr_ratio 0.01 \
& CUDA_VISIBLE_DEVICES=1 torchrun --standalone --nproc_per_node 1 torchrun_main.py \
    --model_config configs/llama_60m.json \
    --lr 0.01 \
    --galore_scale 0.25 \
    --rank 256 \
    --update_proj_gap 200 \
    --batch_size 256 \
    --total_batch_size 512 \
    --num_training_steps 1000 \
    --warmup_steps 100 \
    --weight_decay 0 \
    --dtype bfloat16 \
    --eval_every 100 \
    --optimizer galore_adamw \
    --min_lr_ratio 0.001 \
& CUDA_VISIBLE_DEVICES=2 torchrun --standalone --nproc_per_node 1 torchrun_main.py \
    --model_config configs/llama_60m.json \
    --lr 0.001 \
    --galore_scale 0.25 \
    --rank 256 \
    --update_proj_gap 200 \
    --batch_size 256 \
    --total_batch_size 512 \
    --num_training_steps 1000 \
    --warmup_steps 100 \
    --weight_decay 0 \
    --dtype bfloat16 \
    --eval_every 100 \
    --optimizer galore_adamw \
    --min_lr_ratio 0.001
