Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.26665.1630956149096459391
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Sep 2021 12:22:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpe08a7c099a2b1-cm08a7c099a2af.cpe.net.cable.rogers.com ([174.114.56.109]:58794 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mNKCJ-0007PF-Lr
	for docs@lists.yoctoproject.org; Mon, 06 Sep 2021 15:22:28 -0400
Date: Mon, 6 Sep 2021 15:22:24 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: render options in monospace to show quotes properly
Message-ID: <5810ee5d-5d1f-3ac4-fff3-479ae5ea4496@crashcourse.ca>
MIME-Version: 1.0
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

It's important (at least for now) to mark up options with monospaced
font to highlight the difference between single and double quotes.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation/ref-manual/devtool-reference.rst
index 1862c481d..883f54e39 100644
--- a/documentation/ref-manual/devtool-reference.rst
+++ b/documentation/ref-manual/devtool-reference.rst
@@ -78,7 +78,7 @@ has a number of sub-commands for each function. You can run

 As directed in the general help output, you can
 get more syntax on a specific command by providing the command name and
-using "--help"::
+using ``--help``::

    $ devtool add --help
    NOTE: Starting bitbake server...
@@ -471,7 +471,7 @@ Use the ``devtool build`` command to build your recipe. The

 When you use the ``devtool build`` command, you must supply the root
 name of the recipe (i.e. do not provide versions, paths, or extensions).
-You can use either the "-s" or the "--disable-parallel-make" options to
+You can use either the ``-s`` or the ``--disable-parallel-make`` options to
 disable parallel makes during the build. Here is an example::

    $ devtool build recipe

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
