class Array
  def loose_uniq!(n)
    flg = {}
    self.delete_if do |v|
      flg[v] ? flg[v] += 1 : flg[v] = 1
      flg[v] > n
    end
    self
  end

  def loose_uniq(n)
    a = self.dup
    flg = {}
    a.delete_if do |v|
      flg[v] ? flg[v] += 1 : flg[v] = 1
      flg[v] > n
    end
    a
  end

  def uniq_push(n)
    a << n if a.include?(n)
  end

  def dup_max
    max = self.first
    self.each do |a|
      max = a if max[1] < a[1]
    end
    max
  end

  def move_pt_search(scope_l_pt, target_ls)
    scope_ls.downto(0) do |pt|
      return pt if self[pt] != target_l_pt - (scope_l_pt - pt)
    end
    return false
  end

  def go_move_pt(move_pt, scope_l_pt)
    old_pt = self[move_pt]
    for pt in move_pt..scope_l_pt
      self[pt] = old_pt + 1 + (pt - move_pt)
    end
  end
end

$q_cnt = gets.to_i
$scores = []; pts = []
$q_cnt.times do |i|
  scores << gets.to_i
  pts[i] = i
end
$scores.sort!

results = $scores.uniq
results << n

for scope in 2..$q_cnt # 大外の範囲のループ
  work = $scores.loose_uniq(scope)
  if work.size <= scope
    results.uniq_push(work.sum) if work == scope
    next
  end

  dup_h
  work.each { |n| dup_h[n] ? dup_h[n] += 1 : dup_h[n] = 1 }
  dup_h.delete_if { |k, v| v == 1 }
  while (dup_a.size > 0) # 起点のループ
    must = dup_a.dup_max
    fir_pt = work.index(must[0])
    check_num = work[fir_pt] * must[1]
    if results.include?(check_num) || must[1] == scope
      results.uniq_push(check_num)
      must[1] -= 1
      dup_a.delete(must) if must[1] <= 1
      next
    end
    loop do # 起点以外のループ
      other_pt_cnt = scope - must[1]
      check_other_num = 0
      other_pt_cnt.times { |i| check_other_num += work[pts[i]]}
      results.uniq_push(check_num + check_other_num)
      cheked = work[pts[other_pt_cnt - 1]]
      while (work[pts[other_pt_cnt - 1]] == cheked || pts[other_pt_cnt - 1] <= work.size - 1)
        pts[other_pt_cnt - 1] += 1
      end

      if pts[other_pt_cnt - 1] == work.size - 1
        move_pt = pts.move_pt_search(other_pt_cnt - 1, work.size - 1)
        cheked = work[pts[move_pt]]
        break unless move_pt
        while (work[pts[move_pt]] == cheked)
          pts.go_move_pt(move_pt, other_pt_cnt - 1)
        end
        next
      end
    end
  end
end
