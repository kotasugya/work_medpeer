# 使い方

## アイデア登録
```
curl -X POST -H "Content-Type: application/json" -d '{"body":"test", "category_name":"category1"}' http://localhost:3000/ideas
```

## アイデア取得
- カテゴリー名指定なし
```
curl 'http://localhost:3000/ideas'
```
- カテゴリー名指定あり
```
curl 'http://localhost:3000/ideas?category_name=category1'
```