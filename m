Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C98D8FB44D9
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 08:28:59 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16364.1777019333448984348
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Apr 2026 01:28:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=KFxh2+dE;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DA7504E42AEE
	for <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:28:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B2F26604EB
	for <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:28:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0CB281072073B;
	Fri, 24 Apr 2026 10:28:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777019331; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XhJfDWpZ6947nuWyjb+2thjJ1FqUzyHDPGN6xMlOeAc=;
	b=KFxh2+dEzobmavmjGrjcGruRIkatzveOEJ33Ezd4OSP7tz15iI7P4oQGn2wTP9Va/nmFw8
	eqo/we0cwTdhBjRNhW8ge84lRQIGA0OCEGUVFAj+7mX5Kho6sEf5ZVlzCVR110uq/ilSZX
	P0KYrx8dolnVixeAQ12532xUmh5ci58f9Lj+hR2RJVs0PUTY5ULA9HgQUDUANi9lLwhy+4
	F7IQZsk2npO29IIWVIKB2tT7yEUwOBUSwGMjqRYm9WEbbpIlwYSXQJ6k40VuqydrNxS5f3
	ZMBtLrcqm24SpjSgXgFOWY4Hruy5AQVNOc+xEDFzK6t6JZSARy4JLjZFnsZtiA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 24 Apr 2026 10:28:31 +0200
Subject: [PATCH v2 03/18] migration-guides/migration-6.0.rst: document the
 CVE_PRODUCT behavior change
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-third-release-notes-6-0-v2-3-4feacf138e13@bootlin.com>
References: <20260424-third-release-notes-6-0-v2-0-4feacf138e13@bootlin.com>
In-Reply-To: <20260424-third-release-notes-6-0-v2-0-4feacf138e13@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1513;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=LUGei2d+AnU25l+rqMfzcK5ecQ42FSFgzlb+kI/qySc=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp6ym9wbY9KyRLtIHNxj6lL/x12kMwGHD1EnJvM
 0IlYRQ2UY+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaespvQAKCRDRgEFAKaOo
 Nj9tEACSnODRqfYkfuINxc1BPO0+E4guW/o0KdHQg/T3koww+7sve1zK5Q86TsIOfxpht65l0bs
 sahxkdBzZ/SAqLL2BPHBBJ3cz3r+kfCgI2rLDuariHhcskQYYnePJVxEHx7sqqOdGoqrQza+HO5
 YUVjm97ify15/uYnss6onM/D/esV/Uz+3+6tEzNqJ9Fwjask0NzmQuCV349tspZodfC8Aw/InN2
 ov2wdlOx/M4SBaoP3U6Hrlu23y26rvKMSDb1hDGpv7A8qtjbLG1Qi9Fp0qm0V7uyozGFkpDYC4I
 RZEuQzA+d5cliQPcn25dHfQZXTkDKWsO+dKbC/24p0ufDseU6XL7Fp3lBCWHiFAqdlutH65Zi+H
 hnGv6+IDf1GkmsdK6yMNxELaAmszpXHlQZZmrW1P1IbBwyCM9ya5pc5iLjMzmi+870dRNUiNSMc
 5lGMHWwdJ073Rd6HshdOizyNYPg3wl5El8hJy0sSc79fccIQYV7OmuqAsb0h/jMwCzevF7W4Tfp
 BqR4MNhN1pgrE0aosXRdGHKGicjP09zmxNCSUFRwsNyI8aUofmiiLm0m66H0z75r+u8d1uKWsms
 7BBtwLbHSP1p9vxEBLY2+GzExo6McUbFqMXL/+HpDkDitn8LPTU4f8ZzdbpCO7F+yK46DL6oUKr
 mRxpBiV4WdNf8uw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:28:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9340

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


