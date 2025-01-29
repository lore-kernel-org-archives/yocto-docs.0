Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78A52C0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 10:26:35 +0000 (UTC)
Received: from relay0.mail.gandi.net (relay0.mail.gandi.net [217.70.178.220])
 by mx.groups.io with SMTP id smtpd.web11.9565.1738146386436476274
 for <docs@lists.yoctoproject.org>;
 Wed, 29 Jan 2025 02:26:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bELgLN6h;
 spf=pass (domain: bootlin.com, ip: 217.70.178.220, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 877A344081;
	Wed, 29 Jan 2025 10:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738146384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WraRbABKnXx1CgavqJVX7HKo49JyjtL33jCN8y63Y/0=;
	b=bELgLN6hxO1PKDy2FDmwBj4n4OOy2MjR6sb3s7762ntgL1SkMyb1gD1w3lvtw1+Ojvtglk
	+obuk49NqHUMsd+Bxd6ZXp1IwRUVBIpE8iwjqtW+Wy1i3FlRsUk28KrxkjrHFBRZn1HfjB
	muNRrna5399IFVQz8cdfausgy+TlTJjyxLHsC0QENSLUQ3O75cQ0B6VSxKCvJ/ImdJNacC
	g2TLhd4ZbiB6eygoToPLVyEcvjx4xgU3bq2wnbuV5O3ioGmUz1r1vDBy0G1hiSBZtdCyrR
	3ZEKlAe+s3fABA5j5uShXJNDXU1Uc9V0MApMxlONAI1fAkzDcLVp7Kh+tAyHAw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 29 Jan 2025 11:25:58 +0100
Subject: [yocto-docs][PATCH] migration-5.2: Add entries for virtual
 provider and multiconfig changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250129-migration-5-2-updates-v1-1-98416a476828@bootlin.com>
X-B4-Tracking: v=1; b=H4sIADUCmmcC/x2MywqAIBAAfyX23IJuGNSvRAfNzfbQA60Iwn9PO
 g7MzAuJo3CCvnoh8i1J9q2AriuYFrsFRvGFgRQZpanDVUK0Z7HQIOF1eHtywsm1unGKnG8MlPa
 IPMvzf4cx5w9rzhIWZwAAAA==
X-Change-ID: 20250129-migration-5-2-updates-cb613b02bd35
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Richard Purdie <richard.purdie@linuxfoundation.org>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2411;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=aIxODHvVxUDLBhx3CYAZ8UV94QPy/saafkCmX6VTej8=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnmgJQlPqJE3dqSvdig3n0M1p+wr2eXPDdxqyfl
 j2XmGqeuuSJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ5oCUAAKCRDRgEFAKaOo
 NsfiD/wMi77zqGEYqjfzb8SPVg3twLgAIXRIl7AkNoMicOyzebPr1VmhK1Slb1+ogwn3KUq45By
 +P5sbEdlhqa/HL8ZvyKjCSFyDEeegfOBgtQPGQ7q7sx9ECgbGf8AAx33APvPuZb6BtwH3EsMiS2
 253/ZTDeJTi+EQ0dRrgNm/OCV51MRFrNkbF1BK2+3qPD6w5DCbLtpDsiQvZpNMB/E8xaPJitcSO
 XySYZrMcERVycjXscmkcV2DNiGEeBfI9oupYGqu6fyuSnGxWrat5aiwS4UNnWeSIzbRN9+4AhDs
 VPotkYmv0+GxpLMkvHDGHapasQFJoQRwfo0NhKlCIS0X/RpxYtnMLc0hbDdG1+7ejrCrj/McXie
 hyJi89UhkS5C9pJ/wTofNDxzPLD5BgQYZYXr/09W9kExqN/TTFk3siyIYZBgihkLVOx/VeahyrV
 F2ay5PR+FskqnuOXsb//y4b3yLMd/cfy9luhf1tgVCnbj69pHb1ywj1Q+l9JXdAuEuuAIzPEEhA
 oMd3iQRjbD45s1WmzS1AQJvjLe50WAfsu7eKStGFzHSknpsLRCrDpsLAEB11D/w5cl0dp4sTCSD
 Z1wPTlyYIkOXa9hQvwFmplkZfl7b1tBbx8V6o96nPaIFg21uikBR/SbOTMQeq70JtXAupE0uNDl
 +NeoY/QE/MfJt6Q==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgfeiheetkeeiffeludeiveeugeeufeetheeihfetudegfeehiefgtdehffevvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhli
 hhnrdgtohhmpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 29 Jan 2025 10:26:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6209

Add some information to the migration guide about two important potentially
breaking changes in 5.2.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Notes:
* original patch by Richard Purdie:
  https://lore.kernel.org/r/20250126111850.2609298-1-richard.purdie@linuxfoundation.org
  This patch is just reformatting/typo fixes.
* The BB_CURRENT_MC should ideally be documented, but that will come at
  a later point with
  https://bugzilla.yoctoproject.org/show_bug.cgi?id=15709.
---
 documentation/migration-guides/migration-5.2.rst | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
index e9de6910e..245c22f28 100644
--- a/documentation/migration-guides/migration-5.2.rst
+++ b/documentation/migration-guides/migration-5.2.rst
@@ -94,6 +94,29 @@ systemd changes
    not for socket files).
    Now all service files must be explicitly added to :term:`FILES`.
 
+Multiconfig changes
+~~~~~~~~~~~~~~~~~~~
+
+-  The value of ``BB_CURRENT_MC`` was changed from ``default`` to an empty string
+   for the default multiconfig configuration to avoid needing to map the values
+   within BitBake. This was already not happening in some cases so this fixes
+   some obscure bugs.
+
+Virtual toolchain provider changes
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+-  Support was added for virtual providers on a per-recipe basis for specific
+   key toolchain providers listed in ``BB_VIRTUAL_RECIPE_PROVIDERS``. As part of
+   that support, the ``cross`` providers were simplified to remove the triplet
+   prefix and generalise the naming, so for example::
+
+      virtual/${TARGET_PREFIX}-binutils -> virtual/cross-bintuils
+      virtual/${TARGET_PREFIX}-gcc -> virtual/cross-cc
+      virtual/${TARGET_PREFIX}-g++ -> virtual/cross-c++
+      virtual/${TARGET_PREFIX}-compilerlibs -> virtual/compilerlibs
+      virtual/${SDK_PREFIX}-binutils -> virtual/nativesdk-cross-binutils
+      virtual/${SDK_PREFIX}-gcc -> virtual/nativesdk-cross-cc
+
 Recipe changes
 ~~~~~~~~~~~~~~
 

---
base-commit: e6745669cc26de8f61d5d1ccdd5a95b552eece97
change-id: 20250129-migration-5-2-updates-cb613b02bd35

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


