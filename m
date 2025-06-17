Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75B74C7115D
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 07:56:19 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.13063.1750146977473383563
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Jun 2025 00:56:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Kbo9KVql;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ED399442CD;
	Tue, 17 Jun 2025 07:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750146976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=alrPmIBh2LR+GZ5Db7RSFxpARTcCPnUtF6V6wJRDr80=;
	b=Kbo9KVqldzxd37JVoyNzNAobRSCwLnifA3qxKLvvgHjIX1FpLW/2TQmeHILml1eHbJXBgw
	gAKLrUm+YWasJkUMMVa+hajFnGoki7VebVvQxRWaWvuq7JOiN2sifv3GrGsmxt45vW52XS
	L2lpWyNQwqcueM8GXe6wdLD4YCxJEDnfYjBGnd4giQIVLPO6VpvUaeQYYjPO+aElvFIFte
	01DStVuGdGtDj9r3SzBmr0PIdHxkuKXZMAlxnKrTQhl1wJw/JcYUCJuSfQwAQrXe3PqJhD
	CTzPdPCs2YHb30j7WERyOwk38guG4feqyo7JfZahh4TX6R9ROK5CkyEa5ONi3g==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 17 Jun 2025 09:56:00 +0200
Subject: [PATCH 2/2] ref-manual/yocto-project-supported-features: move
 meta-exein to primary
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-supported-architectures-fixups-v1-2-e6c4d2c1cc3f@bootlin.com>
References: <20250617-supported-architectures-fixups-v1-0-e6c4d2c1cc3f@bootlin.com>
In-Reply-To: <20250617-supported-architectures-fixups-v1-0-e6c4d2c1cc3f@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1416;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=AbJYJnGdngkYasZobL2rHlmfuX8+IcgFnywEckTCgbo=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBoUR+fBTGElg/SAvyjBX+zu9HTY17EEvsP2A5vv
 qET39fDYx+JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaFEfnwAKCRDRgEFAKaOo
 NswrD/0QgN3EC0LlmkU7cMSI7h10JvVkQ+yImPpBZZdfpO13iWyss4O4mrq7EScO1hJbVYYepQj
 c+5nvppExOGn7rM67iLARPFCWVJ1GbOtRFUl7lOT5J1h8+ZNpUu0VogaN98du94e2ZbZJE9lzt1
 HwDul21HTFzhq+YbAmGyM8kUGlknRlyA53W2vkpIYW3OKE8Ooge4dIFzshEaoqTD9rawOOK/ju3
 9nvzeC4o/gs8tGBKgfP2yX0N6IIq45MWts9UZk4hWzFXUHfXP607oL9vgvbN6FSm+Vi8Mms3KOK
 T8rpEF06oyYBZX8WZHVEeNJWS1Dx1sqA6GBMOYKL43rcoHD9hhXP5m4ruUtOVtImcJExfsABu2R
 wYnsl+wMJHroUHSVCeVGqg+oKiubSAu0T8EFN4gEIsYFhGGgNYRBhNkIPE6WbuIb5AArm9YE1W9
 mm0NW0LPIaUmllqISievk34WvPdc9Stm+kccCarHuxWPBym6zaarl43bS5GYDIclGVTJupGv+Aq
 +2fFgjfhXWPk5RfYmG4VeUg2Ii/paVk6d3Z20tVKyAvXdeVMzBh7lv+heNqh9Whtwy8JDsIY0Lp
 0uTc3B4hoAgkVNg+Ak/87DTXStzyzcOs6lG0/bwxXEoaej40uG1oK79eNOdVMPbMv4keZGYAqqu
 f2maHJ/PMAleltg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvkeekfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvdekvedvgfdvvdegueeffeekuedttdekhfffteehteegieefudefgeevvdeuvedunecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpghhithhhuhgsrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhop
 hhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Jun 2025 07:56:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7079

Exein is a platinum member and has primary support
(https://www.yoctoproject.org/members).

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/yocto-project-supported-features.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/ref-manual/yocto-project-supported-features.rst b/documentation/ref-manual/yocto-project-supported-features.rst
index 57bd789ba..345280d67 100644
--- a/documentation/ref-manual/yocto-project-supported-features.rst
+++ b/documentation/ref-manual/yocto-project-supported-features.rst
@@ -88,6 +88,10 @@ Below is a list of primary tested features, their maintainer(s) and builder(s):
      - meta-intel layer testing
      - TBD
      - meta-intel
+   * - `meta-exein <https://github.com/exein-io/meta-exein>`__
+     - meta-exein layer testing
+     - TBD
+     - meta-exein
    * - `meta-virtualization <https://git.yoctoproject.org/meta-virtualization/>`__
      - meta-virtualization layer testing
      - TBD
@@ -244,10 +248,6 @@ it is on a best effort only basis.
      - Description
      - Maintainer(s)
      - Builder(s)
-   * - `meta-exein <https://github.com/exein-io/meta-exein>`__
-     - meta-exein layer testing
-     - TBD
-     - meta-exein
    * - :wikipedia:`MIPS <MIPS_architecture>`
      - MIPS architecture testing
      - No maintainers

-- 
2.49.0


