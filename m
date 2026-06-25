Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB76CCDB47F
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 08:31:46 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6882.1782376299522663138
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Jun 2026 01:31:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=E0d2CRvq;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2jvubfR+VZuX9ip5pX5zqw5yRIxSXEsWQhGrwj8v96c=; b=E0d2CRvq5vTdufO+MJhD1FiRsq
	jhf7S4yb8thrfm/eF02ih63DUPatlzmdRZQ7eGB++S7GrZgAVNduYC3DZerorVOKXCh4zPPbnDJg6
	94DPD6igMHS/ed+NLVdq4HeO2v2BYCqJqmFtiXNQ+IWz1uPq75bIn3Xx9H0xxet2bZZqsryFhdgCq
	vJ2hX6xxvOrXAcOOPS3oXJ1WYhUNy8KkPEbwJaRAAqbUlzoXbSP1eCgrtO2HgBnYNl7vug+ddLOF3
	lgFVlNDgRc0R8uIhrHZmBI4APXR7FoK4YrLAyCrN5KEstB5oq9NRMl2vCDDsxZ78Z0fN3ku/chjzf
	OyUzbLZg==;
Received: from bras-base-otwaon0916w-grc-51-67-71-147-190.dsl.bell.ca ([67.71.147.190]:52762 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wcfUm-000000001Pc-0a7w
	for docs@lists.yoctoproject.org;
	Thu, 25 Jun 2026 04:31:37 -0400
Date: Thu, 25 Jun 2026 04:31:31 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH v3] ref-manual: add missing entry for build/tmp/deploy/spdx
Message-ID: <5d1922b8-dd2d-8a47-dc3f-fb3a8d017947@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 25 Jun 2026 08:31:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9879


There is no entry in the Build Directory section for the directory
build/tmp/deploy/spdx, so add it.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index ff84b250b..8529fe336 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -539,6 +539,16 @@ licensing, see the
 ":ref:`dev-manual/licenses:maintaining open source license compliance during your product's lifecycle`"
 section in the Yocto Project Development Tasks Manual.

+.. _structure-build-tmp-deploy-spdx:
+
+``build/tmp/deploy/spdx/``
+^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+This directory contains JSON files in :term:`SPDX` format which are used to
+create a Software Bill of Materials (:term:`SBOM`), as explained in detail in
+the ":ref:`dev-manual/sbom:creating a software bill of materials`" section of
+the Yocto Project Development Tasks Manual.
+
 .. _structure-build-tmp-deploy-images:

 ``build/tmp/deploy/images/``

