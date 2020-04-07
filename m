Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web12.5910.1586252522101913175
 for <docs@lists.yoctoproject.org>;
 Tue, 07 Apr 2020 02:42:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:49494 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jLkk4-00HamF-Gp
	for docs@lists.yoctoproject.org; Tue, 07 Apr 2020 05:42:01 -0400
Date: Tue, 7 Apr 2020 05:41:58 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH v2] dev-manual: clarify how to select "read-only-rootfs"
Message-ID: <alpine.LFD.2.21.2004070539500.6010@localhost.localdomain>
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

For stylistic reasons, clarify the use of both IMAGE_FEATURES versus
EXTRA_IMAGE_FEATURES when configuring a read-only rootfs.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/dev-manual-common-tasks.xml b/documentation/dev-manual/dev-manual-common-tasks.xml
index 2b8868b62..8bb8612e0 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.xml
+++ b/documentation/dev-manual/dev-manual-common-tasks.xml
@@ -11195,18 +11195,18 @@

             <para>
                 To create the read-only root filesystem, simply add the
-                "read-only-rootfs" feature to your image.
-                Using either of the following statements in your
-                image recipe or from within the
-                <filename>local.conf</filename> file found in the
-                <ulink url='&YOCTO_DOCS_REF_URL;#build-directory'>Build Directory</ulink>
-                causes the build system to create a read-only root filesystem:
+                "read-only-rootfs" feature to your image, normally in one of two ways.
+                The first way is to add the "read-only-rootfs" image feature
+                in the image's recipe file via the
+                <filename>IMAGE_FEATURES</filename> variable:
                 <literallayout class='monospaced'>
-     IMAGE_FEATURES = "read-only-rootfs"
+     IMAGE_FEATURES += "read-only-rootfs"
                 </literallayout>
-                or
+                As an alternative, you can add the same feature from within your
+                build directory's <filename>local.conf</filename> file with the
+                associated <filename>EXTRA_IMAGE_FEATURES</filename> variable, as in:
                 <literallayout class='monospaced'>
-     EXTRA_IMAGE_FEATURES += "read-only-rootfs"
+     EXTRA_IMAGE_FEATURES = "read-only-rootfs"
                 </literallayout>
             </para>


-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
