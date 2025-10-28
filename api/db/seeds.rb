# ユーザー
User.create(name: "管理者", email: "test", rank: 1, status: "1", display_id: '1111', password: "1111", play_style: "receive", offense: rand(1..10), defense: rand(1..10), speed: rand(1..10), stability: rand(1..10), special_skill: "必殺技1", description: "ブラッドハウンドは、敵の位置を特定し、戦術的な優位性を提供する能力を持つキャラクターです。彼の特殊スキルは、敵の足跡を追跡し、周囲の状況を把握することができます。チームプレイにおいて非常に有用であり、敵の動きを予測するための情報を提供します。", role: 2)
User.create(name: "ライフライン", email: "test", rank: 2, status: "1", display_id: '2222', password: "2222", play_style: "attack", offense: rand(1..10), defense: rand(1..10), speed: rand(1..10), stability: rand(1..10), special_skill: "-", description: "ライフラインは、チームのサポート役として非常に重要なキャラクターです。彼女の特殊スキルは、味方を迅速に回復させることができ、戦闘中の生存率を大幅に向上させます。また、彼女はドローンを使用して、遠隔地からの回復やアイテムの提供も可能です。", role: 1)
User.create(name: "オクタン", email: "test", rank: 3, status: "1", display_id: '3333', password: "3333", play_style: "attack", offense: rand(1..10), defense: rand(1..10), speed: rand(1..10), stability: rand(1..10), special_skill: "必殺技3", description: "オクタンは、スピードとアグレッシブなプレイスタイルを持つキャラクターです。彼の特殊スキルは、ジャンプパッドを使用して高い場所に移動したり、敵の攻撃を回避することができます。また、彼は自分自身を傷つけることで一時的にスピードを向上させることも可能です。", role: 1)
User.create(name: "ジブラルタル", email: "test", rank: 4, status: "1", display_id: '4444', password: "4444", play_style: "balance", offense: rand(1..10), defense: rand(1..10), speed: rand(1..10), stability: rand(1..10), special_skill: "必殺技2", description: "ジブラルタルは、強力な防御能力を持つキャラクターで、チームの盾となる存在です。彼の特殊スキルは、シールドを展開して味方を保護し、敵の攻撃から身を守ることができます。また、彼は空爆を呼び寄せることもでき、敵に大ダメージを与えることが可能です。", role: 1)
User.create(name: "よしひこ", email: "test", rank: 5, status: "1", display_id: '5555', password: "5555", play_style: "balance", offense: rand(1..10), defense: rand(1..10), speed: rand(1..10), stability: rand(1..10), special_skill: "-", description: "よしひこは、バランスの取れたプレイスタイルを持つキャラクターで、攻撃と防御の両方に優れています。彼の特殊スキルは、敵の動きを制限することができ、戦術的な優位性を提供します。また、彼はチームメイトをサポートするための回復能力も持っています。", role: 1)
User.create(name: "パス", email: "test", rank: 6, status: "1", display_id: '6666', password: "6666", play_style: "receive", offense: rand(1..10), defense: rand(1..10), speed: rand(1..10), stability: rand(1..10), special_skill: "-", description: "パスは、受け身のプレイスタイルを持つキャラクターで、敵の攻撃を回避しながら戦うことが得意です。彼の特殊スキルは、敵の攻撃を無効化することができ、チームメイトを保護するためのシールドを展開します。また、彼は敵の位置を特定するための情報収集能力も持っています。", role: 1)

# クエスト
Quest.create(name: "脱力クリア", description: "脱力したままオーバーヘッドストロークでクリアをうつ。")
Quest.create(name: "ショートサーブ10連", description: "浮いてないショートサーブを10回連続で成功させる。")
Quest.create(name: "クエスト3", description: "クエスト3の説明")
Quest.create(name: "クエスト4", description: "クエスト4の説明")
Quest.create(name: "クエスト5", description: "クエスト5の説明")
