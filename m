Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00198C43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 13:25:41 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92411.1783085135772155221
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 06:25:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=K3tH4Rp1;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FYKjqwOULHGTM4RDe5sWMR85+4LAIiCD3nAY9ouK3Es=; b=K3tH4Rp14L7hLEgbeBifPFekoM
	obj4EJVoz146ST+T2ya7RE2bCDlby5sp5q14zY1FVIsD+X0Tc1xEhPB/j5KMr5p+T4wa4z6AfzEQu
	Su86ROVsHI31fhJK3dlUJThfEGukR022n2l5LY2nodDiJSOUScIJKGjF2pnroZF9N/ZW8tMtSkVY0
	eauKs0ws7T8cXoOww59Pz3ovKluQApjVOgH2vc/K6b23xb+7VhGplY16JwzYsNBukpPWfDarDIoko
	HS8lv+zKBm7kTAt3sVTCLKH8wDIVjDuYEDlLHkZfgn1OviTMdXU3esDtbLkHSzEKi3q6pDjLO0EX3
	oq60nKDA==;
Received: from bras-base-otwaon0916w-grc-40-70-27-65-4.dsl.bell.ca ([70.27.65.4]:50730 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wfdtc-000000077zy-21yD
	for docs@lists.yoctoproject.org;
	Fri, 03 Jul 2026 09:25:33 -0400
Date: Fri, 3 Jul 2026 09:25:12 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: document variable and task for kernel version
 check
Message-ID: <57f7256c-e8b5-c425-0fb8-7699b0cbdb5d@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Jul 2026 13:25:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10031


Add the associated variable and task for kernel version checking:

  - do_kernel_version_sanity_check()
  - KERNEL_VERSION_SANITY_SKIP

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index e1db2d5ed..5744d47dc 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -787,6 +787,14 @@ which can then be applied by subsequent tasks such as
 :ref:`ref-tasks-patch` and
 :ref:`ref-tasks-kernel_configme`.

+.. _ref-tasks-kernel_version_sanity_check:
+
+``do_kernel_version_sanity_check``
+----------------------------------
+
+Validate the version of the kernel; skip this check by assigning the
+value "1" to :term:`KERNEL_VERSION_SANITY_SKIP`.
+
 .. _ref-tasks-menuconfig:

 ``do_menuconfig``
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index c92b195ff..e99b623ea 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5748,6 +5748,10 @@ system and gives an overview of their function and contents.
       configured. Consequently, attempting to refer to this variable in
       contexts prior to configuration will not work.

+   :term:`KERNEL_VERSION_SANITY_SKIP`
+      If set to "1", skip the
+      :ref:`ref-tasks-kernel_version_sanity_check` task.
+
    :term:`KERNELDEPMODDEPEND`
       Specifies whether the data referenced through
       :term:`PKGDATA_DIR` is needed or not.

