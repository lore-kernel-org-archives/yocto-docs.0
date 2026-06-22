Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CCC3CDB46F
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 09:09:11 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39040.1782119340786751002
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Jun 2026 02:09:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=lfpVkQF1;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kJ4ObxSSQvQWrQlBCIm0suUtWIeuXgZ4a9IiqpYbiOs=; b=lfpVkQF13zGhHvs0IWrnW1qvC3
	lLOcmsytBkx6yZ4mxUKQNQoFzGWY+van9+hL1rXa1rYmPVeGL0u8hE5MUuBbkRGNLG056NtgJT0gC
	+gU2KkCFkbUdOygaQVu++bFgH7fMqsVOKdfYSPKIQuuvUS2DvTJqHkpMJPY6tSzhIfRxXy+rB5f+o
	UgM4/By4fkGjySLGkeWDrxM8JR4Be926pBbVu55yN1j+sHu+dPTh6YlDWrCFnr2sjnGH2gkXNguW7
	32aQofKOCp4aZaqOCi0QnRSIf1xn9atSzpNQkpNV83zxNlqjHKMoKWRoGLj6VNbyFoKgKDk2V3Wca
	kbviSYbA==;
Received: from bras-base-otwaon0916w-grc-51-67-71-147-190.dsl.bell.ca ([67.71.147.190]:37298 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wbaeH-0000000A1CW-3O55
	for docs@lists.yoctoproject.org;
	Mon, 22 Jun 2026 05:08:59 -0400
Date: Mon, 22 Jun 2026 05:08:52 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH v2] dev-manual: describe two ways to assign "PV" for external
 SCM
Message-ID: <dca8856e-440c-a905-f11a-34ca6c253281@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Mon, 22 Jun 2026 09:09:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9826


In addition to hard-coding a PV value in the context of an external
SCM, show also the alternative of simply appending the string "+git"
to the value already calculated for PV from the recipe file name.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/external-scm.rst b/documentation/dev-manual/external-scm.rst
index e7ab8a4c6..adab4370f 100644
--- a/documentation/dev-manual/external-scm.rst
+++ b/documentation/dev-manual/external-scm.rst
@@ -13,9 +13,17 @@ Subversion (SVN) and Git.

 To enable this behavior, the :term:`PV` of
 the recipe needs to include a ``+`` sign in its assignment.
-Here is an example::
+You can do this in one of two ways:

-   PV = "1.2.3+git"
+-  Manually assign a version number and the string "+git"
+   in the recipe::
+
+      PV = "1.2.3+git"
+
+-  A more elegant way is to simply append the "+git" string to the
+   value of :term:`PV` already extracted from the recipe file name::
+
+      PV .= "+git"

 :term:`Bitbake` later includes the source control information in :term:`PKGV`
 during the packaging phase.

