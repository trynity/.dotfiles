#!/usr/bin/env bash

# GPG-->DNS CERT/TXT tool.
# Dan Mahoney (danm@prime.gushi.org) and Evan Hunt (each@isc.org)
# ISC License Applies
# $Id: make-dns-cert.sh,v 1.4 2009/10/30 19:20:18 danm Exp $

# requires echo, xxd, openssl, dc, expr, cut, wc, tr, printf, test...
# and of course, gpg
# tested on FreeBSD 6.x, let me know if it works, or doesn't for you.

# season to taste, only used on long certs
exportoptions="export-minimal"

# we don't really care about secure memory, we're only working with public keys
gpgargs="--no-secmem-warning"

# for testing, you may want this short, blank is okay as well.
ttl="30"

# usage: make-dns-cert.sh email keyid [url]
# Note that this order follows the order in the DNS records

email=$1
keyid=$2
url=$3

pkaemail=`echo -n "$email" | sed 's/@/._pka./'`
certmail=`echo -n "$email" | sed 's/@/./'`
## echo "pkaemail is $pkaemail, certmail is $certmail"

function b64_split() {
  SPLIT_LENGTH=36
  LINE=$(echo $1 | tr -d '\n' | gsed -r "s/(.{$SPLIT_LENGTH})/\1\n/g" | gsed -r "s/(^.*)/\t\t\t\t\t\1/g")
  echo "$LINE"
  # echo "sed line:"
  # echo "$LINE"
  # slpo=$(expr $SPLIT_LENGTH + 1)
  # el=$(echo -n "$1" | wc -c | tr -d ' ')
  # split=''
  # LINE=$1
  # if [ $el -le $SPLIT_LENGTH ]; then
  #  printf "\t\t\t\t\t%s\n" $LINE
  # else
  #  while [ $el -gt ${SPLIT_LENGTH} ]; do
  #    BEGIN=$(echo "${LINE}" | cut -c 1-$SPLIT_LENGTH)
  #    LINE=$(echo -n "${LINE}" | cut -c $slpo-$el)
  #    el=$(expr $el - $SPLIT_LENGTH)
  #    printf "\t\t\t\t\t%s\n" $BEGIN
  #  done
  #  if [ $el -gt 0 ]; then
  #    printf "\t\t\t\t\t%s\n" $LINE
  #  fi
  #fi
}

# Lines with a single # are comments, ## are debugs you can uncomment if need be.

## echo "Extracting keyid $keyid"

cert=`gpg $gpgargs --list-keys --fingerprint $keyid | grep "Key fingerprint" |tr -d ' '|cut -c 16-60`
## echo "fingerprint is ($cert)"
length=`echo -n "$cert"|wc -c|tr -d ' '`
## echo "fp length is $length"
hexlength=`dc -e "16 o $length 2 / p"`
## echo "hexlength is $hexlength"

#URL in hex.  Useful for generating a TYPE37 record, not for this.
#hexurl=`echo -n "$url"|xxd -p|tr 'a-f' 'A-F'|tr -d '\n'`
#echo "hexurl is $hexurl"

binfp=`echo -n "$hexlength$cert"|tr 'A-F' 'a-f'|xxd -p -r`

b64=`echo -n "$binfp$url"|openssl enc -base64|tr -d '\n'`
## echo "base64 is $b64"

# Headers
echo "; generated with make-dns-cert.sh on `date` on `hostname`"
echo "; Run as:'$0 $*'"
echo

# PKA record
if [ "$url" ]
then 
  echo ";PKA record for keyid $keyid:"
  printf '%s. %s IN\tTXT\t"v=pka1\\;fpr=%s\\;uri=%s"\n' $pkaemail $ttl $cert $url
else
  echo ";No URL specified, not printing a PKA record"
fi

echo "; You should probably only use one cert, the short or the long. "
echo "; Using both will cause GPG to simply try whichever DNS hands it"
echo "; first."
echo ";"

if [ "$url" ]
then 
  echo "; If using the short, or the PKA method above, be sure to publish"
  echo "; your keys at $url."
  echo "; You can export it with:" 
  echo "; gpg --export --armor --export-options $exportoptions $keyid"
else
  echo "; IPGP certs are technically legal without a URI, as a means of circulating"
  echo "; fingerprint info, but gpg does not currently validate these."
fi

# short cert (just a fingerprint and a url):
# CERT 6 0 0 [fplength][fp][url]
echo ";Short CERT Record for keyid $keyid:"
echo ";This is fingerprint length, fingerprint, and optional key URL, in binary"
printf "%s.\t%s\t%s\n" $certmail $ttl "IN CERT 6 0 0 ("
b64_split ${b64}
printf "\t\t\t\t\t%s\n" ")";

# long cert :
# CERT PGP 0 0 [blob]
BIG_KEY=$(gpg $gpgargs --export --export-options $exportoptions $keyid | openssl enc -base64 | tr -d "\n")
echo ";Long CERT Record for keyid $keyid:"
printf "%s.\t%s\t%s\n" $certmail $ttl "IN CERT 3 0 0 ("
b64_split ${BIG_KEY}
printf "\t\t\t\t\t%s\n" ")";
