#!/bin/bash

commit_id=$1

# 检查参数是否提供
if [ -z "$commit_id" ]; then
  echo "Usage: ./cherry-pick-script.sh <commit_id>"
  exit 1
fi

# 定义需要 cherry-pick 的分支列表
branches=("2.23.23042500" "3.1.23062900" "4.0.23101300" "	5.0.0" "release2.0.0" "6.0.0" )

# 循环遍历分支列表进行 cherry-pick
for branch in "${branches[@]}"
do
  git checkout $branch
  git cherry-pick $commit_id
  # 如果有冲突，手动解决冲突后继续 cherry-pick
  # git cherry-pick --continue
done

# 返回到原始分支
git checkout original_branch
