Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA733CDB479
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 15:42:47 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14627.1782402161417448574
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Jun 2026 08:42:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=zWUX0Oyf;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qxS5360zJUh33nEmVPkquTDEj162fc5hKRv673hQ37s=; b=zWUX0OyfjOUWgsFBXQjtMXOfcH
	Cb8Lx2j9TIqEY0bylC+m2zdwyg3s5qiMQ716KMIJ1Kexd4/mBNmKOVasjq7Fod71UUW6gq5PQXn13
	84n9lUbbHwRLnNTmr1OYVR+kqDE7aNHEgPRzg4wZ6iyzZSvKr3lQ9xEktbNVCQMKUjDNQAV3iWPLU
	WLHJ5uRJfTxSC5KEnBbnBA/SXgIJ5kQkRQ/8Ru8XtBi8d/66jV6/jmX8LVFz5gzK4lwmUG6kNVXMe
	3cw6A1UKQ3ovn+XDKYzzlpDDmYjvn6G1Bd8R6jXfiKn8Al6+cQMejkbRfpEpWIqozkDkFFwewaJyW
	/XNWkM7A==;
Received: from bras-base-otwaon0916w-grc-51-67-71-147-190.dsl.bell.ca ([67.71.147.190]:46164 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wcmDt-00000000oNo-3byc
	for docs@lists.yoctoproject.org;
	Thu, 25 Jun 2026 11:42:39 -0400
Date: Thu, 25 Jun 2026 11:42:32 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: add more explanation for ptest-related tasks
Message-ID: <f164c2a2-623b-a0b9-f0a9-de488e3c90b8@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 25 Jun 2026 15:42:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9899


Be a little more forthcoming about how the "do_*_ptest_base" tasks
work.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  i think a little more clarity improves these reference entries.

diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index e6301e708..01d28483f 100644
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

@@ -198,8 +203,26 @@ that either directly or indirectly depend on the installed files (e.g.
 ``do_install_ptest_base``
 -------------------------

-Copies the runtime test suite files from the compilation directory to a
-holding area.
+As defined in the :ref:`ref-classes-ptest` class, this task contains generic
+installation code that will be invoked for all ptest-enabled recipes to
+install the associated ptest package::
+
+   do_install_ptest_base() {
+      if [ -f ${UNPACKDIR}/run-ptest ]; then
+         install -D ${UNPACKDIR}/run-ptest ${D}${PTEST_PATH}/run-ptest
+      fi
+
+      grep -q install-ptest: Makefile 2>/dev/null && oe_runmake DESTDIR=${D}${PTEST_PATH} install-ptest
+
+      do_install_ptest
+
+      ... snip ...
+
+   }
+
+in the midst of which this task calls the ``do_install_ptest()`` function
+that would be defined by any ptest-enabled recipe if that recipe needs to
+define any *additional* recipe-specific installation processing.

 .. _ref-tasks-package:


