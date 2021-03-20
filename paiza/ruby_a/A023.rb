def gets_i_array
  gets.split(' ').map(&:to_i)
end

class Array
  def check
    off = 0
    self.each_with_index do |day, i|
      off += 1 if day == 0
      return i if off >= 2
    end
    return -1
  end
end

SCOPE = 7
day_num = gets.to_i
schedule = gets_i_array
fulfill = 0
max_scope = day_num - SCOPE

if (pt = schedule.index(0))
  while pt < max_scope do
    tmp_fulfill = 0
    tmp_pt = pt
    back_pt = tmp_pt - SCOPE
    f_flg = true
    loop do
      plus_pt = schedule[tmp_pt..(tmp_pt + SCOPE - 1)].check
      if plus_pt > 0
        tmp_fulfill += plus_pt
        back_pt = tmp_pt
        tmp_pt += plus_pt

        if f_flg
          back_fulfill = SCOPE - (tmp_pt - pt)
            if (n = pt - (back_fulfill - 1)) < 0
              back_fulfill += n
            end
          tmp_fulfill += back_fulfill
          f_flg = false
        end
      else
        over_fulfill = SCOPE - (tmp_pt - back_pt)
        if (n = (day_num - 1 - tmp_pt) - over_fulfill) < 0
          over_fulfill += n
        end
        tmp_fulfill += over_fulfill
        fulfill = tmp_fulfill if fulfill < tmp_fulfill
        pt = tmp_pt + SCOPE
        break
      end
    end
    break if pt > max_scope

    schedule[pt..-1].each_with_index do |day, i|
      if day == 0
        tmp_pt = pt + i
        break
      end
    end

    if tmp_pt == pt
      break
    else
      pt = tmp_pt
    end
  end
end

puts fulfill

=begin
1. 起点を見つける(最初に条件を満たす日数)
2. 起点から最大で何日条件を満たすか探る
3. 既に保存されている最大日数よりも、2が多ければ、最大日数に代入
4. 2で条件を満たさなくなった週の2日目を補完
5. 3の日以降で1 ~ 4を繰り返す、起点が最後の日 - 6以上になったら終了
=end
