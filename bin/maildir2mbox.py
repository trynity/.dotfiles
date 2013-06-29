#!/usr/bin/env python 
# -*- coding: utf-8 -*-

import mailbox
import sys
import email

def usage():
	print "maildir2mbox.py"
	print "Authors: Nathan R. Yergler, Trynity Mirell"
	print "Origianl Copyright 6 June 2010"
	print "—-"
	print "This file does not contain sufficient creative expression to invoke"
	print "assertion of copyright. No warranty is expressed or implied; use at your"
	print "own risk."
	print "—-"
	print "Uses Python’s included mailbox library to convert mail archives frommaildir"
	print "[http://en.wikipedia.org/wiki/Maildir] to mbox [http://en.wikipedia.org/wiki/Mbox] format."
	print "See http://docs.python.org/library/mailbox.html#mailbox.Mailbox for full"
	print "documentation on this library."
	print "—-"
	print "To run, save as maildir2mbox.py and run:"
	print "$ maildir2mbox.py [maildir_path] [mbox_filename]"
	print "[maildir_path] should be the the path to the actual maildir (containing new, cur, tmp);"
	print "[mbox_filename] will be newly created."

def convert(maildir, mbox):
	# open the existing maildir and the target mbox file
	maildir = mailbox.Maildir(maildir, email.message_from_file)
	mbox = mailbox.mbox(mbox)

	#  lock the mbox
	mbox.lock()

	# iterate over messages in the maildir and add to the mbox
	for msg in maildir:
	  mbox.add(msg)

	# close and unlock
	mbox.close()
	maildir.close()

# Sanity Checking

if len(sys.argv) != 2:
	usage()
	exit(1)
else:
	convert(sys.argv[1], sys.argv[2])