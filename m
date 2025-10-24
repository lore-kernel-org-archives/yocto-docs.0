Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD407CCD1A5
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 08:20:38 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.4945.1761294035505378289
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 01:20:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=R1h4W8kq;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 336661A163D;
	Fri, 24 Oct 2025 08:20:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0ADCC60703;
	Fri, 24 Oct 2025 08:20:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2B4A0102F247C;
	Fri, 24 Oct 2025 10:20:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761294033; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xh0pp5h7c9qAEp5wVXjcDLdUmiykHz6YGUsojGpxG0U=;
	b=R1h4W8kqeen3waxWLRLlASbHUqJScEgCd52pnZvqc6JXxCRVPMkpygMagQv2GVkS0gxl1A
	rpS12QcSjBMKleHQgIpLo+KgZJCeFGk0d2UStqMWC1HK5AQNYAvKiGyHmsqVqKcWSfD51O
	AcViFjVmlM9ManXy/PP2nlyKJGGCACm/qU9bTLzk4OLIbALP+uv1roCdGD4bLwRaJGzyYW
	uCB0CsFiy3uRGVt4KuksCDyDUTaBR3SQ1JpoqhruD+nlFTQXLtzBEUc4ASrqmRs5oBp2Y8
	OhPxm8Nc41OeHmMacKcHPgGiIaz1GbVtkscjTyG/YQRwyQenyFvdrlly3XL/2Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 24 Oct 2025 10:19:56 +0200
Subject: [PATCH v2 07/16] ref-manual/variables.rst: document the
 REQUIRED_MACHINE_FEATURES variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-release-note-5-3-second-hunk-v2-7-d15dabc095d0@bootlin.com>
References: <20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com>
In-Reply-To: <20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1605;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=0Cmjlx/rVYWkxcnDcVl73Z7xX6E5TIzr5KaChWYd8d4=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo+zbJ9dRj2cQ++uX4+uSOaOVGdcMz334fOlb2B
 2LXrYAxX32JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaPs2yQAKCRDRgEFAKaOo
 Nqu6D/41D7V4FD1iPXn2u9lTB1/nL62BrTp5l65Rz+rlC7LM5kwcPrUR3xTYu8a4CXuRgJBt1JJ
 NgI8vTB6zY2lNf1dAO/3HplwWWMbpJRRO8qU9peqQcBWB1p02Ua9pxfZVjUtYZrM26BrPLjHJd0
 yf+qaCexoJwl6Dvu8rGZFTGvb8dVBnrXGf/I5dn/lbpZk89lP+RWnIlcNPCmiOP79iQ9zgdbaQc
 Dx29bZxotTIOnM1Ea0Eg5BCVJQ5SzWma84vMPQm++/MhjvJTeWh1uU0O14B++iQ0diim6p4XHCv
 FhhTH0gKNxvz0n3EiDIum0EYBKAZlPD7Fk/M1mtTCaoSZ3K/t+FG98JWlMMegCSTy4sdiZPw0Vd
 nVAC6pNKsRVPWCRG9tCKS+sGu4Wr+ZIh3ku7zqV+T80aGxlBju0lfbzAyN3L30bnfmfEdIu192M
 46VN1GWZdKEHheFRHfScW5hVeVDOiAaoHayM2lSmkkR7jx3k9kDbQZgiQxkg6985WaBgKLmejki
 OIkuWmPkZfFoagyjlNgdg8uWyxoGHHiZ8MlXxxzz7lZ9ikTYEpTCPH22iZgj9VZQb5/DwPV0ylE
 YzZZAv8TgXXPMvfKcmE+IZnNQ7O8mWIJzlC5Nsw+Q521doHXmS9iwm0NCt/qDWYQ0k5ALr3zl6b
 xB1AFcjYqMtlkRQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:20:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7796

Added in OE-Core commit: 5f4875b950ce ("distro_features_check: expand
with MACHINE_FEATURES and COMBINED_FEATURES, rename").

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 27f761b72..5b8e0f7ce 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7886,6 +7886,15 @@ system and gives an overview of their function and contents.
       the recipe will be skipped, and if the build system attempts to build
       the recipe then an error will be triggered.
 
+   :term:`REQUIRED_MACHINE_FEATURES`
+      When inheriting the :ref:`ref-classes-features_check` class, this variable
+      identifies :term:`MACHINE` features that must exist in the current
+      configuration in order for the :term:`OpenEmbedded Build System` to build
+      the recipe. In other words, if the :term:`REQUIRED_MACHINE_FEATURES` variable
+      lists a feature that does not appear in :term:`MACHINE_FEATURES` within the
+      current configuration, then the recipe will be skipped, and if the build
+      system attempts to build the recipe then an error will be triggered.
+
    :term:`REQUIRED_TUNE_FEATURES`
       When inheriting the :ref:`ref-classes-features_check` class, this variable
       identifies tune features that must exist in the current configuration in

-- 
2.51.0


