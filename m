Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.2272.1585387274236782233
 for <docs@lists.yoctoproject.org>;
 Sat, 28 Mar 2020 02:21:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=Mph9A1ab;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from AZSP-ALSAMON-01.redmond.corp.microsoft.com (cpe-173-172-201-6.elp.res.rr.com [173.172.201.6])
	by linux.microsoft.com (Postfix) with ESMTPSA id 76A1420B4749;
	Sat, 28 Mar 2020 02:21:13 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 76A1420B4749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1585387273;
	bh=BEbJ4kz1mM5rbIYsUy6o5mdKjOmctp4HG6Kl/uz7Y/Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Mph9A1abqgnvGBUf7sIoame1MpJ8nzUzpNAun0xVI0XR2oeITLSWwQ1xGyVMXnaj9
	 U0cUR5G6P2OMJ2LhBYV65kDge9NME74M+wYPetsyYfrIQ8GVAFfgtIwyRaszI55prM
	 DkBW4beIBXnUiKcNimhvzUBS1U5+kv5b4kvKqn0U=
From: alhe@linux.microsoft.com
To: docs@lists.yoctoproject.org
Cc: richard.purdie@linuxfoundation.org
Subject: [PATCH 2/3] overview-manual-development-environment: Fix CROPS link
Date: Sat, 28 Mar 2020 02:21:05 -0700
Message-Id: <20200328092106.28231-3-alhe@linux.microsoft.com>
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
 .../overview-manual/overview-manual-development-environment.xml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/overview-manual/overview-manual-development-environment.xml b/documentation/overview-manual/overview-manual-development-environment.xml
index 2f1bd1610d..36ebf8a321 100644
--- a/documentation/overview-manual/overview-manual-development-environment.xml
+++ b/documentation/overview-manual/overview-manual-development-environment.xml
@@ -87,7 +87,7 @@
         as its operating system as your development host.
         When you have a Mac or Windows-based system, you can set it up
         as the development host by using
-        <ulink url='https://git.yoctoproject.org/cgit/cgit.cgi/crops/about/'>CROPS</ulink>,
+        <ulink url='https://github.com/crops/poky-container'>CROPS</ulink>,
         which leverages
         <ulink url='https://www.docker.com/'>Docker Containers</ulink>.
         Once you take the steps to set up a CROPS machine, you effectively
-- 
2.17.1

