Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E019CD4F26
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 08:17:47 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30564.1782461863563292309
 for <docs@lists.yoctoproject.org>;
 Fri, 26 Jun 2026 01:17:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=tPFd6S2L;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8fftJ+mNV4KZRLvCLl5NMKZy35gTbdxR/CEsMy9QnVA=; b=tPFd6S2Lq1RFSqzuFxUP+MJT4v
	DcIa8hpG2ooPh94POsbdsn5R6WvAiFgCfNUImwRgHzZqLGjoA4p+VEYzQrv4WZdQkvWwQWFqU2T75
	3aqpgJ1/UHBUJktDVb4kRS+KXahdCstwQLQnp4E1z/8tQ+78+c68bUHH0tov0P433v0+cXGWVQZok
	8XzwC+xynUkFyoWCSoEHx5we/q42hpqOgAYFfdFPAVHgBelkN9R66r2Vj8ud54f8EWI6d6RBT/mA9
	IoGH6t9hsjiYnHLlMwQ2qHcMZ3HmGMYOKWwGFz/7hoWLDrasgnRgqi/qiT6zoA98pTm8uC09ez0S2
	hzge+BsA==;
Received: from bras-base-otwaon0916w-grc-51-67-71-147-190.dsl.bell.ca ([67.71.147.190]:34436 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wd1ko-00000002Z9N-1IlP
	for docs@lists.yoctoproject.org;
	Fri, 26 Jun 2026 04:17:40 -0400
Date: Fri, 26 Jun 2026 04:17:33 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH v2] ref-manual: add more explanation for ptest-related
 tasks
Message-ID: <d9cc2eb6-728f-2a86-24fd-0062151f58b3@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 26 Jun 2026 08:17:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9904


Be a little more forthcoming about how the "do_*_ptest_base" tasks
work.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index e6301e708..9c8d6ac3a 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -43,7 +43,9 @@ If no such file is found, the :ref:`ref-tasks-compile` task does nothing.
 ``do_compile_ptest_base``
 -------------------------

-Compiles the runtime test suite included in the software being built.
+As defined in the :ref:`ref-classes-ptest` class, this task simply calls
+``do_compile_ptest()``, which any ptest-enabled recipe is expected to
+define for compiling its associated ptest package.

 .. _ref-tasks-configure:

@@ -65,7 +67,10 @@ file is found or the :term:`CLEANBROKEN` variable is set to "1", the
 ``do_configure_ptest_base``
 ---------------------------

-Configures the runtime test suite included in the software being built.
+As defined in the :ref:`ref-classes-ptest` class, this task simply calls
+``do_configure_ptest()``, which any ptest-enabled recipe is expected to
+define for configuring its associated ptest package.  Very few recipes need
+to define their own ``do_configure_ptest()`` function.

 .. _ref-tasks-deploy:

@@ -198,8 +203,21 @@ that either directly or indirectly depend on the installed files (e.g.
 ``do_install_ptest_base``
 -------------------------

-Copies the runtime test suite files from the compilation directory to a
-holding area.
+As defined in the :ref:`ref-classes-ptest` class, this task contains generic
+installation code that will be invoked for all ptest-enabled recipes,
+in the midst of which this task calls the ``do_install_ptest()`` function
+that would be defined by any ptest-enabled recipe if that recipe needs to
+define any *additional* recipe-specific installation processing::
+
+   do_install_ptest_base() {
+
+      ... snip ...
+
+      do_install_ptest
+
+      ... snip ...
+
+   }

 .. _ref-tasks-package:


