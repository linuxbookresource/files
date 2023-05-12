#!/usr/bin/perl

# address of the text file
$url = 'http://www.shakespeare-online.com/plays/hamlet_3_2.html';

# call subroutine to retrieve web page
$whole_script = getweb($url);

# print the content on screen
print $whole_script;

# save the content to file hamlet.html
open(output1,">hamlet.html");
print output1 $whole_script;
close output1;

################################################################
# Convert every letter in $whole_script to lower case
# Your code goes here. Hint: you need one line of code here
#


# split the whole scripts into words
 @words = split(/\W+/, $whole_script);

# count the words, %wordcount is a hashtable
foreach $word (@words)
{
	$wordcount{$word} = $wordcount{$word} + 1; 
}

# @unique_word is an array that contains all the unique words
@unique_word = keys %wordcount;

##################################################################
# Your code goes here
$num_words = # Your code goes here, determine number of words
$uni_words = # Your code goes here, determine number of unique words

open(output2,">hamlet_analysis.txt");

# print out the analysis to file
print output2 "The number of words is $num_words\n";
print output2 "The number of unique words is $uni_words\n";
print output2 "The occurrence of each words is listed below\n";
print output2 "****************************************\n";

##################################################################
# Retrieve each unique word and the count of this word in ascending 
# order of words.
# Save this result to file "hamlet_analysis.txt". Do not disply them
# on screen.
#  
# Your code goes here. Hint: use foreach statement




close output2;


#################################################################
# subroutine: retrieve web page contents
sub getweb
{
    	my $url = $_[0];
	require LWP::UserAgent;
	my $ua = LWP::UserAgent->new;
	$ua->timeout(10);
	$ua->env_proxy;
	my $response = $ua->get($url);
 
    	return $response->content;  
}
