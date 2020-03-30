Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.44373.1585546982213475325
 for <docs@lists.yoctoproject.org>;
 Sun, 29 Mar 2020 22:43:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=iNMK26W4;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from AZSP-ALSAMON-01.redmond.corp.microsoft.com (cpe-173-172-201-6.elp.res.rr.com [173.172.201.6])
	by linux.microsoft.com (Postfix) with ESMTPSA id 770AD20B46F0;
	Sun, 29 Mar 2020 22:43:01 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 770AD20B46F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1585546981;
	bh=6lc9x4BeD5UVYW2lt7nV8A6XAWrKWL7qjKJQcitmDCU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iNMK26W4u57hsSyEkljL34TTQCMNOiiGLW5CjQorqrBw/rOb+EpT+X7nH2rCqKx+4
	 LHxiHvN7gWhpkQDLt6eHrfKX8ELzh3fWTPuIKmfe6YOkux+AmYrr+zCQTir8aB4nrm
	 eIuULaYklGfwZTRsp8H+2/tfWrBVxbY05QRwrAvY=
From: alhe@linux.microsoft.com
To: docs@lists.yoctoproject.org
Cc: richard.purdie@linuxfoundation.org
Subject: [PATCH 4/4] brief-yoctoprojectqs: Document the basics of WSL and create a link to the build host setup process
Date: Sun, 29 Mar 2020 22:42:51 -0700
Message-Id: <20200330054251.11134-4-alhe@linux.microsoft.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200330054251.11134-1-alhe@linux.microsoft.com>
References: <20200330054251.11134-1-alhe@linux.microsoft.com>

Signed-off-by: Alejandro Hernandez Samaniego <alejandro@enedino.org>
Signed-off-by: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
---
 .../brief-yoctoprojectqs.xml                     | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.xml b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.xml
index 15dd1af42d..9b976014a0 100644
--- a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.xml
+++ b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.xml
@@ -55,10 +55,18 @@
                         information.
                         </para></listitem>
                     <listitem><para>
-                        You cannot use a build host that is using the
-                        <ulink url='https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux'>Windows Subsystem for Linux</ulink>
-                        (WSL).
-                        The Yocto Project is not compatible with WSL.
+                        You may use Windows Subsystem For Linux v2 to set up a build
+                        host using Windows 10.
+                        <note>
+                          The Yocto Project is not compatible with WSLv1, it is
+                          compatible but not officially supported nor validated
+                          with WSLv2, if you still decide to use WSL please upgrade
+                          to WSLv2.
+                        </note>
+                        See the
+                        <ulink url='&YOCTO_DOCS_DEV_URL;#setting-up-to-use-wsl'>Setting Up to Use Windows Subsystem For Linux</ulink>"
+                        section in the Yocto Project Development Tasks Manual for more
+                        information.
                         </para></listitem>
                 </itemizedlist>
             </note>
-- 
2.17.1

