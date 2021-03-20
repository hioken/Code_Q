q_cnt = gets.to_i
$l_idx = q_cnt - 1
$scores = []; pts = []
q_cnt.times do |i|
  scores << gets.to_i
  pts[i] = i
end
results = [0]

class Array
  def pts_sum(scope)
    ret = 0
    for i in 0..scope
      ret += $scores[self[i]]
    end
  end

  def pts_mpt_search(scope)
    cnt = 0
    scope.downto(0) do |i|
      return i unless self[i] == $l_idx - cnt
      cnt += 1
    end
  end

  def pts_next(move_pt, scope)
    pt = self[move_pt] + 1
    for i in move_pt..scope
      self[i] = pt + i - move_pt
    end
  end

  def skip_check(move_pt)
    check_score = $scores[self[move_pt]]
    for i in (self[move_pt] + 1)..$l_idx
      return true if $scores[i] == check_score
    end

    check_sum = 0
    for i in 0..(move_pt)
      check_sum += $scores[]
    end
  end
end

(q_cnt - 1).downto(0) do |scope|
  while move_pt >= 0
    move_pt = scope
    for pt in (pts[move_pt]..$l_idx)
      pts[move_pt] = pt
      tmp_result = pts.pts_sum(scope)
      results << tmp_result if results.include?(tmp_result)
    end
    move_pt = pts.pts_mpt_search(scope)
    loop do
      pts_next(move_pt, scope)
    end
  end
end
