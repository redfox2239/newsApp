//
//  ViewController.swift
//  NewsApp
//
//  Created by 原田　礼朗 on 2016/06/28.
//  Copyright © 2016年 reo harada. All rights reserved.
//

import UIKit

// tableViewを利用する準備その１
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var newsTableView: UITableView!
    // データをDictionaryの配列として用意する
    var data: [[String: String]] = [
        [
            "title": "かわいい猫がいっぱいの”猫カフェ”を経営しよう！『本日開店猫カフェレストラン』 - techjo",
            "url": "http://www.techjo.jp/2016/06/494674/",
        ],
        [
            "title": "私たちの周りにも「涙の匂い」はある。人の“生きづらさ”に気づくということ／『夜廻り猫』深谷かほる氏インタビュー",
            "url": "http://netallica.yahoo.co.jp/news/20160630-95980134-messy",
        ],
        [
            "title": "ねこねこねこわに｜アンジュルム 和田彩花オフィシャルブログ「あや著」Powered by Ameba",
            "url": "http://ameblo.jp/angerme-ayakawada/entry-12175689544.html",
        ],
        [
            "title": "野良猫増加に「脱・殺処分」の一手…大阪・曽根崎で３４匹に一斉不妊手術　被害コリゴリ、平和的共存で招き猫に（1/3ページ） - ...",
            "url": "http://www.sankei.com/west/news/160629/wst1606290110-n1.html",
        ],
        [
            "title": "ネコがあらわれた！　ネコが障子を突き破りこちらの様子を見ている",
            "url": "http://headlines.yahoo.co.jp/hl?a=20160629-00000109-it_nlab-life",
        ],
        [
            "title": "「りんご猫」専門の猫カフェ・ネコリパブリック東京2号店んが中野にオープン",
            "url": "http://headlines.yahoo.co.jp/hl?a=20160629-00000107-it_nlab-life",
        ],
        [
            "title": "「バイクも一緒に乗るの！」おじいちゃんの相棒の猫ちゃん。",
            "url": "http://netallica.yahoo.co.jp/news/20160629-05851373-peco",
        ],
        [
            "title": "かわベーコン氏のにゃっちーずのスタンプを次々コレクション！ぬこが料理を作るクリッカーゲーム",
            "url": "http://games.yahoo.co.jp/news/detail?n=20160629-00000005-appget_g",
        ],
        [
            "title": "松本大洋新連載『ルーヴルの猫』スタートに「恐るべし。細部に神が宿っていた！」と反響続々",
            "url": "http://zasshi.news.yahoo.co.jp/article?a=20160629-00010871-davinci-ent",
        ],
        [
            "title": "【新作】『てのひらにゃんこ』でイヌ派がネコと生活を始めた結果……",
            "url": "http://games.yahoo.co.jp/news/detail?n=20160629-00000025-ygame_famitsuapp_g",
        ],
        [
            "title": "「ねこ的」人づきあいでストレスフリーに生きよう！",
            "url": "http://zasshi.news.yahoo.co.jp/article?a=20160629-00010000-phpfamily-life",
        ],
        [
            "title": "大森靖子がDLEの新キャラ“逃猫ジュレ”で声優初挑戦  |  TV LIFE",
            "url": "http://www.tvlife.jp/2016/06/29/65877",
        ],
        [
            "title": "人気のねこスイーツに、夏の新作登場",
            "url": "http://headlines.yahoo.co.jp/hl?a=20160629-00012661-lmaga-l27",
        ],
        [
            "title": "頼朝公行列、花火、猫おどり…夏祭りPR、ラッピング電車が運行",
            "url": "http://headlines.yahoo.co.jp/hl?a=20160629-00000004-izu-l22",
        ],
        [
            "title": "せか猫の川村元気が手がけた小説「億男」中国で映画化、2017年10月に公開予定",
            "url": "http://headlines.yahoo.co.jp/hl?a=20160629-00000037-nataliee-movi",
        ],
        [
            "title": "クロネコマーク、原案を発見　社員の６歳娘が５９年前に描く　ヤマト運輸 - トピックス | sippo（シッポ） ペットのための情報・...",
            "url": "http://sippolife.jp/article/2016062700012.html",
        ],
        [
            "title": "ご利益あるかも【サ日記】　～宮城県のシロクロ猫さんの写真が届いた　の巻～",
            "url": "http://netallica.yahoo.co.jp/news/20160629-43539013-fffbikia",
        ],
        [
            "title": "猫？アンテナ？SNSで四コマ漫画が連載中の「パラボラあんてにゃん」の3DSテーマが配信開始",
            "url": "http://games.yahoo.co.jp/news/detail?n=20160629-00000084-ygame_gamer",
        ],
        [
            "title": "「ちよ父」「ねこぢる」それとも「十四松」？　「精神を不安定にさせる顔の魚がいた」と『Twitter』で話題に",
            "url": "http://netallica.yahoo.co.jp/news/20160629-23805986-gtsushin",
        ],
        [
            "title": "猫の譲渡イベント【四重奏】 - 大分のニュースなら 大分合同新聞プレミアムオンライン Gate",
            "url": "http://www.oita-press.co.jp/1010000000/2016/06/27/091750293",
        ],
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // tableViewを利用する準備その２
        self.newsTableView.delegate = self
        self.newsTableView.dataSource = self
        
        // カスタムセルを登録する
        // xibファイルを呼び出す
        let xib = UINib(nibName: "NewsTableViewCell", bundle: nil)
        // カスタムセルをtableViewに登録する
        self.newsTableView.registerNib(xib, forCellReuseIdentifier: "NewsTableViewCell")
    }
    
    // tableViewと相談する↓
    // セクションの数どうする？
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // セルの数どうする？
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    // セルの中身どうする？
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // カスタムセルを取得する
        let cell = tableView.dequeueReusableCellWithIdentifier("NewsTableViewCell", forIndexPath: indexPath) as! NewsTableViewCell
        // 部品の設定
        cell.titleLabel.text = self.data[indexPath.row]["title"]
        cell.newsImageView.image = UIImage(named: "\(indexPath.row).png")
        
        return cell
    }
    
    // セルの高さどうする？
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let cell = tableView.dequeueReusableCellWithIdentifier("NewsTableViewCell")
        return (cell?.frame.size.height)!
    }
    
    // セルを選択した時どうする？
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // 次の画面を呼んでくる
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("詳細画面") as! DetailViewController
        // urlをセットする
        vc.url = self.data[indexPath.row]["url"]
        // navigationControllerに画面遷移をお願いする
        self.navigationController?.showViewController(vc, sender: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

