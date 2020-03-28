Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web11.14304.1585426128361849420
 for <docs@lists.yoctoproject.org>;
 Sat, 28 Mar 2020 13:08:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:51920 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jIHl8-009AJp-OW
	for docs@lists.yoctoproject.org; Sat, 28 Mar 2020 16:08:47 -0400
Date: Sat, 28 Mar 2020 16:08:41 -0400 (EDT)
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: explain LAYERDEPENDS with other layer.conf vars
Message-ID: <alpine.LFD.2.21.2003281607080.4884@localhost.localdomain>
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
index dfbc6eeb3..ac761df2a 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.xml
+++ b/documentation/dev-manual/dev-manual-common-tasks.xml
@@ -183,6 +183,10 @@
                                 <ulink url='&YOCTO_DOCS_REF_URL;#var-LAYERDEPENDS'><filename>LAYERDEPENDS</filename></ulink>
                                 variable.
                                 </para></listitem>
+                            <listitem><para>
+                                <ulink url='&YOCTO_DOCS_REF_URL;#var-LAYERDEPENDS'><filename>LAYERDEPENDS</filename></ulink>:
+                                Lists all layers on which this layer depends (if any).
+                                </para></listitem>
                             <listitem><para>
                                 <ulink url='&YOCTO_DOCS_REF_URL;#var-LAYERSERIES_COMPAT'><filename>LAYERSERIES_COMPAT</filename></ulink>:
                                 Lists the

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
