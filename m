Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50033CA6C9D
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:20:07 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6070.1769502002316480482
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:20:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=hhT6Xnpd;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CC7411A2A6C
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:20:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A51C1606F5
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:20:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E7158119A8695;
	Tue, 27 Jan 2026 09:19:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769502000; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wFnT7awETBxudAI63zbSBC+LPFCJomlvzlXHZnqVdGY=;
	b=hhT6XnpdS74H2neynR5T+3QJCy87EDG74WwG0XzYf31A9QVsEE9GpQ+U30lHOz0q4AIi3E
	vz7mp00yGp/NGUWmLzxylDSSxFes3rD36+D6+Dhiafr1OGF0dg1JgGU7plNRKgKmP+F7tQ
	ZWTD8w4+6BL09kr2FSiQvOT9+PX+POHU1McDSaq5foYXFcpLO2IFTqrtaVgkiAFSQTbyCI
	TzUzbDJggPDiVro2wUTFrAb1y+O/t1uIcUVnoFY6OMn0e4CDW0HU3g5IuGYhlbl47PMx6Y
	Lvy+a9UY9Bqq1Bq5Eig0N5fpjitdzBCbTqtr9mrBlvkqd+BJrX0oyReJ7Tu9YA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:50 +0100
Subject: [PATCH v2 55/56] test-manual/understand-autobuilder.rst: remove
 obsolete poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-55-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1302;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=XvBdEYiud49lGvLgPKSz7nkVP2sZSRZo1cSsu1lqEeU=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHUGHeMCc7nfiyLja5vurhgIm9d/kdJm4QYQF
 06c1OG8UL6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh1BgAKCRDRgEFAKaOo
 Nm5kEACn1adfMLBi+2tkH/wxR8dIwwdHr4v93uG4cBbH6PIu1G6l4FVqu4pdhaVdu1rezinNJWg
 ct0ItNDdEN03pwOlxwitaz7ydaD/3htowaBEa8nDNy+qt6r/yhB48hDxVu6fGhms97CI2fNnZcN
 JbNewBQNeCegmHafpI2kcTYasBhs0K/vSthHKsgbMINjCUvWjXM4jufvTQDShrj+PwO031smPBb
 CxHx1VsyY9erOzuYbGxEZ2HQPLWK3QZLhyvTNdWjnZuRQDznQdBBZhNB0quIUaHmS1i4ARVB3G1
 OuZdWW+bqS6CFcAqu7xNsMSYYsHvjdfFW433GwEiSMcho88yCjwJqF+t25ofzh5c8accyFYetuj
 +foNYTfmWcze4kyXvZHf9ZzFoK/QW5t/lm2QA8RF+Mm5F4QbB/PAJvgcYRikYzyLzvHl7mahgQ1
 JukTxl4IQN4ErRyj51MVvB7FCOiR1l/HNO48tSOOTD9l1Db064KBErerCYjzEQfOG93vxpWC63b
 RweA7jXBIQZDRCz/O5wQBaVXDubxMOeKb/OICVmiOIcQniufJa5+3Ym+1nJOJl4fjGK+YNywvgP
 h8RlSdReE+nQF4pl84X4dSunRwlNzghMr4gjVVQcrEwEwtZuCGopkx4L6QO3efWnt5EHR7irULV
 RZPpEGogle1++jw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:20:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8716

Refresh the document now that the Poky repository is obsolete.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/test-manual/understand-autobuilder.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/test-manual/understand-autobuilder.rst b/documentation/test-manual/understand-autobuilder.rst
index 23b3ef7d7..0015c2e57 100644
--- a/documentation/test-manual/understand-autobuilder.rst
+++ b/documentation/test-manual/understand-autobuilder.rst
@@ -102,9 +102,9 @@ roughly consist of:
 #. *Call scripts/shared-repo-unpack*
 
    This is a call into the Helper scripts to set up a checkout of all
-   the pieces this build might need. It might clone the BitBake
-   repository and the OpenEmbedded-Core repository. It may clone the
-   Poky repository, as well as additional layers. It will use the data
+   the pieces this build might need. It might clone the :term:`BitBake`
+   repository, the :term:`OpenEmbedded-Core (OE-Core)` repository as well as
+   additional layers. It will use the data
    from the ``layerinfo.json`` file to help understand the
    configuration. It will also use a local cache of repositories to
    speed up the clone checkouts. For additional information, see

-- 
2.52.0


