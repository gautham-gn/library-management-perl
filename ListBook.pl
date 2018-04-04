@BookName = (
	[101,'Programming Perl'],
	[102,'Head First Java'],
	[103,'Python: The Complete Reference'],
	[104,'Head First PHP and MySQL'],
	[105,'UNIX and Linux System Administration Handbook']
);

%BookCopies = (	101,2,102,2,103,2,104,2,105,2);

for (my $i = 0; $i < @BookName; $i++) {
    print STDOUT "Book ID: " . $BookName[$i][0] . ", Book Name: " . $BookName[$i][1] . ", No.Of Copies: " . $BookCopies{$BookName[$i][0]} . "\n"; 
};

