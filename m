Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.3695.1616312436599359545
 for <docs@lists.yoctoproject.org>;
 Sun, 21 Mar 2021 00:40:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:52544 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lNshO-005VqK-4M
	for docs@lists.yoctoproject.org; Sun, 21 Mar 2021 03:40:34 -0400
Date: Sun, 21 Mar 2021 03:40:31 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: question about "Flexible Inheritance for Class Functions", BB manual
Message-ID: <60c7c789-acb-d0a0-5cae-f0741fb5b5d@crashcourse.ca>
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


  was thinking of tweaking some of this part of the manual, first a
couple questions.

  in that section:

file:///home/rpjday/oe/dist/layers/bitbake/doc/_build/html/bitbake-user-manual/bitbake-user-manual-metadata.html#flexible-inheritance-for-class-functions

the intro correctly explains how one can normally make adjustments to
an inherited task from a class file, i just want to have a complete
list as to the possibilities:

 * do nothing and accept the inherited task as is
 * _append or _prepend (or possibly both) to the task
 * override it completely by redefining the task

i would also have added:

 * delete the task with "deltask"
 * delete the task with var flag "noexec"

first question -- is that pretty much the complete set of what one can
do with regards to an inherited task? am i missing anything obvious?
and the only drawback to providing that list is that deltask and var
flags are explained in subsequent sections so the ordering would be a
bit off.

  also, even if one uses the EXPORT_FUNCTIONS feature, i'm assuming
one can ignore that and still use all of the above unchanged, yes?

  still pondering as to how i'd rewrite this for clarity.

rday
