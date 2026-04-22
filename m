Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D43B5F9EDE2
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 14:22:59 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.83813.1776867776289433175
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Apr 2026 07:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=L4nV2Nf6;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 31069C5C3CF
	for <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:23:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5DFF15FA8F
	for <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:22:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AFCE810460B10;
	Wed, 22 Apr 2026 16:22:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776867773; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XhJfDWpZ6947nuWyjb+2thjJ1FqUzyHDPGN6xMlOeAc=;
	b=L4nV2Nf6rw9KTQDElKTWCqkiKRm9cZG+K+ViAjKa21mbRf1PvtyqDNVrDI72M+pQD2rtni
	+YFYqQyb3epjLt1By4pdBcHLSeViqnt4CpzptqJ/y5LxHERCBvTHgvpsKPvkb0RI+Oxenm
	djSDO9KURIzfOp4eIaxoj4kAulhJnn7W93HbTHaXiGx3Rl2yjZJ6akSsJSGX7hRoePoBm8
	FTtDTQxJ/73eb5ZY2J6JrWfxw0V/BXUNU2xcIsK2Qisp4FT605S2Yu5s1yefq4yBFebzQJ
	MB18GXbwP6M/G+p3K3yrqNLHbmcmGzitkIjg5c5NWeZA3aDEVjeJtcK5Hat+3Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 22 Apr 2026 16:22:36 +0200
Subject: [PATCH 03/16] migration-guides/migration-6.0.rst: document the
 CVE_PRODUCT behavior change
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-third-release-notes-6-0-v1-3-06635e8648d1@bootlin.com>
References: <20260422-third-release-notes-6-0-v1-0-06635e8648d1@bootlin.com>
In-Reply-To: <20260422-third-release-notes-6-0-v1-0-06635e8648d1@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1513;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=LUGei2d+AnU25l+rqMfzcK5ecQ42FSFgzlb+kI/qySc=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp6Nm3OHieeFPWrRTlFN9OTMzanam+7PtGfMIni
 eoxtHtBXsCJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaejZtwAKCRDRgEFAKaOo
 NoYvD/9NoLW+1iBIvTvNnlsZlF7vbnJNZ4bumCq4ajVO0/OxUj5hG9+dWm3olLVT+YyFqaCIvqW
 BTYoBWP6B91nEooGmLbXN4Xg3juiNhetKR7LPwerOnodOFqzWFlyjTrKGAwPAlaXJCw+Sr+a8xd
 z8ljgz10EXITbteu89m2MC4Ni7OL4DHif0UOxwzv2q7KcEHusUvy4pO0JJ4IODBlllcGR1YOFms
 bi/Hs5tvupuIE1yKvpACpfFsySfjGTcXfuzmBXD3H4yAbkuSAOFd0yOWWVYqCZ2uDRuV7jx0f3g
 kuu7EcIzyFhClQ4QLwcGo6upip9Z8uTfF+NGv8GhFBLpQ5YkfmNWc2A2PpE7S6h6dhl5QN0n3do
 RCaT4E1aOflKXij07m4EjD/vQ7DRXDEc0ZOujEUofBS90D6z1oA5UUuy0bODXBGD/oRzUCf4kpC
 xDsmB4CZs5PDtyJWNMfPgUgPCxUFbqFWYtBnpn9dlPqVkz043QefZ2ZUM6xDJOXYJx2jQl4bzR9
 FbttmG1tVb1xh3LOyYFpTItAQNYc57+pwm2sdPQ9tXmf3jcOmYEOvZVkGkcyVsbptlnsK9T4sw6
 k0k8BsrcUM5GGO4w3Yj7yIuupAZsgGLauVV10KaymgVsstp5vQCa+ZVT8JdbfQxOVFG2WoElPhm
 n1ih9I3v8LiT8/A==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:22:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9310

After 9dd9c0038907 ("cve_check: Escape special characters in CPE 2.3
strings") and 3c73dafd03b1 ("cve_check: Improve escaping of special
characters in CPE 2.3") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-6.0.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/documentation/migration-guides/migration-6.0.rst b/documentation/migration-guides/migration-6.0.rst
index 42c688a89..d763062da 100644
--- a/documentation/migration-guides/migration-6.0.rst
+++ b/documentation/migration-guides/migration-6.0.rst
@@ -291,6 +291,20 @@ information.
 Users are advised to transition to SDPX 3.0, which is provided by the
 :ref:`ref-classes-create-spdx` class.
 
+:term:`CVE_PRODUCT` character escaping change
+---------------------------------------------
+
+The :term:`CVE_PRODUCT` variable, which specifies a name used to match the
+recipe name against the name in the upstream `NIST CVE database
+<https://nvd.nist.gov/>`__, used to require special characters to be escaped.
+
+This is no longer, the case. For example, the :term:`CVE_PRODUCT` variable for
+the ``webkitgtk`` recipe must no longer be written as ``webkitgtk\+`` but
+``webkitgtk+``.
+
+Users are advised to review their :term:`CVE_PRODUCT` assignments and remove any
+special character escaping.
+
 .. _ref-migration-6-0-wic-sector-size-change:
 
 :term:`WIC_SECTOR_SIZE` should be replaced by ``--sector-size``

-- 
2.53.0


