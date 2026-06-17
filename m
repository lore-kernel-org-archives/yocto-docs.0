Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96818CD98F0
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 11:57:08 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13849.1781697418081358041
 for <docs@lists.yoctoproject.org>;
 Wed, 17 Jun 2026 04:56:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=hV2KbYM+;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MbW6oRfUR5ZA6/cGEilIBdsJeADcMzgAe7xPuW0jldk=; b=hV2KbYM+3Y+mRuKzAu97rcrEFR
	681oNevI7s+1sA7od/6zoF/LqHcrFvY1CCtHwMY1A8/DCJb4qICQ0s/SsU+FjznHEtZ3zu0Bf6yEj
	sZsVEvXS+yy+y/vJMuxqCMDiu6NshWChM3HdEGA0V/1WZBkReADofbuD5COIIfZ428oEDkx3rv73r
	TCtjc5KdOD7yXmn1t73tRYTsxgu5QlhPMDhFWFc64SA4EL6QQJJSO6jfqbN3oWAvWqFnrjkkpe2Tk
	61sjRgIHGNxL6JdaAqHayYytMN9n4CgRhOou1JiFx17K1H23Tg/pSpfePuv2DM2CSPrea4O0PVk74
	mfgQdtTw==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:47638 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wZot5-00000009P8a-17zR
	for docs@lists.yoctoproject.org;
	Wed, 17 Jun 2026 07:56:56 -0400
Date: Wed, 17 Jun 2026 07:56:49 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: add more explanation to glossary variable
 LICENSE
Message-ID: <3beaf215-35cd-0e87-ce29-cdf2ff3a8135@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 17 Jun 2026 11:57:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9773


Add the following to the variable glossary LICENSE entry:

  - it is a required variable in an OE recipe
  - it must be accompanied by LIC_FILES_CHKSUM, except in the
    case where LICENSE = "CLOSED"

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index df3666f1c..3558ccf2d 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5871,7 +5871,8 @@ system and gives an overview of their function and contents.
       section in the Yocto Project Development Tasks Manual.

    :term:`LICENSE`
-      The list of source licenses for the recipe. Follow these rules:
+      This is a required field in an Openembedded recipe file, and should
+      contain a list of source licenses for the recipe. Follow these rules:

       -  Do not use spaces within individual license names.

@@ -5911,6 +5912,12 @@ system and gives an overview of their function and contents.
          LICENSE:${PN} = "GPL-2.0.only"
          LICENSE:${PN}-doc = "GFDL-1.2"

+      .. note::
+
+         A recipe's :term:`LICENSE` value must be accompanied by an associated
+         :term:`LIC_FILES_CHKSUM` value, except in the special case where
+         the :term:`LICENSE` value is set to "CLOSED".
+
    :term:`LICENSE_CREATE_PACKAGE`
       Setting :term:`LICENSE_CREATE_PACKAGE` to "1" causes the OpenEmbedded
       build system to create an extra package (i.e.

