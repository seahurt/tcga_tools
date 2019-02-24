# tcga-utils
Some tools to handle tcga data and common files


## Json2Tsv
TCGA portal上可以直接下载全部的变异数据，但是结果里面缺少每个变异的病例数，也就无法计算频率，实用价值大打折扣,不过作为一个参考还是可以用的

parseJson.py 可以将tcga portal上下载的变异数据json文件转换成tsv格式

sortByChr.sh 可以将首列是染色体编号，第二列是坐标的tsv文件按染色体编号及坐标排序

tsv2vcf.sh 可以为将tsv格式的变异文件（来自于parseJson和sort_by_chr）转换成标准的vcf格式

如果要将vcf的坐标系从GRCh38转换成hg19或其它的坐标系，可以用CrossMap这个软件,使用pip就可以安装

## AddExonSN
使用gff文件生成染色体上的外显子bed文件，并添加外显子的序号，做为参考
输入一个bed文件，自动添加基因信息及外显子序号，多个外显子用逗号隔开

## TCGA_Mutation_Downloader
通过非官方公开的API获取变异数据，可得到网站上的所有变异相关的信息。但是该方法较慢。

