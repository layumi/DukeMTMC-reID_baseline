# DukeMTMC-reID_baseline
Here we provide  ResNet-50 baseline training code on DukeMTMC-reID.

## Download pretrained model


## Test 
1. Run `test/test_duke.m` to extract the features of images in the gallery and query set. They will store in a .mat file. Then you can use it to do evaluation.

2. Evaluate feature on the DukeMTMC-reID. You can directly use the code in https://github.com/layumi/DukeMTMC-reID_evaluation.


## Train
1. Add your dataset path into `prepare_data.m` and run it. Make sure the code outputs the right image path.

2. Run `train_id_net_duke.m` to have fun.
