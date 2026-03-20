Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC6E4108B8F7
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 10:46:37 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9825.1774003592349731728
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Mar 2026 03:46:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=T2QPUK9e;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1E533C415B3
	for <docs@lists.yoctoproject.org>; Fri, 20 Mar 2026 10:46:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B6B35600E0
	for <docs@lists.yoctoproject.org>; Fri, 20 Mar 2026 10:46:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 154BD10450B9C;
	Fri, 20 Mar 2026 11:46:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774003590; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jz1xTMFM/njhNHtB4IXO81BIVY7182CPpc51NMn3/Is=;
	b=T2QPUK9e9AghKmUpgscs1sV9A5Cs5zHsYmBKdtmMLyXh4/NKItJNGfdnp7OiktqIL/EVZr
	ILkIOVH7mkbOSqv1iXxL4Q66wvsg0xd/RnS/gYWZakaTAz9r9V8kFUJBZ8NP2sSIG+1C13
	qr4QaG4fKeSwnDtxGGb2SKGuEhLqkcxINon5ZY400eqN4vVQSCbvL85ETgIj/0x/s6e/pH
	FbqqgKfmJWXjn6+UYC8BYlF2xmT65a8qvNIVo+OwgG0dLLfO128+dgtZDyR5iSqqvoREO0
	zsdzwpr/YYaOpc80bTO7cU6wLHbuiy0iPuAYK2oyI7B/UdKbkC8///lkUjscLQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 20 Mar 2026 11:46:23 +0100
Subject: [PATCH v2 5/8] ref-manual/variables.rst: document the
 SPDX_CONCLUDED_LICENSE variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-release-notes-6-0-v2-5-1bdb1eb142ae@bootlin.com>
References: <20260320-release-notes-6-0-v2-0-1bdb1eb142ae@bootlin.com>
In-Reply-To: <20260320-release-notes-6-0-v2-0-1bdb1eb142ae@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1550;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=9flgFEj5tHqyRwWu10D982KLgJJRO4cCrUPqvV9JUHQ=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpvSWBiIDsc1Q5WOD99SlZsTIkvOZIIBMtUBhdO
 QV9U7/fckmJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCab0lgQAKCRDRgEFAKaOo
 Nj10D/9w4E+9pUthDCfvV9eV6I0pYb9p4IYArAedr6wvBoz1vu+sT1Fb0u3Xp89V+6czh0/qEH+
 DJpjmQLynHjKfYuwO87BqcLEtTSX84RtFfvH5nX07A115rMKQpDYtVPZYa/esbLyKytjBDlJtNY
 C1f7oSQB7QdgUdEZcN3bfOJTxSaPm8lEm6jEXdtQb9YX9ZSnJohu1U0Q0m88WD7FDCeypw0AtXo
 jhe1W4SMWqZx7qBL85U87T0gK3P1PN7nitYCVqZF1KdD08i9l4B0rEhrsESXp5xDSwDRO6pIBYU
 t8ToZP0etuThxuSCewUjOTJ4v/niBGm9rYhnu+/RXo0iLcKOyHK7M5g2WrzUWUWimEWTXZ+iXp0
 sW6Dn3CTHFAAYeZxNRkvexi8vXHRRsI71JP983WfVwOmPApf+M6RkYAw3mOuLFq+vnCHSw6whWC
 o+uCKAVhtUU4BQOef/I2EZPAIKOxqzqVBnkEAeC8PYCI/agK5Iet0XJn8MtEBZSgPW+/G70y3bg
 B2j1ow4bBWUuLt6hxnjXrhnNo03vXCF9Ehvxwj65G4lDORyZeTMrGvbtWC0W+2bUJD50WY+y8x/
 RZ99zWaBmrQi5togGSVh7pfm/2KEzlvFFOtg0M4uLBR42mM8mgXtkEVgI2mg9E3g+lguXpmdLcn
 +4y9BEgkFThHYtg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Mar 2026 10:46:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9106

Document the SPDX_CONCLUDED_LICENSE variable, added by commit
bb21c6a429a2 ("spdx30_tasks: Add concluded license support with
SPDX_CONCLUDED_LICENSE") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 6c779e42d..03154a866 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9191,6 +9191,22 @@ system and gives an overview of their function and contents.
       (+ 0.07\% with the tested image), compared to just enabling
       :term:`SPDX_INCLUDE_SOURCES`.
 
+   :term:`SPDX_CONCLUDED_LICENSE`
+      The :term:`SPDX_CONCLUDED_LICENSE` variable allows overriding the
+      ``hasConcludedLicense`` object to individual SBOM packages. This can be
+      used when the license of a package was determined to be different than the
+      original license string value, after analysis.
+
+      This variable can be set in two ways:
+
+      -  For the entire recipe::
+
+            SPDX_CONCLUDED_LICENSE = "MIT & Apache-2.0"
+
+      -  For an individual package produced by the recipe::
+
+            SPDX_CONCLUDED_LICENSE:${PN} = "MIT & Apache-2.0"
+
    :term:`SPDX_CUSTOM_ANNOTATION_VARS`
       This option allows to associate `SPDX annotations
       <https://spdx.github.io/spdx-spec/v2.3/annotations/>`__ to a recipe,

-- 
2.53.0


