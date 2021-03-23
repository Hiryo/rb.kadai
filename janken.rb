# プレイヤー(自分)に「0 ~ 2」を入力させるロジックを書きます。
class Player
  def hand
#     # 「プレイヤーに 0 ~ 2を入力させる文章」を表示させます。
    puts "数字を入力してください。"
    puts "0:グー, 1:チョキ, 2:パー"
    # 変数「input_hand」にプレイヤーが入力したものを取得して代入します。
      # ヒント! 「getsメソッド」を使用します。
     input_hand = gets.chomp
     while true
       if input_hand == "0" || input_hand == "1" || input_hand == "2"
         return input_hand
       else
         puts "もう一度数字を入力してください。"
         puts "0:グー, 1:チョキ, 2:パー"
         input_hand = gets.chomp

       # puts "数字で入力してください。"
       # return input_hand
    # 「input_hand」(取得した値)が「0, 1, 2」のいずれかだとwhileから脱出させ、それ以外だと初めから繰り返させます。
      # ヒント! 「while」と「if」を使用します。
#       # 以降の型の例に沿って実装しましょう ※実装する時場合はコメントアウトに注意しましょう


#         # if 条件を書く (「input_hand」(取得した値)が「0, 1, 2」のいずれかの場合だった場合)
#           # 「input_hand」(取得した値)をそのまま返します。
#             # ヒント！ 「return」を使用します。
#         # else ※条件以外の場合
#           # 「プレイヤーに 0 ~ 2を入力させる文章」を表示させます。

#           # 変数「input_hand」にプレイヤーが入力したものを取得して代入します。
#         # end if文のend
#       # end while文のend
      end
    end
  end
end
#
# 敵が「0 ~ 2」の値をランダムで生成するロジックを書きます。
class Enemy
  def hand
    # グー、チョキ、パーの値をランダムに出力させます。
    i = rand(3)
    puts i
    return i
  end
end
# プレイヤー(自分)が入力した「0 ~ 2」と、敵がランダムで生成した「0 ~ 2」をじゃんけんをさせて、その結果をコンソール上に出力するロジックを書きます。
class Janken
  def pon(player_hand, enemy_hand)
    # 変数「janken」に["グー", "チョキ", "パー"]を代入します。
    janken = ["グー", "チョキ", "パー"]
    #「相手の手は#{敵の生成した値}です。」と出力させます。
    puts "相手の手は#{janken[enemy_hand]}です。"
    # Playerクラスの戻り値とEnemyクラスの戻り値からじゃんけんするロジックを作成します。
      # 以降の型の例に沿って実装しましょう ※実装する時場合はコメントアウトに注意しましょう
      # if 条件を書く Playerクラスの戻り値(player_hand)とEnemyクラスの戻り値(enemy_hand)の値が同じだった場合
      # 「あいこ」を出力します。
      while true
        if player_hand == enemy_hand
          puts "あいこ"
          return true
        #「true」を返してじゃんけんを繰り返し実行させます。
          # ヒント！ 「return」を使用します。
      #  elsif もしも下記の組み合わせだった場合
      # 「あなたの勝ちです」を出力します。
      # whileを終了させる「false」を返してじゃんけんを終了させます。
    elsif (player_hand == "0" && enemy_hand == 1) || (player_hand == "1" && enemy_hand == 2) || (player_hand == "2" && enemy_hand == 0)
          puts "あなたの勝ちです。"
          return false
      #  else ※条件以外の場合
        # 「あなたの負けです」を出力します。
        # whileを終了させる「false」を返してじゃんけんを終了させます。
        else
          puts "あなたの負けです。"
          return false
        end #if文のend
      end
  end
end

# # じゃんけんゲームを実行するロジックを書きます。
class Action
  # selfを使用することで、Actionをインスタンス化することなく、クラス名を使ってjankenponメソッドを呼び出せます。
  def self.jankenpon
    # 変数「player」にPlayerをインスタンス化したものを代入します。
    player = Player.new
    # 変数「enemy」にEnemyをインスタンス化したものを代入します。
    enemy = Enemy.new
    # 変数「janken」にJankenをインスタンス化したものを代入します。
    janken = Janken.new
    # 変数「next_game」に「true」を代入します。※「next_game」が「false」にならない限り、永久にwhileで繰り返し処理を実行するためです。
    # 以降の型の例に沿って実装しましょう ※実装する時場合はコメントアウトに注意しましょう。
    next_game = true
    while next_game
        # 変数「next_game」にじゃんけんを実行して返ってきた値(戻り値)を代入します。
        # 「janken.pon(player.hand, enemy.hand)」でじゃんけんを実行しています。
        next_game = janken.pon(player.hand, enemy.hand)
        # じゃんけんの実行結果に「false」が返ってくると、このwhileを終了します。「true」が返ってくると、その回数だけ繰り返し続けます。
    # while文のend
    end
  end
end
# # クラス名を使ってjankenponメソッドを呼び出します。
#
Action.jankenpon
