import sys

import jieba

if __name__ == '__main__':
    args = sys.argv

    original_path = args[1]
    target_path = args[2]
    with open(original_path, "r") as doc:
        seg_list = jieba.cut(doc, cut_all=False)

    # 输出分词结果
    with open(target_path, "a") as target:
        for i in range(len(seg_list)):
            target.write(seg_list[i] + " ")
