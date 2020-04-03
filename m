Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web12.2220.1585875375383543793
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Apr 2020 17:56:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: 192.55.52.93, mailfrom: timothy.t.orling@linux.intel.com)
IronPort-SDR: /H0lfWxHoBfIKf4UKOVCyptCGEB4CA51MLFQSHNRbDIqbaLEjMW/GvdosEu4D+tt4pddFg9k+u
 d9P5xg5zzdvw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2020 17:56:14 -0700
IronPort-SDR: UPBh3n0uNIW29v4v4yUbOAJB7VfoNEWY5LCOptIThe6xikyTDiO9cAmkYLLedpHYxDQIXMpJsb
 zFNb7JZJFxSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,337,1580803200"; 
   d="scan'208";a="451129833"
Received: from wrath.jf.intel.com ([10.54.31.24])
  by fmsmga006.fm.intel.com with ESMTP; 02 Apr 2020 17:56:14 -0700
From: "Tim Orling" <timothy.t.orling@linux.intel.com>
To: docs@lists.yoctoproject.org
Cc: Tim Orling <timothy.t.orling@linux.intel.com>
Subject: [PATCH 2/5] ref-manual: fix debian-8 system reqs
Date: Thu,  2 Apr 2020 17:55:54 -0700
Message-Id: <20200403005557.4708-2-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200403005557.4708-1-timothy.t.orling@linux.intel.com>
References: <20200403005557.4708-1-timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

jessie-backports is no longer supported, so python3-git and
pylint3 are not installable via apt-get (or at least not
without disabling security checks by using archive.debian.org)

Add note to use pip3 to install instead.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../ref-manual/ref-system-requirements.xml    | 32 ++++++++++++-------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/documentation/ref-manual/ref-system-requirements.xml b/documentation/ref-manual/ref-system-requirements.xml
index 21cd79de0..6153117f1 100644
--- a/documentation/ref-manual/ref-system-requirements.xml
+++ b/documentation/ref-manual/ref-system-requirements.xml
@@ -130,19 +130,29 @@
             <para>
                 The following list shows the required packages by function
                 given a supported Ubuntu or Debian Linux distribution:
-                <note>
-                    If your build system has the
-                    <filename>oss4-dev</filename> package installed, you
-                    might experience QEMU build failures due to the package
-                    installing its own custom
-                    <filename>/usr/include/linux/soundcard.h</filename> on
-                    the Debian system.
-                    If you run into this situation, either of the following
-                    solutions exist:
-                    <literallayout class='monospaced'>
+                <note><title>Notes</title>
+                    <itemizedlist>
+                        <listitem><para>
+                            If your build system has the
+                            <filename>oss4-dev</filename> package installed, you
+                            might experience QEMU build failures due to the package
+                            installing its own custom
+                            <filename>/usr/include/linux/soundcard.h</filename> on
+                            the Debian system.
+                            If you run into this situation, either of the following
+                            solutions exist:
+                            <literallayout class='monospaced'>
      $ sudo apt-get build-dep qemu
      $ sudo apt-get remove oss4-dev
-                    </literallayout>
+                            </literallayout>
+                        </para></listitem>
+                        <listitem><para>
+                            For Debian-8, <filename>python3-git</filename> and <filename>pylint3</filename> are no longer available via <filename>apt-get</filename>.
+                            <literallayout class='monospaced'>
+     $ sudo pip3 install GitPython pylint==1.9.5
+                            </literallayout>
+                        </para></listitem>
+                    </itemizedlist>
                  </note>
                 <itemizedlist>
                     <listitem><para><emphasis>Essentials:</emphasis>
-- 
2.24.0

