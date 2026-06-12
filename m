Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA06CD8CA8
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 12:46:21 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69692.1781268378358080215
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Jun 2026 05:46:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=IWsc7klw;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=10H/1AV75xqqonWKzYDWTpF+vOeVCTu4+WDtIfPwCj4=; b=IWsc7klwsojm3brw9MYd0dC5fK
	cBqlKwKyslDFB9oYKehRTHKzdkIiXlliajZfIyTxk0so2J8QhPot1YTPR8qoJqtN4wu4LkAwKMEO8
	GROQhH4FwnEN+mI1nBe+0qlmoLLyNLlkKyJcJ95q0+HtTOex1wPrtVLJyHei6niqROVddAgn9US7N
	+ZeqXGxVRW9suam2xmwfYe3FaD7RinwL8/IicWOvPloFqQSlzVv4+dh/l2lzF5n1yhhE0r53ZF31S
	0bVb1tQL/1Xn2I/WKOALXSWmjbBYDOhxfyBNmkaCc64iQRcBTC2JRloByd3nMp+d0xR0MOS95cRvY
	+3cVsrjg==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:60506 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wY1H5-0000000EI3P-2cOb
	for docs@lists.yoctoproject.org;
	Fri, 12 Jun 2026 08:46:16 -0400
Date: Fri, 12 Jun 2026 08:46:13 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: clarify/correct glossary entries for package
 variables
Message-ID: <be79bec5-1707-ee8b-3688-a21de2e31dae@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 12 Jun 2026 12:46:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9710


Either clarify or correct the packaging backend information for the
package exclusion variables:

  - PACKAGE_EXCLUDE
  - BAD_RECOMMENDATIONS
  - NO_RECOMMENDATIONS

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

    while i ponder how to rewrite the dev manual section for these
variables, we can at least fix the glossary entries.

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index df3666f1c..1b98ab5ea 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -300,6 +300,9 @@ system and gives an overview of their function and contents.
       variable), the OpenEmbedded build system ignores your request and
       will install the packages to avoid dependency errors.

+      This variable is supported for the RPM and IPK packaging backends,
+      but not for DEB.
+
       See the :term:`NO_RECOMMENDATIONS` and the
       :term:`PACKAGE_EXCLUDE` variables for related
       information.
@@ -6498,8 +6501,7 @@ system and gives an overview of their function and contents.
          functionality, such as kernel modules. It is up to you to add
          packages with the :term:`IMAGE_INSTALL` variable.

-      This variable is only supported when using the IPK and RPM
-      packaging backends. DEB is not supported.
+      This variable is supported for all three packaging backends.

       See the :term:`BAD_RECOMMENDATIONS` and
       the :term:`PACKAGE_EXCLUDE` variables for
@@ -6930,8 +6932,7 @@ system and gives an overview of their function and contents.
       an iterative development process to remove specific components from a
       system.

-      This variable is supported by all of the RPM, DEB and IPK
-      packaging backends.
+      This variable is supported for all three packaging backends.

       See the :term:`NO_RECOMMENDATIONS` and the
       :term:`BAD_RECOMMENDATIONS` variables for

