Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.44387.1585546980886099190
 for <docs@lists.yoctoproject.org>;
 Sun, 29 Mar 2020 22:43:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=ghMEZUVr;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from AZSP-ALSAMON-01.redmond.corp.microsoft.com (cpe-173-172-201-6.elp.res.rr.com [173.172.201.6])
	by linux.microsoft.com (Postfix) with ESMTPSA id B95A020B46F0;
	Sun, 29 Mar 2020 22:42:59 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B95A020B46F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1585546980;
	bh=KXbaPEB+mn/AACTzle/bZdwdTpRphpKj6vnFgPlKPWk=;
	h=From:To:Cc:Subject:Date:From;
	b=ghMEZUVr3qFTGuyOIy9gdPvSZWoqSXqP3NIMmxJYhYSguV6C8DFJVOVelC+9z+odb
	 SzVWTqoeWWGdiF1Ll+Axl1sYb9ZJY1gae362AHmvJUTismFJ0fcAiuTMh1avAggNly
	 rC7o5394M9NayUs82JJ4NKJrYe6YoS640kANemLA=
From: alhe@linux.microsoft.com
To: docs@lists.yoctoproject.org
Cc: richard.purdie@linuxfoundation.org
Subject: [PATCH 1/4] ref-manual: Explain the project is not validated against WSL but people may still use it
Date: Sun, 29 Mar 2020 22:42:48 -0700
Message-Id: <20200330054251.11134-1-alhe@linux.microsoft.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Alejandro Hernandez Samaniego <alejandro@enedino.org>
Signed-off-by: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
---
 .../ref-manual/ref-system-requirements.xml        | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/documentation/ref-manual/ref-system-requirements.xml b/documentation/ref-manual/ref-system-requirements.xml
index 9c2198a769..3bccbc630b 100644
--- a/documentation/ref-manual/ref-system-requirements.xml
+++ b/documentation/ref-manual/ref-system-requirements.xml
@@ -66,12 +66,15 @@
                         below.
                         </para></listitem>
                     <listitem><para>
-                        The Yocto Project is not compatible with the
-                        <ulink url='https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux'>Windows Subsystem for Linux</ulink>
-                        (WSL).
-                        You cannot use a
-                        <link linkend='hardware-build-system-term'>build host</link>
-                        that is running WSL.
+                        You may use Windows Subsystem For Linux v2 to set up a build
+                        host using Windows 10, but validation is not performed
+                        against build hosts using WSLv2.
+                        <note>
+                          The Yocto Project is not compatible with WSLv1, it is
+                          compatible but not officially supported nor validated
+                          with WSLv2, if you still decide to use WSL please upgrade
+                          to WSLv2.
+                        </note>
                         </para></listitem>
                     <listitem><para>
                         If you encounter problems, please go to
-- 
2.17.1

