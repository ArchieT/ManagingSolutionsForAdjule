#package ManagingSolutions;

use strict;
use warnings;

use 5.026;

sub where_is_root {
    return '.' if (-d "./.management");
    return '..' if (-d "../.management");
    die "No .management in neither '.' nor '..' .";
}

use constant IS_NOT_DIR => -1;
use constant IS_BUILD_DIR => -2;
use constant IS_IDEA_DIR => -3;
use constant IS_MANAGEMENT_DIR => -4;
use constant IS_DOT => -5;
use constant IS_DOTDOT => -6;
use constant IS_DOT_HIDDEN => -7;
use constant IS_STARTING_NON_LOWER_ALPHANUM => -21;
use constant IS_LANG_PY_NO23 => -22
use constant IS_LACKING_LANG => -23;
use constant IS_WITH_TITLE_OUT_OF_ALPHANUM_AND_UNDER => -24;
use constant IS_WITH_CN_STARTING_WITH_MINUS = -25;
use constant IS_WITH_CN_ENDING_WITH_MINUS = -26;
use constant IS_WITH_CN_OUT_OF_ALPHANUM_AND_MINUS_AND_UNDER => -27;
use constant IS_ELSE => 0;
use constant IS_CN_BUT_NO_TITLE => 2;
use constant IS_BOTH_CN_AND_TITLE => 1;

use re '/aa'

sub is_problem {
    #return ($file =~ /\A(?>!build-)(?<=-(?<lang>pas|py[23]|c|cpp)(?!-(?:Desktop)?-Debug)\Z/);
    my %result;
    my $file = shift;
    $result{-filename} = $file;
    my $root = where_is_root;
    my $filepath = "$root/$file";
    $result{-filepath} = $filepath;
    unless (-d $filepath) {
        $result{-what} = IS_NOT_DIR;
    } elsif ($file =~ /\Abuild(?:-)?/) {
        $result{-what} = IS_BUILD_DIR;
    } elsif ($file =~ /\A\.idea\Z/) {
        $result{-what} = IS_IDEA_DIR;
    } elsif ($file =~ /\A\.management\Z/) {
        $result{-what} = IS_MANAGEMENT_DIR;
    } elsif ($file =~ /\A\.\Z/) {
        $result{-what} = IS_DOT;
    } elsif ($file =~ /\A\.\.\Z/) {
        $result{-what} = IS_DOTDOT;
    } elsif ($file =~ /\A\./) {
        $result{-what} = IS_DOT_HIDDEN;
    } elsif ($file =~ /\A[^0-9a-z]/) {
        $result{-what} = IS_STARTING_NON_LOWER_ALPHANUM;
    } elsif ($file =~ /-py\Z)/) {
        $result{-what} = IS_LANG_PY_NO23;
    } elsif ($file =~ /-(pas|py[23]|c|cpp)\Z/ {
        $result{-what} = IS_LACKING_LANG;
    } elsif ($file =~ /-[A-Z_][0-9a-zA-Z_]*[^0-9a-zA-Z_]+[0-9a-zA-Z_]*-(pas|py[23]|c|cpp)\Z/) {
        $result{-what} = IS_WITH_TITLE_OUT_OF_ALPHANUM_AND_UNDER;
    } elsif ($file =~ /\A-/) {
        $result{-what} = IS_WITH_CN_STARTING_WITH_MINUS;
    } elsif ($file =~ /--([A-Z_][0-9a-zA-Z_]*-)?-(pas|py[23]|c|cpp)\Z/) {
        $result{-what} = IS_WITH_CN_ENDING_WITH_MINUS;
    } elsif ($file =~ /\A[0-9a-z_\-]*[^0-9a-z_\-]+[0-9a-z_\-]*-/) {
        $result{-what} = IS_WITH_CN_OUT_OF_ALPHANUM_AND_MINUS_AND_UNDER;
    } elsif ($file =~ /\A(?<cn>[0-9a-z_\-]*)-(?<la>pas|py[23]|c|cpp)\Z/) {
        $result{-what} = IS_CN_BUT_NO_TITLE;
        $result{-cn} = %+{-cn};
        $result{-la} = %+{-la};
    } elsif ($file =~ /\A(?<cn>[0-9a-z_\-]*)-(?<ti>[A-Z_][0-9a-zA-Z_]*)-(?<la>pas|py[23]|c|cpp)\Z/) {
        $result{-what} = IS_BOTH_CN_AND_TITLE;
        $result{-cn} = %+{-cn};
        $result{-ti} = %+{-ti};
        $result{-la} = %+{-la};
    } else {
        $result{-what} = IS_ELSE;
    }
    return %result;
}

sub traverse {
    my $root = where_is_root;
    opendir(ROOT,$root) or die "Cannot opendir $root\n";
    my $
    closedir(ROOT);
}

1;