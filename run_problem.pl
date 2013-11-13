my ($problem, $language) = @ARGV;

print "Running problem $problem in $language...\n";

my $cwd = `pwd`;
chomp $cwd;
chdir("Problem\ $problem") or die "$!";

if ($language eq 'java') {
    print `javac main.java`;
    print `java main`;
    print `rm main.class`;
}

chdir($cwd) or die "$!";