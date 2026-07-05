#!/usr/bin/env python
# -*- coding: utf-8 -*-

import json
import sys
import time

from curl_cffi import requests

STRONG_POSITIVE = "STRONG_POSITIVE"
POSITIVE = "POSITIVE"
NEUTRAL = "NEUTRAL"
NEGATIVE = "NEGATIVE"
STRONG_NEGATIVE = "STRONG_NEGATIVE"

POSITIVE_KEYWORD_SCORES = {
    "\u6da8\u505c": 3,
    "\u5927\u6da8": 2,
    "\u9884\u589e": 2,
    "\u9ad8\u589e": 3,
    "\u5927\u589e": 3,
    "\u589e\u957f": 1,
    "\u4e2d\u6807": 2,
    "\u83b7\u6279": 2,
    "\u56de\u8d2d": 2,
    "\u589e\u6301": 2,
    "\u5206\u7ea2": 2,
    "\u7a81\u7834": 2,
    "\u65b0\u9ad8": 3,
    "\u626d\u4e8f": 3,
    "\u7b7e\u7ea6": 2,
    "\u8ba2\u5355": 2,
    "\u5efa\u5382": 1,
    "\u6269\u4ea7": 2,
    "\u5229\u597d": 1,
}

NEGATIVE_KEYWORD_SCORES = {
    "\u8dcc\u505c": 3,
    "\u66b4\u8dcc": 3,
    "\u9884\u4e8f": 2,
    "\u5de8\u4e8f": 3,
    "\u4e0b\u6ed1": 1,
    "\u51cf\u6301": 2,
    "\u4e8f\u635f": 2,
    "\u95ee\u8be2": 1,
    "\u5904\u7f5a": 2,
    "\u7acb\u6848": 3,
    "\u505c\u4ea7": 3,
    "\u65ad\u4f9b": 3,
    "\u98ce\u9669": 1,
    "\u8fdd\u7ea6": 3,
    "\u4e8b\u6545": 2,
    "\u8bc9\u8bbc": 2,
    "\u7206\u96f7": 3,
    "\u5229\u7a7a": 1,
}


def build_headers(symbol: str) -> dict:
    return {
        "accept": "*/*",
        "accept-encoding": "gzip, deflate, br, zstd",
        "accept-language": "zh-CN,zh;q=0.9,en;q=0.8",
        "cache-control": "no-cache",
        "connection": "keep-alive",
        "host": "search-api-web.eastmoney.com",
        "pragma": "no-cache",
        "referer": f"https://so.eastmoney.com/news/s?keyword={symbol}",
        "sec-ch-ua": '"Chromium";v="142", "Google Chrome";v="142", "Not_A Brand";v="99"',
        "sec-ch-ua-mobile": "?0",
        "sec-ch-ua-platform": '"Windows"',
        "sec-fetch-dest": "script",
        "sec-fetch-mode": "no-cors",
        "sec-fetch-site": "same-site",
        "user-agent": (
            "Mozilla/5.0 (Windows NT 10.0; Win64; x64) "
            "AppleWebKit/537.36 (KHTML, like Gecko) "
            "Chrome/142.0.0.0 Safari/537.36"
        ),
    }


def classify_sentiment(title: str, content: str) -> str:
    title_text = title or ""
    full_text = f"{title_text} {title_text} {content or ''}"
    positive_score = sum(
        score for keyword, score in POSITIVE_KEYWORD_SCORES.items() if keyword in full_text
    )
    negative_score = sum(
        score for keyword, score in NEGATIVE_KEYWORD_SCORES.items() if keyword in full_text
    )
    score = positive_score - negative_score
    if score >= 4:
        return STRONG_POSITIVE
    if score >= 1:
        return POSITIVE
    if score <= -4:
        return STRONG_NEGATIVE
    if score <= -1:
        return NEGATIVE
    if positive_score == negative_score == 0 and title_text:
        title_lower = title_text.lower()
        if "up" in title_lower:
            return POSITIVE
        if "down" in title_lower:
            return NEGATIVE
        return NEUTRAL
    return NEUTRAL


def fetch_stock_news(symbol: str, limit: int) -> list:
    url = "https://search-api-web.eastmoney.com/search/jsonp"
    inner_param = {
        "uid": "",
        "keyword": symbol,
        "type": ["cmsArticleWebOld"],
        "client": "web",
        "clientType": "web",
        "clientVersion": "curr",
        "param": {
            "cmsArticleWebOld": {
                "searchScope": "default",
                "sort": "default",
                "pageIndex": 1,
                "pageSize": limit,
                "preTag": "<em>",
                "postTag": "</em>",
            }
        },
    }
    callback = f"jQuery35101792940631092459_{int(time.time() * 1000)}"
    params = {
        "cb": callback,
        "param": json.dumps(inner_param, ensure_ascii=False),
        "_": str(int(time.time() * 1000)),
    }
    response = requests.get(
        url,
        params=params,
        headers=build_headers(symbol),
        timeout=20,
    )
    response.raise_for_status()
    body = response.text.strip()
    if not body.startswith(callback + "(") or not body.endswith(")"):
        raise ValueError("unexpected eastmoney jsonp response")
    payload = json.loads(body[len(callback) + 1 : -1])
    news_list = payload.get("result", {}).get("cmsArticleWebOld", [])
    result = []
    for item in news_list[:limit]:
        code = item.get("code") or ""
        title = item.get("title") or ""
        content = item.get("content") or ""
        result.append(
            {
                "symbol": symbol,
                "title": title,
                "content": content,
                "sourceName": item.get("mediaName") or "",
                "publishTime": item.get("date") or "",
                "newsUrl": (
                    f"http://finance.eastmoney.com/a/{code}.html" if code else ""
                ),
                "sentimentCode": classify_sentiment(title, content),
            }
        )
    return result


def main() -> int:
    if len(sys.argv) < 2:
        print("[]")
        return 0
    symbol = sys.argv[1].strip()
    try:
        limit = int(sys.argv[2]) if len(sys.argv) > 2 else 10
    except ValueError:
        limit = 10
    limit = max(1, min(limit, 20))
    data = fetch_stock_news(symbol, limit)
    print(json.dumps(data, ensure_ascii=False))
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except Exception as exc:
        print(str(exc), file=sys.stderr)
        raise
