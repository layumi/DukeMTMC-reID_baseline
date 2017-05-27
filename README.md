# DukeMTMC-reID_baseline
Here we provide ResNet-50 baseline training code on DukeMTMC-reID Dataset. 
You can download DukeMTMC-reID in https://github.com/layumi/DukeMTMC-reID_baseline.

## Installation
1. Clone this repo
 
	```Shell
	git clone https://github.com/layumi/DukeMTMC-reID_baseline.git
	cd DukeMTMC-reID_baseline
	mkdir data
	```

2. Download the pretrained model. 
	
	**This model is ONLY released for academic use.**
	You can find the pretrained model in [GoogleDriver](https://drive.google.com/open?id=0B0VOCNYh8HeRUHVRaThuRFhMNkU) or [BaiduYun] (http://pan.baidu.com/s/1jIHqSQy). Download and put the files into the `./data`.

	BaiduYun sometime changes the link. If you find the url fail, you can contact me to update it.
	
3. Compile matconvnet 

	You just need to uncomment and modify some lines in `gpu_compile.m` and run it in Matlab. Try it~

	If you fail in compilation, you may refer to http://www.vlfeat.org/matconvnet/install/

## Test 
1. After installation, you can run `test/test_duke.m` to extract the features of images in the gallery and query set. They will store in a .mat file. Then you can use it to do evaluation.

2. Evaluate feature on the DukeMTMC-reID. You can directly use the code in https://github.com/layumi/DukeMTMC-reID_evaluation.


## Train
1. Add your dataset path into `prepare_data.m` and run it. Make sure the code outputs the right image path.

2. Run `train_id_net_duke.m` to have fun.

## Citation
Please cite this paper in your publications if it helps your research:
```
@article{zheng2016discriminatively,
  title={A Discriminatively Learned CNN Embedding for Person Re-identification},
  author={Zheng, Zhedong and Zheng, Liang and Yang, Yi},
  journal={arXiv preprint arXiv:1611.05666},
  year={2016}
}
```
