Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.616.1584985402872309132
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Mar 2020 10:43:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mark.morton@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 02NHh2aB030204
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <docs@lists.yoctoproject.org>; Mon, 23 Mar 2020 10:43:12 -0700
Received: from san-mmorton-lx1.corp.ad.wrs.com (147.11.4.137) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Mon, 23 Mar 2020 10:42:51 -0700
From: "Mark Morton" <Mark.Morton@windriver.com>
To: <docs@lists.yoctoproject.org>
Subject: [PATCH] Added usrmerge to distro-features for Bug 13494
Date: Mon, 23 Mar 2020 10:39:05 -0700
Message-ID: <20200323173905.25071-1-mark.morton@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: mmorton <mark.morton@windriver.com>

---
 documentation/ref-manual/ref-features.xml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/documentation/ref-manual/ref-features.xml b/documentation/ref-manual/ref-features.xml
index 44ba67cf5..294b297c2 100644
--- a/documentation/ref-manual/ref-features.xml
+++ b/documentation/ref-manual/ref-features.xml
@@ -210,6 +210,12 @@
                 <listitem><para><emphasis>usbhost:</emphasis> Include USB Host
                     support (allows to connect external keyboard, mouse,
                     storage, network etc).</para></listitem>
+                <listitem><para><emphasis>usrmerge:</emphasis> Merges the 
+                    <filename>/bin</filename>, <filename>/sbin</filename>, 
+                    <filename>/lib</filename>, and <filename>/lib64</filename>       
+                    directories into their respective counterparts in the 
+                    <filename>/usr</filename> directory to provide better package 
+                   and application compatibility.</para></listitem>
                 <listitem><para><emphasis>wayland:</emphasis> Include the
                     Wayland display server protocol and the library that
                     supports it.</para></listitem>
-- 
2.17.1

