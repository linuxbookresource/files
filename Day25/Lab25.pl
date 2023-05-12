#!/usr/bin/perl

open(input,"numbers.txt");
@input_lines = <input>;
close input;
chomp(@input_lines);

foreach $line (@input_lines)
{
	print "$line\n";
}

@all_numbers = ();

############################################################################
# split lines into array of numbers and merge them together
# into array @all_numbers
#
foreach $line (@input_lines)
{
	#your code goes here
	#you only need two lines of code
}

############################################################################
# call subroutines
#

$ss = sum(@all_numbers);
$mm = min(@all_numbers);

print "\n\n";
print "The summation of these numbers is $ss\n";
print "The smallest number is $mm\n"; 


############################################################################
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

############################################################################
# SUBROUTINE
# min(@array) - gets the smallest element in @array 
#  

sub min
{
	my @numbers = @_;
	my $smallest =$numbers[0];

	foreach $n (@numbers)
	{
		if($smallest > $n)
		{
			$smallest = $n;
		}
	}

	return $smallest;
 }
