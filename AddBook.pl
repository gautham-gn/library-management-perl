@BookName = (
	[101,'Programming Perl'],
	[102,'Head First Java'],
	[103,'Python: The Complete Reference'],
	[104,'Head First PHP and MySQL'],
	[105,'UNIX and Linux System Administration Handbook']
);

%BookCopies = (	101,2,102,2,103,2,104,2,105,2);

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
	