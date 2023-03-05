wbits=5
abits=5
lr=2e-04
wd=0.1
epochs=300
lbd=1e-1
budget=21.455
id=4bit_mixed
batch_size=256
echo "batch_size: ${batch_size}, wbits: ${wbits}, abits: ${abits}, lr: ${lr}, wd: ${wd}, epochs: ${epochs}, lbd: ${lbd}, budget: ${budget}, id: ${id}"
python -m torch.distributed.launch \
--nproc_per_node=2 --use_env main.py \
--model deit_tiny_patch16_224_mix \
--data-path /dataset/ImageNet/Classification \
--batch-size ${batch_size} \
--lr ${lr} \
--min-lr 0 \
--epochs ${epochs} \
--weight-decay ${wd} \
--warmup-epochs 0 \
--wbits ${wbits} \
--abits 5 \
--bitops-scaler ${lbd} \
--budget ${budget} \
--stage-ratio 0.9 \
--dist-eval \
--mixpre \
--head-wise \
--output_dir results/deit_tiny_${id}/${wbits}w${abits}a_bs512_baselr${lr}_wd${wd}_ft${epochs}_lbd${lbd} \
#--finetune results/deit_tiny_float/ckpt/current_checkpoint.pth
