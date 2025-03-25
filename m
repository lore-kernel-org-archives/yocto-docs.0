Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F59C35FFC
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:21:20 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.61361.1742894477577542147
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Mar 2025 02:21:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ohd3IaZq;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3C17F4327D;
	Tue, 25 Mar 2025 09:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742894476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oI55ZlpY/soEXcmBmtn6vcEdcx9lMNHb9/7nHPWhB+o=;
	b=Ohd3IaZqCDWe+5riZPA0pIuTC8ZwnrRcOtJMAFWqDMgbD+B3/xrm3rHcBpmrVs+7UuWop6
	QN9KXRPkMLPbaGrVr25T+lhzT2GT29KFOPLV6iJMZ3htWW4m6BWTttUFU1odUJyeVKamku
	Y3ZuvqaeaIhhPTvnYKtqiF4lEIBsLa16q7VMZAMo4hspKdpArW454Ei2ZefS2voJURSio8
	aHncT2XNFmA64ak4TBiUeEyTIr790kFrL/DH2JksTxg8DliJHDQvPbCbo5+kh9cQzuMAHs
	yLA71wZC+NzLq0rtTNT2atLjjvtodaRnz4WeDeQG+aGIXCNVkHvxXbrGFRc+AA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 25 Mar 2025 10:20:47 +0100
Subject: [PATCH v2 03/12] ref-manual/variables.rst: document the
 WATCHDOG_RUNTIME_SEC variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250325-release-note-5-2-updates-v2-3-19f050d61da3@bootlin.com>
References: <20250325-release-note-5-2-updates-v2-0-19f050d61da3@bootlin.com>
In-Reply-To: <20250325-release-note-5-2-updates-v2-0-19f050d61da3@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1062;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=2e8/9pZwzpyUu2ipup2lVqcqScwxXaDQrrbyWCWNRPY=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn4nWKuJaHqUuejvtMk3kdBoIB4NsVWfZacXdoa
 2UFOIDjfLWJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+J1igAKCRDRgEFAKaOo
 NkclEACjUziPYhnq7QS3GD9X0/pjoPwJMH/co0cZVd4joZR0aUqrs64zHB/3GBa9+plcyyORdf0
 aWh/kwxxFtGUUphzo5rl5F9hJg4+HN3tjiPGpzwVl3DuG3g9UErqZbE1REmJJadHPc+0sxFr/wA
 6fs86RvSuX4ekVFwyl4YDrN1A5KhxFfaDMmvWMzyzQ4px+xG6vezvMKUolcCNaeNUWOF7NY7buv
 k3yz5OQnruHBFDSF/Lvr1yOFBroIXiDQOCrkyTIJRlp/Id5e0c3Y2K+mKlb3K3x3Cs9U+uG+T2s
 OhSo9pjxndwnxmeBcHS6Kqhj/bGEwxR2+jFBg5NM9K1krqaYsgwmqU/fUf4FaiaRxfVSwQZtV+z
 Qwp7AR4MXhRYSVpDbcccQbZSSekmxlT5RivCoN2rkM0tGslT1zYqeqdugnOCAuNF+PI2bJtQatN
 BurCIlLwMa9QcJAcuYDZDdwYIC6SgrSqAedGIMQBEKM00SKqmF2cTAmHAwcmv8+0IijzX3Y+szj
 M3WFu/wqTL4/e3gLvzZ7b7GwnrySvytc1XYWp23mY0SZUsPCLd5lN4UePqy9cGBeGhCVqMozs7x
 yx2Lx7X3EocUkjryZFJXPPvup90MUR4N6N4krVdR3HB5czp/POITxB8JztYMxa1RADYa7ny8NUV
 Tu1eiPnLVEzOtNQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedvvdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieeguefhfeegheffgfeuieetheeileefheejkeetgfekueehueeluddvlefghfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Mar 2025 09:21:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6612

This variable controls the RuntimeWatchdogSec option in
/etc/systemd/system.conf.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index ee7244dc5..70ed7db4d 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -10613,6 +10613,11 @@ system and gives an overview of their function and contents.
       can control with this variable, see the
       ":ref:`ref-classes-insane`" section.
 
+   :term:`WATCHDOG_RUNTIME_SEC`
+      For the ``systemd`` recipe, this controls the value of the
+      ``RuntimeWatchdogSec`` option in ``/etc/systemd/system.conf``. The default
+      value is an empty string.
+
    :term:`WATCHDOG_TIMEOUT`
       Specifies the timeout in seconds used by the ``watchdog-config`` recipe
       and also by ``systemd`` during reboot. The default is 60 seconds.

-- 
2.47.0


