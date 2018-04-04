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

	