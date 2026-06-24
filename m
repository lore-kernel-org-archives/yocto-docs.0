Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17660CDB471
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 12:40:26 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6052.1782304821724379311
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Jun 2026 05:40:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=atVBjESy;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xWD2k/7ttp4CiM2apSS5xFPJcW8Nzl3qsOWsg/9AncE=; b=atVBjESynL8rn6OA8yNunpwF/B
	j7HLTLvbZiTy6SOjeNwEdht+aNaQIsfFY0kdrPs5KvHfsVZTJkonrprDoljoeUbPjJU9wBAC4nCj3
	+CuMDpJNEnajA+Z7qj1jAd318oQ+2xwbRPIkXmwhZ0aRsYyj0wcz596weU/2RoysTNgTpZNuiVo6o
	EAvB7t5pRw5BD+wa8o5vAanMC18IDBoQUjFV2+OMTaixxHmA/U0RscIqvBeIpSW6oe3fn26PvJ0x+
	+oacro/BBAR+5/l7xwby76HO0vLLn0fERMxxHKZax5VNbKRL7tlYSJf2fB6dqxYKZFqHOkr/oIor4
	Jbs47L+w==;
Received: from bras-base-otwaon0916w-grc-51-67-71-147-190.dsl.bell.ca ([67.71.147.190]:49418 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wcMtu-0000000FVOl-1fXl
	for docs@lists.yoctoproject.org;
	Wed, 24 Jun 2026 08:40:19 -0400
Date: Wed, 24 Jun 2026 08:40:14 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH v2] ref-manual: add missing entry for build/tmp/deploy/spdx
Message-ID: <87401ea3-1ac5-48c3-c579-4bb673e5820b@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 24 Jun 2026 12:40:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9865


There is no entry in the Build Directory section for the directory
build/tmp/deploy/spdx, so add it.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  i'm going with SBOM referring to the entirety of all that SPDX info.

diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index ff84b250b..0e8674d68 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -539,6 +539,16 @@ licensing, see the
 ":ref:`dev-manual/licenses:maintaining open source license compliance during your product's lifecycle`"
 section in the Yocto Project Development Tasks Manual.

+.. _structure-build-tmp-deploy-spdx:
+
+``build/tmp/deploy/spdx/``
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+This directory contains a Software Bill of Materials (:term:`SBOM`) in
+:term:`SPDX` format, as explained in detail in the
+":ref:`dev-manual/sbom:creating a software bill of materials`"
+section of the Yocto Project Development Tasks Manual.
+
 .. _structure-build-tmp-deploy-images:

 ``build/tmp/deploy/images/``

