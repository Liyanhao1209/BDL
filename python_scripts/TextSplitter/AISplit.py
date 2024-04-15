import re
import sys

from zhipuai import ZhipuAI


def remove_punctuation(text):
    # 定义一个正则表达式模式，匹配所有标点符号
    punctuation_pattern = r'[^\w\s]'
    # 使用re.sub替换所有匹配到的标点符号为空字符串
    no_punctuation_text = re.sub(punctuation_pattern, '', text)
    return no_punctuation_text


if __name__ == '__main__':
    args = sys.argv
    api_key = args[1]
    original_path = args[2]
    target_path = args[3]

    with open(original_path, "r", encoding="utf-8") as doc:
        content = doc.read()

    while True:
        try:
            client = ZhipuAI(api_key=api_key)
            messages = [{"role": "user",
                         "content": f"你是一名中文的专家。下面给你一段文本，请你将其分词，并去掉标点符号，每个词之间要用一个空格进行分隔：\n{content}"}]
            response = client.chat.completions.create(
                model="glm-4",
                messages=messages,
            )
        except Exception as e:
            print(e)
            continue
        else:
            with open(target_path, "w", encoding='utf-8') as target:
                target.write(response.choices[0].message.content)
            break
