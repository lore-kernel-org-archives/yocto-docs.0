Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26398C36016
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:21:21 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.61727.1742894477693401062
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Mar 2025 02:21:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Kdevn0j3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 17780441FE;
	Tue, 25 Mar 2025 09:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742894476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=utZUm6JALVqFiuCJ3+oE6FkevW2aX34/xq2MPZ/OujU=;
	b=Kdevn0j3Oy/UbUFnhuJqmTQa6Fr/E5CIrsQpUDvnR34LdQ+9gfdU7xdXqIkztydsU0kKFG
	O6VYvKTKH06TemeE/qZ150IDgHva+WK1vgTvhqNq6N5QOrsPkP1g7Z7EK9yajSHooOjoEn
	wyVRPxrD9xvfTR9oScsdncWSlUxUtqesPv5JnF5CaThcdGfrnAAJRsNjPUbLZ1m7hWM2hN
	cmReoY5b5tvHpz+l4uKX4xfUbzASORo6ufK+5PbyMVVtevsfGTIJk18Sk3Lj1TjXJnCE02
	ek7GluHLCeLTAECmz/nWB5/yli37gcYq3DocyhgkJsTixWqNsYztKsVxeMspJA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 25 Mar 2025 10:20:46 +0100
Subject: [PATCH v2 02/12] ref-manual/variables.rst: WATCHDOG_TIMEOUT: fix
 recipe name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250325-release-note-5-2-updates-v2-2-19f050d61da3@bootlin.com>
References: <20250325-release-note-5-2-updates-v2-0-19f050d61da3@bootlin.com>
In-Reply-To: <20250325-release-note-5-2-updates-v2-0-19f050d61da3@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1056;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=JkmjJBb+p0UVLBJG9tdgj/gV3OUYKYgwsJa9F1GG9qs=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn4nWKebVwQi7ooRxQqm1Ud9vE9svBmHvARNQ7O
 VDOFhIFcm2JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+J1igAKCRDRgEFAKaOo
 NtsgD/9FNudKnLl9ALa/4Gt/8kPewcy0//ZAhoSK3XQ2ENzZ148FTpmHfbXQ1efBQRMb8NTAhLY
 sNB3BDZkFDQviN8bqjqvAKFvnG7nXIGB6Rnga01ErgUrKdF997aVpoVyRBe5043+VD2ivzKzurs
 vtu4lFYgnI+NAe+ok37fIQObGV4lB3M2VTaT5IDfQxDABH5N88v3O+W8ySG3qUzIZ3BhFnaEYEG
 jIzDfLh6pAO99+4wP1GvyygWpU4omassVD5l1FcFSGU1QdkCh/E6v6UW6Mr29f6ne/Jv6LAyXAR
 EX2ir+qaWLDuAT384IPwPaTbx2WvE3Adwt8Wi/UDXC3Gau0ANLC4zmsJYe0ydEe+4CnpInB5KvK
 raRGIk+pBwGR+HRYKuDqOzSTNsRY4mNb+kcu93iwK/GdFsPeULzSEGspgkFiMcn216ejNIL3bty
 /m0KgxVdirgbOy+HaocHngsYQm5MMJVSlQts2G3wqAc7YGlKVtUilvAVwotPcHCPtZJhEA+Fw4i
 f4ZekM3X11hptawQj2j6ulh+vaupVFdwfOfVPtrjbdvD11U59m20E75sH2G/I1KV034I0Bo4wZ1
 VVKGYgJG+PlGK2hzPfaR5qTuaDFhiAQsKPla7LEyFqnN9tcmbVYeqBEPB8an6InVusZXPHFZ62y
 E4/WzKdfbu57imA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedvvdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieeguefhfeegheffgfeuieetheeileefheejkeetgfekueehueeluddvlefghfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Mar 2025 09:21:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6615

This variable affects the watchdog-config recipe, not the watchdog
recipe.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 8e0833bff..ee7244dc5 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -10614,8 +10614,8 @@ system and gives an overview of their function and contents.
       ":ref:`ref-classes-insane`" section.
 
    :term:`WATCHDOG_TIMEOUT`
-      Specifies the timeout in seconds used by the ``watchdog`` recipe and
-      also by ``systemd`` during reboot. The default is 60 seconds.
+      Specifies the timeout in seconds used by the ``watchdog-config`` recipe
+      and also by ``systemd`` during reboot. The default is 60 seconds.
 
    :term:`WIC_SECTOR_SIZE`
       The variable :term:`WIC_SECTOR_SIZE` controls the sector size of Wic

-- 
2.47.0


