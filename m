Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web09.11498.1605634580230931967
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Nov 2020 09:36:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:33412 helo=localhost.localdomain)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1kf4tu-0004xb-O9
	for docs@lists.yoctoproject.org; Tue, 17 Nov 2020 12:36:19 -0500
Date: Tue, 17 Nov 2020 12:36:16 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: couple more observations about bbappend and BBMASKing
Message-ID: <7db04884-5aad-bb6f-e169-d4aa276cb3e@crashcourse.ca>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII


  i'll throw this out there as possible enhancements to the docs as
i've run across this on an occasional basis.

  consider, say, an OE recipe "fubar" that, among other things,
defines SRC_URI to include a couple standard files that it installs in
the normal places:

  SRC_URI = "... \
		fubar.service \
		fubar.conf \
		... "

  first observation is that it is, of course, reasonable to define a
file "fubar_%.bbappend" file to override those two files but, on
occasion, i've seen a bbappend file of the form

fubar_%.bbappend

  FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
  SRC_URI += "fubar.conf fubar.service"

  do_install_append() {
	... whatever ...
  }

it is, of course, unnecessary to append those two files to SRC_URI as
they are *already* part of SRC_URI from the original recipe, but it is
surprising how many people i've run into who don't know that, and
assume they *always* need to append to SRC_URI whatever files they're
supplying with their bbappend processing. (doesn't hurt, of course,
but it does demonstrate a misunderstanding of how SRC_URI works.)

  also, with respect to BBMASKing, i have on occasion seen someone
who, when starting a project, decides they don't need the
do_install_append() from fubar.bbappend but *do* still want the custom
files, and proceed to BBMASK that fubar.bbappend file, not realizing
that by BBMASKing the bbappend file, they're taking out the
FILESEXTRAPATHS... line, thereby de-activating the custom files and
reverting to the original ones.

  thoughts? is any of the above worth adding a bit more about?

rday

