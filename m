Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF41BC0218D
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 11:14:30 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.17002.1738322067605460395
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Jan 2025 03:14:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hXrOgmlO;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E9FF1440CB;
	Fri, 31 Jan 2025 11:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738322066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uvK77Lxg8CYOBQGX2xqYqibajnwDeyPjMko40bK0tvQ=;
	b=hXrOgmlOsBw0GaiyMtgH38T3I48Nw70OHt5yFQ5I4QbdxxROvq1+dho+bQeiaZdjeVSLou
	CUiv2mYzkN1HvT2JfvH5XVA7MCQDlSAjXWqQRjMndWBHOM5xjMZx7pwVME/jPQb21YeWs/
	0mD+Li2o6rEFa4g/mDSYSkWC707BuwA404tJGBKWmuyOCN4v83xFJER3HrmBiTDXupE3N4
	yoZDKJtMqCaarM1hCR9+72ukRrQbcLqwHoqnuGXei4PhOQtKIHDnRPPxgEReRQgpxq/M7M
	8IjzPvT1UAsK9DbCibG0G4Q2Nx7BFAxh1s6TYYM2/Eyja09HmgVNyxok2Z+q9A==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 31 Jan 2025 12:14:15 +0100
Subject: [yocto-docs][PATCH v2 1/2] migration-5.2: document BB_CURRENT_MC
 default value change
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-migration-5-2-updates-v2-1-4ce688a74bfd@bootlin.com>
References: <20250131-migration-5-2-updates-v2-0-4ce688a74bfd@bootlin.com>
In-Reply-To: <20250131-migration-5-2-updates-v2-0-4ce688a74bfd@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1313;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=VbH8l8H+YDXAdo2x7Btu7iMxrUSBHs0JGFipsu5QAgk=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnnLCR7SH7OimSaFWPJIvTM7F1TVNejB5dAZ0cI
 BUtSNuTqL2JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ5ywkQAKCRDRgEFAKaOo
 NrUKD/9/U7tuPzDyNSr0ARu/77LOvtunZM/fQOoQdEQ+UEn0pc8q0M/iLHoTX4ptPzwfAIO/ViM
 KxhOLNGUtrzI8AeDVSLxnfaAgg/7nNKkGbC8QpaX7TTvCkVzCvW3RoykGpWgeE6H18+8AWfGdc7
 VGUoUDi97V+SBahw8rmX7BhL59kpNtEmaU8j2bSzutO693qchHTjFcHXMptiK/AWxMEXm0zFdSh
 M9g8QmHxY1sailsFxnSbfWvw2m+04q96fWIPrDOOeneuSrHBvo/FprNGOICjo4HkWdMOJ7904T2
 3vFABdVAOBfRpO7m9wHeV2lzjYZolA3FJvW5K9cTz6ttAcsRUj56VvuvoqbfN2vYsdGh8nwyvCj
 y7zOPBGOLRa1a8mmoy686QRRax46raW+dI3PzQgcOKOCXjSIwJ0sxBhp2KMU38VWSWoaP8LuOML
 R1/doHmhsDnUhXJmrM37ffkxLbeslHulFndG1MzsLlO0gysW8R4pGuIU3aFlSeNGORQIwOE62T5
 Dz8bbs4buMYgFQSO/HBNZsvsiyt4b+FQpgOAnRMkhG3DtLwvMX0ov77zdm+80ceDCA9EV5h6+PV
 sEFCYjemxtqjQDY2mkqxHrvOitgFi4QyHoFrQtI6sRXFKTv5V7zUeCuSommVqAGtj1lO00WBGe1
 cSkSue1kdmbWacQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieeguefhfeegheffgfeuieetheeileefheejkeetgfekueehueeluddvlefghfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Jan 2025 11:14:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6226

After commit 0fa0d8d764bb ("cooker/cache: Drop mc 'default' string
value") in Bitbake, the default value of BB_CURRENT_MC was changed from
"default" to an empty string. Document it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-5.2.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
index e9de6910e..a60e3e9a8 100644
--- a/documentation/migration-guides/migration-5.2.rst
+++ b/documentation/migration-guides/migration-5.2.rst
@@ -94,6 +94,17 @@ systemd changes
    not for socket files).
    Now all service files must be explicitly added to :term:`FILES`.
 
+Multiconfig changes
+~~~~~~~~~~~~~~~~~~~
+
+The value of ``BB_CURRENT_MC`` was changed from ``default`` to an empty string
+for the default multiconfig configuration to avoid needing to map the values
+within BitBake. This was already not happening in some cases so this fixes
+some obscure bugs.
+
+Any logic based on ``BB_CURRENT_MC`` equalling to ``default`` by default should
+be changed to be equal to an empty string.
+
 Recipe changes
 ~~~~~~~~~~~~~~
 

-- 
2.47.0


