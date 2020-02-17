Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web09.8386.1581945159054427896
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Feb 2020 05:12:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:44896 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
	(Exim 4.92)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1j3gCT-004Eks-BT
	for docs@lists.yoctoproject.org; Mon, 17 Feb 2020 08:12:38 -0500
Date: Mon, 17 Feb 2020 08:12:35 -0500 (EST)
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: mention RM_WORK_EXCLUDE with inheriting rm_work
Message-ID: <alpine.LFD.2.21.2002170811030.2323392@localhost.localdomain>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-0.2
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/dev-manual-common-tasks.xml b/documentation/dev-manual/dev-manual-common-tasks.xml
index 1e6addde4..721b6c719 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.xml
+++ b/documentation/dev-manual/dev-manual-common-tasks.xml
@@ -8986,6 +8986,12 @@
             </literallayout>
             Adding this statement deletes the work directory used for building
             a recipe once the recipe is built.
+            If "rm_work" is currently selected, you can override that cleaning
+            on a per-recipe basis (typically for debugging purposes) by adding a
+            line of this form to your <filename>local.conf</filename> file:
+            <literallayout class='monospaced'>
+     RM_WORK_EXCLUDE += "busybox"
+            </literallayout>
             For more information on "rm_work", see the
             <ulink url='&YOCTO_DOCS_REF_URL;#ref-classes-rm-work'><filename>rm_work</filename></ulink>
             class in the Yocto Project Reference Manual.

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
