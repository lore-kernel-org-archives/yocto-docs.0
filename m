Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.44270.1585546981463133932
 for <docs@lists.yoctoproject.org>;
 Sun, 29 Mar 2020 22:43:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=XQ/VEqsu;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from AZSP-ALSAMON-01.redmond.corp.microsoft.com (cpe-173-172-201-6.elp.res.rr.com [173.172.201.6])
	by linux.microsoft.com (Postfix) with ESMTPSA id D68CA20B4714;
	Sun, 29 Mar 2020 22:43:00 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D68CA20B4714
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1585546981;
	bh=kSUIcDNhXYQg8inyARpinHUKWCEiGs8fmxmnq/lS+4U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XQ/VEqsuknCe9ETD1ogKjSnCDuDlsgIoXVcC1/+yneRACwNO/yfHmejNqn3kOzpIg
	 o/zUTjEpxo0JUYw23LS7VRDuFRJHOSVWPBVSYBnkhfiz2X2kJXqsGd/enB+ac9qJTE
	 aywY3mjWJv3/SjZQM3CJETJyThjo+Ghf1iJHnWU8=
From: alhe@linux.microsoft.com
To: docs@lists.yoctoproject.org
Cc: richard.purdie@linuxfoundation.org
Subject: [PATCH 3/4] overview-manual: Document the basics of WSL and create a link to the build host setup process
Date: Sun, 29 Mar 2020 22:42:50 -0700
Message-Id: <20200330054251.11134-3-alhe@linux.microsoft.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200330054251.11134-1-alhe@linux.microsoft.com>
References: <20200330054251.11134-1-alhe@linux.microsoft.com>

Signed-off-by: Alejandro Hernandez Samaniego <alejandro@enedino.org>
Signed-off-by: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
---
 .../overview-manual-yp-intro.xml               | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/documentation/overview-manual/overview-manual-yp-intro.xml b/documentation/overview-manual/overview-manual-yp-intro.xml
index 30a8ff3320..40ce7e33bb 100644
--- a/documentation/overview-manual/overview-manual-yp-intro.xml
+++ b/documentation/overview-manual/overview-manual-yp-intro.xml
@@ -907,6 +907,24 @@
                     "<ulink url='&YOCTO_DOCS_DEV_URL;#setting-up-to-use-crops'>Setting Up to Use CROss PlatformS (CROPS)</ulink>"
                     section in the Yocto Project Development Tasks Manual.
                     </para></listitem>
+                <listitem><para>
+                    <emphasis>Windows Subsystem For Linux (WSLv2):</emphasis>
+                    You may use Windows Subsystem For Linux v2 to set up a build
+                    host using Windows 10.
+                    <note>
+                      The Yocto Project is not compatible with WSLv1, it is
+                      compatible but not officially supported nor validated
+                      with WSLv2, if you still decide to use WSL please upgrade
+                      to WSLv2.
+                    </note>
+                    The Windows Subsystem For Linux allows Windows 10 to run a real
+                    Linux kernel inside of a lightweight utility virtual
+                    machine (VM) using virtualization technology.</para>
+                    <para>For information on how to set up a Build Host with
+                    WSLv2, see the
+                    "<ulink url='&YOCTO_DOCS_DEV_URL;#setting-up-to-use-wsl'>Setting Up to Use Windows Subsystem For Linux</ulink>"
+                    section in the Yocto Project Development Tasks Manual.
+                    </para></listitem>
                 <listitem><para>
                     <emphasis>Toaster:</emphasis>
                     Regardless of what your Build Host is running, you can
-- 
2.17.1

