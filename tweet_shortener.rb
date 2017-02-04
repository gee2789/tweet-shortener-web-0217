def dictionary
  dictionary={
    "hello"=>"hi",
    "to"=>"2",
    "too"=>"2",
    "two"=>"2",
    "for"=>"4",
    "four"=>"4",
    "be"=>"b",
    "you"=>"u",
    "at"=>"@",
    "and"=>"&"} #use "strings" vs. :symbols due to tweet becoming array of strings.
end

def word_substituter(tweet)
  tweet.split(" ").collect do |word| #[.split] turns tweet into array.  .collect pushes results into separate array.
    if dictionary.keys.include?(word.downcase) #.keys pulls all initial dictionary words uses .include? to compare against all iterations of the word array
      word = dictionary[word.downcase]
    else
      word
    end
  end.join(" ")
end

def bulk_tweet_shortener(tweet_array)
  tweet_array.collect do |tweet|
    puts word_substituter(tweet)
  end
end

def selective_tweet_shortener(tweet) #string only. no array to iterate.
    if tweet.length > 140
      word_substituter(tweet) #runs method to shorten words
    else
      tweet[0..140] #else gives the entire value up to 140
    end
end

def shortened_tweet_truncator(tweet) #assume string only.
  if selective_tweet_shortener(tweet).length > 140 #runs selective_tweet_shortener and checks if still > 140 characters
    tweet[0..136]<< "..." #don't forget position [0] is a character value
  else
    tweet #need to define.  method won't know if "false" for the if statement.
  end
end
