class CstarController < ApplicationController
  def index
  end
  def submit2names
    @uname1 = params['uname1']
    @uname2 = params['uname2']
    u1      = RestClient.get "https://api.github.com/users/#{@uname1}/repos"
    u2      = RestClient.get "https://api.github.com/users/#{@uname2}/repos"
    @u1pj   = JSON.parse(u1.to_str)
    @u2pj   = JSON.parse(u2.to_str)
    @count1 = 0
    @count2 = 0
    @u1pj.each{|repo| @count1 += Integer(repo['stargazers_count'])}
    @u2pj.each{|repo| @count2 += Integer(repo['stargazers_count'])}
    @u1r = @u1pj.map{|repo| 
      {'star_count' => Integer(repo['stargazers_count']),
        'full_name' => repo['full_name']}}
    @u2r = @u2pj.map{|repo| 
      {'star_count' => Integer(repo['stargazers_count']),
        'full_name' => repo['full_name']}}
    @u1rs = @u1r.sort_by{|hsh| hsh['star_count']}.reverse
    @u2rs = @u2r.sort_by{|hsh| hsh['star_count']}.reverse
    repocount1 = Float(@u1r.count)
    repocount2 = Float(@u2r.count)
    @avgstr1   = @count1/repocount1
    @avgstr2   = @count2/repocount2
  end
end
