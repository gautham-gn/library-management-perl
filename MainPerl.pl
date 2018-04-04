#!/usr/bin/perl
#use strict;
use warnings;

#Array of Arrays for BookName Information 
@BookName = (
	[101,'Programming Perl'],
	[102,'Head First Java'],
	[103,'Python: The Complete Reference'],
	[104,'Head First PHP and MySQL'],
	[105,'UNIX and Linux System Administration Handbook']
);

#Hash for Number of Copies Information
%BookCopies = (	101,2,102,2,103,2,104,2,105,2);
###########################################################################################################################################################################
#MainPerl
###########################################################################################################################################################################
&mains;
use Switch;

sub mains(){
print "1. List All Books\n";
print "2. Issue Book\n";
print "3. Return Book\n";
print "4. Add New Book\n";
print "5. Remove Book\n";
print "6. Exit\n";
print "Enter your choice:";
$Choice=<STDIN>;
chomp $Choice;

switch($Choice){
case [1]{&ListBook;}
case [2]{&IssueBook;}
case [3]{&ReturnBook;}
case [4]{&AddBook;}
case [5]{&RemoveBook;}
case [6]{exit(0);}
else { print "Invalid Input!!\n";}
}
}

###########################################################################################################################################################################
#Subroutine for Listing all Books
###########################################################################################################################################################################
sub ListBook() {
for (my $i = 0; $i < @BookName; $i++) {
    print STDOUT "Book ID: " . $BookName[$i][0] . ", Book Name: " . $BookName[$i][1] . ", No.Of Copies: " . $BookCopies{$BookName[$i][0]} . "\n"; 
};
}

###########################################################################################################################################################################
#Subroutine for Issueing Books
###########################################################################################################################################################################
sub IssueBook() {
$AvailableCopies = -100;

my @BookId =();
for (my $i = 0; $i < @BookName; $i++) {
	push @BookId,$BookName[$i][0]
}

print"Enter Book ID:";
$EnteredId=<STDIN>;
chomp $EnteredId;

if ( $EnteredId ~~ @BookId) {
	for (my $i = 0; $i < @BookName; $i++) {
		if($BookName[$i][0] eq $EnteredId) {
			print $BookName[$i][1] . "\n";	
			$Name = $BookName[$i][1];	
			$AvailableCopies = $BookCopies{$EnteredId};	
		}
	}
}
else {
print "Book not Available\n";
&mains;
}

if ($AvailableCopies > 0 ) {
print "Book " .  $Name . " issued\n";
$BookCopies{$EnteredId} = $AvailableCopies - 1;
print "Remaining Copies: " . "$BookCopies{$EnteredId}\n";
}
elsif( $AvailableCopies == -100 ) {
exit;
}
else{
print "Book you are looking for is Not available\n";
};
&mains;
}

###########################################################################################################################################################################
#Subroutine for Returning Books
###########################################################################################################################################################################
sub ReturnBook() {
$AvailableCopies = 100;

my @BookId =();
for (my $i = 0; $i < @BookName; $i++) {
	push @BookId,$BookName[$i][0]
}

print"Enter Book ID:";
$EnteredId=<STDIN>;
chomp $EnteredId;

if ( $EnteredId ~~ @BookId) {
	for (my $i = 0; $i < @BookName; $i++) {
		if($BookName[$i][0] eq $EnteredId) {
			print $BookName[$i][1] . "\n";	
			$Name = $BookName[$i][1];	
			$AvailableCopies = $BookCopies{$EnteredId};	
		}
	}
}
else {
print "Trying to return invalid book.Please verify\n";
&mains;
}

if ( $AvailableCopies < 2 ) {
print "Book " .  $Name . " Returned\n";
$BookCopies{$EnteredId} = $AvailableCopies + 1;
print "Available Copies: " . $BookCopies{$EnteredId} . "\n";
}
elsif( $AvailableCopies == 100 ) {
exit;
}
else{
print "Trying to return invalid book. Please verify\n";
};
&mains;
}

###########################################################################################################################################################################
#Subroutine for Adding New Books
###########################################################################################################################################################################
sub AddBook() {
my @BookId =();
for (my $i = 0; $i < @BookName; $i++) {
	push @BookId,$BookName[$i][0]
}

print"Enter Book ID:";
$Id=<STDIN>;
chomp $Id;

if ( $Id ~~ @BookId) {
	print "Book ID already exists\n"
	}
	else {
		print "Enter Book Name:";
		$Name=<STDIN>;
		chomp $Name;
		print "Enter Number of Copies:";
		$Copies=<STDIN>;
		chomp $Copies;
		push @BookName,[$Id,$Name];
		$BookCopies{$Id}=$Copies;
		print "Book Added to Library list Successfully!\n"
	};
&mains;
}

###########################################################################################################################################################################
#Subroutine for Removing Books
###########################################################################################################################################################################
sub RemoveBook() {
my @BookId =();
for (my $i = 0; $i < @BookName; $i++) {
	push @BookId,$BookName[$i][0]
}

print"Enter Book ID:";
$Id=<STDIN>;
chomp $Id;

if ( $Id ~~ @BookId) {
		delete $BookCopies{$Id};
		for(my $i = 0; $i < @BookName; $i++) {
			if($Id == $BookName[$i][0]){
				splice(@BookName,$i,1)
			}
	}
		print "Book Removed from Library list Successfully!\n";
	} else {
	print "Book selected does not exist in the library\n"
	};
&mains;
}