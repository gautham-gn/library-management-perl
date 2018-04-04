@BookName = (
	[101,'Programming Perl'],
	[102,'Head First Java'],
	[103,'Python: The Complete Reference'],
	[104,'Head First PHP and MySQL'],
	[105,'UNIX and Linux System Administration Handbook']
);

%BookCopies = (	101,2,102,2,103,2,104,2,105,2);

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


