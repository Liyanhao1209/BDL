import re
import sys

import jieba


def remove_punctuation(text):
    # 定义一个正则表达式模式，匹配所有标点符号
    punctuation_pattern = r'[^\w\s]'
    # 使用re.sub替换所有匹配到的标点符号为空字符串
    no_punctuation_text = re.sub(punctuation_pattern, '', text)
    return no_punctuation_text


if __name__ == '__main__':
    args = sys.argv

    original_path = args[1]
    target_path = args[2]

    # 读取文件内容
    with open(original_path, "r", encoding="utf-8") as doc:
        content = doc.read()
        # 正则表达式过滤标点符号
        content = remove_punctuation(content)

        # 对内容进行分词
    seg_list = jieba.cut(content, cut_all=False)
    seg_words = list(seg_list)  # 将生成器转换为列表

    # 输出分词结果到目标文件
    with open(target_path, "a", encoding='utf-8') as target:
        target.truncate(0)
        for word in seg_words:
            if word != "\n":
                word = word+" "
            target.write(word)

            # 可以在文件末尾添加一个换行符，以便下次写入时内容不会连在一起
    with open(target_path, "a", encoding='utf-8') as target:
        target.write("\n")
