Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5E44C7115C
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 11:00:10 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.24085.1750590007760562915
 for <docs@lists.yoctoproject.org>;
 Sun, 22 Jun 2025 04:00:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=O/8yC1at;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=X6oT/ZGZtbZ8GUtgfsWDpiW4wff1PyoVoDLYa1wmNIA=; b=O/8yC1atX1eIWJo3ifjhSCqPFo
	jlFe0+q4eJmGv0ft6+CnOVVl67Z9ftl2K420r/jSp1bXs245zWShTCuapwa2Z1Sv2tV8vzzZqHdzE
	EOMi+TlH3onueSOgu9556gfnYLTSArXR5JTYLWtN40/d4V2rGiWOgOEm047SXN3qejlEx7uB2JHm1
	5doS0lf2JVq0pqpFowUFiSfE2CdHNlLxxK+quP0rA5uQGob3Fj5xVMgox3EiEp5Tq6HF31kZXSgzr
	/aGjB9pqZgqFpwlYGHUBU6ySgbEWCGTRmQdQg/aoZKt2kpImrVA7a1EVE+MxKnKdGkk+fFCw8Ejf8
	ELuFqAYw==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:41250 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uTIQY-00000007DF6-2K2c
	for docs@lists.yoctoproject.org;
	Sun, 22 Jun 2025 07:00:01 -0400
Date: Sun, 22 Jun 2025 06:59:54 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: some minor cleanups to "Pre-Built Libraries"
Message-ID: <b88499e3-e0d1-5aff-490c-ae13c2dbfb31@crashcourse.ca>
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
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 22 Jun 2025 11:00:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7138


  * Add note about new URL for FHS 3.0.
  * Add wildcard for "INHIBIT_" variable.
  * Fix font for ${PN}.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/prebuilt-libraries.rst b/documentation/dev-manual/prebuilt-libraries.rst
index a05f39ca1..077184657 100644
--- a/documentation/dev-manual/prebuilt-libraries.rst
+++ b/documentation/dev-manual/prebuilt-libraries.rst
@@ -22,6 +22,13 @@ To summarize, a versioned library must meet two conditions:
 This section shows how to deal with both versioned and unversioned
 pre-built libraries.

+.. note::
+
+   In the shared library article referenced above, the link to the current
+   version of the Filesystem Hierarchy Standard (FHS) is out of date;
+   the current FHS 3.0 release can be found
+   `here <https://refspecs.linuxfoundation.org/FHS_3.0/index.html>`__.
+
 Versioned Libraries
 ===================

@@ -79,7 +86,7 @@ To write a recipe to use such a library in your system:
 -  The vendor will typically ship release builds without debugging symbols.
    Avoid errors by preventing the packaging task from stripping out the symbols
    and adding them to a separate debug package. This is done by setting the
-   ``INHIBIT_`` flags shown below.
+   ``INHIBIT_*`` flags shown below.

 The complete recipe would look like this::

@@ -170,7 +177,7 @@ as follows::
 The modifications cause the ``.so`` file to be the real library
 and unset :term:`FILES_SOLIBSDEV` so that no libraries get packaged into
 ``${PN}-dev``. The changes are required because unless :term:`PACKAGES` is changed,
-``${PN}-dev`` collects files before `${PN}`. ``${PN}-dev`` must not collect any of
+``${PN}-dev`` collects files before ``${PN}``. ``${PN}-dev`` must not collect any of
 the files you want in ``${PN}``.

 Finally, loadable modules, essentially unversioned libraries that are linked

