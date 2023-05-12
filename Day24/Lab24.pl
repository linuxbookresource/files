#!/usr/bin/perl

open(input,"numbers.txt");
@input_lines = <input>;
close input;
chomp(@input_lines);

foreach $num (@input_lines)
{
	print "$num\n";
}

$ss = sum(@input_lines);
$mm = min(@input_lines);

print "\n\n";
print "The summation of these numbers is $ss\n";
print "The smallest number is $mm\n"; 


#############################################################################
# SUBROUTINE
# sum(@array) - gets the summation of all the numbers in @array 
#    

sub sum
{
	my @numbers = @_;
	my $total =0;

	foreach $n (@numbers)
	{
		$total = $total + $n;
	}

	return $total;
 }

#############################################################################
# SUBROUTINE
# min(@array) - gets the smallest element in @array 
#  

sub min
{
	#
	# Your code goes here
	#
}
