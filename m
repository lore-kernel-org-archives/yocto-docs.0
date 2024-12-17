Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB0ECE7716A
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 09:27:16 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.77666.1734427635546066823
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 01:27:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=O/nFbmLQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 19EFA1C000E;
	Tue, 17 Dec 2024 09:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734427634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BMrQ1XrXXlBy+FJHMn1QlBS4Ks94u71kb0omhCYvTSU=;
	b=O/nFbmLQThIpb9KQAQlOX4LsJL9xK9QnMv3zeNOvIoLi547bnPhdZet0SatWhsHQpV45yn
	pYT6VyJaOi4wjxuN0vWGIABYBjpzzEyJuFUS7oJvuVZYnkWlvZ6Pq8o6XZSOzc9HHGzdH7
	ui1Ev+PbWIhlFvtg0ciwwooYdQKVVltod8KudYBduzuSqmHYVBBCJn6INvQiO1aTSmwqye
	YaCrkR4M5P5JWHBFBc0QPivzJTtsTLLGKmpUD61ytM2Qx1rqc0Cj5mfI+UaxCqqhUQ4f0G
	RMkSPVqSsZCJbys/NqxV67vqS4NH39q5ycmxE6Tq68ajnJ2OW6kLdHXODX7FvQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 17 Dec 2024 10:27:02 +0100
Subject: [yocto-docs PATCH 03/14] ref-manual/variables: document the
 FIRMWARE_COMPRESSION variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-release-note-5-2-updates-v1-3-b189493b1b09@bootlin.com>
References: <20241217-release-note-5-2-updates-v1-0-b189493b1b09@bootlin.com>
In-Reply-To: <20241217-release-note-5-2-updates-v1-0-b189493b1b09@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1211;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=jJ8y1526btv4MPn+fOMKT/AUb/UUEtJHkg20U3nbIa0=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnYUPwZ+DYUZBEC0EJtCntnHx5Fm7szDcu2H5rb
 Tt8MAQUY1GJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ2FD8AAKCRDRgEFAKaOo
 NsqYD/9vMu/twC+OoOIGl5Qs0OiY44ChaMXfqIOpYpDM+K664B07g88Xgt4wlRIeJjo7dGFQ1Gs
 hscfNE2v0kL0SEsNbWzXouWhlweYOksDgA1BMPEWiv+G3za1/Q8wUUzQMt94eF7QiE/FUrvQys+
 QpZgC5dGKStE/GLiV5HO57Jtvxp8TohtzIUO+Y9NQUuqQ7F6GoWtEihEcOYKkKSrE5PXaU9Ifzj
 U4ZOWiYtQtn4w6jbSVZscnY5PEDIEB3iRJfsqcMRIDG0AiiUfU/UdIKyTif31DfRxFcs7pHLmrb
 HRDtuXW0deMtPZGBsr/YXIwZILBQ2eNdmc+ncse+XO1dPbdjx4K6WDFZlGEOoTxrOH7zqh9kkUD
 IOjB7S1XrqGg+87VV5E+PN2hdelAJFKOLlxfrP5UTi3OGGtTnodHX0q+Xfd/z8sumx3Uqqo3NX+
 HBW7oXIKhCiLetyfEZwzcoKaJyX7RI9Q12FuomltP/9axVcs+Vqr8GtaEp7/7tf7HpctcCrsH0P
 qgl8kIKhcghRydw1k8QMps/6rprp0QoN9XtqRiNqix6d+EWEk/SMiJTEbdmpsI92XFCAjEHMqnp
 AoSfNb1kUKP6MC7UQFT8nfMTuw+6HdKM6fyOuwIAn9oPUvuxqG5ulrWhCBKdAzAXYC4uZ7WoxUY
 7n6mo9bGlKCNm3A==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Dec 2024 09:27:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5935

Added in oecore after the 20241017 update.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index c6d3d1bba9961704fca25921b346d5282e118db4..5875ee3e7c554ffedf4af86e61c207d10aa46ad9 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3039,6 +3039,12 @@ system and gives an overview of their function and contents.
       tables, examine the existing ``fs-perms.txt``,
       ``fs-perms-volatile-log.txt`` and ``fs-perms-volatile-tmp.txt`` files.
 
+   :term:`FIRMWARE_COMPRESSION`
+      The :term:`FIRMWARE_COMPRESSION` allows compressing the firmware provided
+      by the ``linux-firmare`` recipe. The default value of this variable is an
+      empty string (no compression), and the possible values it can take are
+      ``xz`` and ``zst``. This can allow significant disk space savings.
+
    :term:`FIT_ADDRESS_CELLS`
       Specifies the value of the ``#address-cells`` value for the
       description of the FIT image.

-- 
2.47.1


