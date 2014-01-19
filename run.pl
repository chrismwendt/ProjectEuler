use Cwd;

my ($problem, $language) = @ARGV;

print "Running problem $problem in $language...\n";

my $cwd = getcwd;
chdir "Problem\ $problem" or die "$!";

if ($language eq 'java') {
    print `javac main.java`;
    print `java main`;
    print `rm main.class`;
} elsif ($language eq 'haskell') {
    print `runhaskell main.hs`;
} elsif ($language eq 'ghc') {
    print `ghc -O2 main.hs`;
    print `./main`;
    print `rm main.o main.hi main`;
}

chdir $cwd or die "$!";
