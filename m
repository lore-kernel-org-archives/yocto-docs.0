Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.2327.1585387274724724258
 for <docs@lists.yoctoproject.org>;
 Sat, 28 Mar 2020 02:21:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=iEzrwOKN;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from AZSP-ALSAMON-01.redmond.corp.microsoft.com (cpe-173-172-201-6.elp.res.rr.com [173.172.201.6])
	by linux.microsoft.com (Postfix) with ESMTPSA id 1541820B46F0;
	Sat, 28 Mar 2020 02:21:14 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1541820B46F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1585387274;
	bh=PDq2/WK4Gzsl0DrqpMsi8zjC5o4vpLKSU0hflDmCNNc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iEzrwOKNnFpHXeVJxyuAvpnSHH2cQLGo0E5ILIfpmAhmSWNPoxaffB66sJ+pDQ6Ux
	 PR0U8Y43rh2zpJ62IHc31mKt0IMOaKCY1ERLhaRMT7z9A2vLYhFTwXCDEXqitrN3mu
	 ZrJSXgepaFBvrV1UNVayQzW22wjQ07GnsA0srSq0=
From: alhe@linux.microsoft.com
To: docs@lists.yoctoproject.org
Cc: richard.purdie@linuxfoundation.org
Subject: [PATCH 3/3] overview-manual-yp-intro: Fix CROPS link
Date: Sat, 28 Mar 2020 02:21:06 -0700
Message-Id: <20200328092106.28231-4-alhe@linux.microsoft.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200328092106.28231-1-alhe@linux.microsoft.com>
References: <20200328092106.28231-1-alhe@linux.microsoft.com>

The link used in the documentation points to a file
that no longer exists on the crops repository.

Use the poky-container repo instead since it is more
accurate and updated.

Signed-off-by: Alejandro Hernandez Samaniego <alejandro@enedino.org>
Signed-off-by: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
---
 documentation/overview-manual/overview-manual-yp-intro.xml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/overview-manual/overview-manual-yp-intro.xml b/documentation/overview-manual/overview-manual-yp-intro.xml
index dbf62cc162..30a8ff3320 100644
--- a/documentation/overview-manual/overview-manual-yp-intro.xml
+++ b/documentation/overview-manual/overview-manual-yp-intro.xml
@@ -437,7 +437,7 @@
                 <itemizedlist>
                     <listitem><para id='gs-crops-overview'>
                         <emphasis>CROPS:</emphasis>
-                        <ulink url='https://git.yoctoproject.org/cgit/cgit.cgi/crops/about/'>CROPS</ulink>
+                        <ulink url='https://github.com/crops/poky-container/'>CROPS</ulink>
                         is an open source, cross-platform development framework
                         that leverages
                         <ulink url='https://www.docker.com/'>Docker Containers</ulink>.
@@ -883,7 +883,7 @@
                 <listitem><para>
                     <emphasis>CROss PlatformS (CROPS):</emphasis>
                     Typically, you use
-                    <ulink url='https://git.yoctoproject.org/cgit/cgit.cgi/crops/about/'>CROPS</ulink>,
+                    <ulink url='https://github.com/crops/poky-container/'>CROPS</ulink>,
                     which leverages
                     <ulink url='https://www.docker.com/'>Docker Containers</ulink>,
                     to set up a Build Host that is not running Linux (e.g.
-- 
2.17.1

