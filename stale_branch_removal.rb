# Run script by doing: ruby stale_branch_removal.rb

def invalid_branch?(branch_name)
  branch_name.include? "master"
end

def remove_branch(branch_name)
  # %x(git branch -D branch_name)
  puts branch_name
end

branches = `git branch -r`

# Just change the date to whatever you wan't
branches.split(/\n/).each do |branch_name|
  commits = `git log -1 --since='6 month ago #{branch_name}`
  next if invalid_branch?(branch_name)
  if commits.empty?
    remove_branch(branch_name)
  end
end
