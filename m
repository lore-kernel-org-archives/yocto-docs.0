Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.2326.1585387273881935656
 for <docs@lists.yoctoproject.org>;
 Sat, 28 Mar 2020 02:21:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=PFpuxnis;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from AZSP-ALSAMON-01.redmond.corp.microsoft.com (cpe-173-172-201-6.elp.res.rr.com [173.172.201.6])
	by linux.microsoft.com (Postfix) with ESMTPSA id DAA9120B4737;
	Sat, 28 Mar 2020 02:21:12 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DAA9120B4737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1585387273;
	bh=6KP35GfDrCDXVmPR6mRMKXijn3kvVS1paaKx+uTdiqU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PFpuxnisFUgSQe/gYI4Q6Q+i+fRJvNxaAGBz5wZZX914Fqp3Pk7KJIv2GEvMaVL2J
	 pzmSMt/nAPFx/JAV696/PY3cE6FWYeLXp5L3FMuYSc4X5LgtMoUmpUP20R6PlKeFR2
	 Rc6M6Nq8smaouQc9LPC1dw/Y5zNHPjo93Z6GECgo=
From: alhe@linux.microsoft.com
To: docs@lists.yoctoproject.org
Cc: richard.purdie@linuxfoundation.org
Subject: [PATCH 1/3] dev-manual: Fix CROPS link
Date: Sat, 28 Mar 2020 02:21:04 -0700
Message-Id: <20200328092106.28231-2-alhe@linux.microsoft.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200328092106.28231-1-alhe@linux.microsoft.com>
References: <20200328092106.28231-1-alhe@linux.microsoft.com>

The link used in the documentation points to a file
that no longer exists on the crops repository.

Use the poky-container repo instead since it is more
accurate and updated

Signed-off-by: Alejandro Hernandez Samaniego <alejandro@enedino.org>
Signed-off-by: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
---
 documentation/dev-manual/dev-manual-start.xml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/dev-manual-start.xml b/documentation/dev-manual/dev-manual-start.xml
index 59ffa49bb6..8d2f316f52 100644
--- a/documentation/dev-manual/dev-manual-start.xml
+++ b/documentation/dev-manual/dev-manual-start.xml
@@ -396,7 +396,7 @@
         for development using the Yocto Project.
         Your build host can be a native Linux machine (recommended) or it can
         be a machine (Linux, Mac, or Windows) that uses
-        <ulink url='https://git.yoctoproject.org/cgit/cgit.cgi/crops/about/'>CROPS</ulink>,
+        <ulink url='https://github.com/crops/poky-container'>CROPS</ulink>,
         which leverages
         <ulink url='https://www.docker.com/'>Docker Containers</ulink>.
         <note>
@@ -517,7 +517,7 @@
 
         <para>
             With
-            <ulink url='https://github.com/crops/crops/blob/master/README.md'>CROPS</ulink>,
+            <ulink url='https://github.com/crops/poky-container'>CROPS</ulink>,
             which leverages
             <ulink url='https://www.docker.com/'>Docker Containers</ulink>,
             you can create a Yocto Project development environment that
-- 
2.17.1

