Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D1FC3601E
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 14:08:51 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.14287.1743689330465295165
 for <docs@lists.yoctoproject.org>;
 Thu, 03 Apr 2025 07:08:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=DWnIKKpw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DA811443FD;
	Thu,  3 Apr 2025 14:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743689329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hmxRoaju5d9Sv0cznd1gWUYFPHjIKJv6rE6uGrCKf48=;
	b=DWnIKKpwUIUTXBCUNcxun8X9qxZnCbrgrK6y494y2bij2b+5EoMlSPHxWPMMTboSqrr/+S
	oJzw8agsvGN5sblFg929at6MXXbFnqfd5WUuRIHBfSoLwpfm/4MmbLgRwarq44m48NFfWp
	XLevpmg/HU1CbAZMC3BfdyeAYJmxsxUkvKZfCvBnrbI8X43w8sjXtwfdY3wbxomZL+hpTa
	sVRLGJ8F5guL0WPNGpZ49Mea0tdWMYck7CcyRnIgepK+K5Efed/sQ5CsACIORCum9oSiKi
	fQnY2R1bIJqKF23FzjSx1ct8zQG2JpoqlrwSCsbeqXHMIjJu8mv3v5WCZeh6LA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 03 Apr 2025 16:08:29 +0200
Subject: [PATCH 2/2] migration-guides/{migration,release-note}-5.2:
 improvements and fixes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-release-note-5-2-updates-fixes-v1-2-13d16361f17c@bootlin.com>
References: <20250403-release-note-5-2-updates-fixes-v1-0-13d16361f17c@bootlin.com>
In-Reply-To: <20250403-release-note-5-2-updates-fixes-v1-0-13d16361f17c@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3712;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=cDb13Hf0WJyEqN7b+MYmo25kfVq4mIYMR25/L5XleLo=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn7pZvtnUUIcWYbt+2vUl1Mm5f/DLibz5NEJDn+
 4ejlK/Aq1eJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+6WbwAKCRDRgEFAKaOo
 NqXyEADGrNDjtvg3tvFmrczvHazLf+R1qpcGwUuL5OKgPVUyGTm9ZdYfG7fPKJ/M/s3KlW6Hzx2
 kGDkxs9eDPZLi4ItxyQuKsUAr5HLU0S/xA97NKgPnP8H4hRYwoc6ChV6IDOEsHuoLpvNO0/Aadw
 Lu+vzCAc3WwnjxhAHVcE5MZ8qJOAwSAFgEa+M1PXP/0cBnGf4FB1p5jlROGN0f2R0JDD0WiYYJO
 f5hTttMaOzV2mz94XnHN9BvOf22NNq/sRDTdc8Jueps3LGWrqQTL3Rn4cjmZpdYVUT+u9mVT8Qb
 5jln4agfyO6AB2rYO5Vz0iOonaY7OiFazG7XJCuu13rkZn2qq8I5sqW0gMwLIe/asy+ecIJ1F0d
 ArkpZ3SuBs+BcfMNkqxW/aweqGemA6qE7Ytim8FkIQV9+hRDQPaVsg5fUWKxOa/ftSe+Fc0KFJy
 QAKFNuL+x2C+FjR/mcZozgFmDqkwti2SdY4Gshbde56WmP/IbxIC1REcxeXWvJ3pMti08WEMCt1
 bQGf5OSar53zs2l1tK8d4QXcd0MqhfHIH36fZRzx/2/y93cBIkGKQFsuW0oL88u4gph9NeGghyM
 G8cftO9plPOPh/0exoSxVy+ugYM8FurGcuv35G17JODzuUrKCl1LSoFyExqqH1MqYzGTDBmgaeB
 883p0wlc6VKYN4g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeekjeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeukedtudeliedvteetkedtkeeivdfhhfdtfffgvedujeffhfeuheeigeethfefkeenucffohhmrghinhepshhomhgvrdhhohhsthenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvgdprhgtphhtthhopeguohgts
 heslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 03 Apr 2025 14:08:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6705

Address some of the reviews received on the release notes and migration
guide for 5.2:

- Remove the wget fetcher addition, I misread commit 0a9f90ff658e
  ("tests/fetch: support setting PV in the wget fetcher") from BitBake,
  and it actually affects the tests for the wget fetcher, not the
  fetcher itself.
- Add a way to transition from the branch=nameX,nameY syntax. From what
  I have tested, I achieve the same behavior when using one or the other
  syntax.
- Remove the default value for SPDX_PACKAGE_VERSION in the release note.
- Fix a couple of typos.

Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-5.2.rst     | 10 +++++++++-
 documentation/migration-guides/release-notes-5.2.rst |  7 ++-----
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
index c54f054c7..59f21ff4c 100644
--- a/documentation/migration-guides/migration-5.2.rst
+++ b/documentation/migration-guides/migration-5.2.rst
@@ -193,6 +193,14 @@ anymore::
 This was rarely used in the core repositories, and this removal simplifies the
 code logic in several places.
 
+If one of your recipes is still using this mechanism, you can split the
+code source fetching into two separate entries::
+
+   SRC_URI = "git://some.host/somepath;branch=branchX;name=nameX \
+              git://some.host/somepath;branch=branchY;name=nameY"
+   SRCREV_nameX = "xxxxxxxxxxxxxxxxxxxx"
+   SRCREV_nameY = "yyyyyyyyyyyyyyyyyyyy"
+
 Git fetcher: Branch parameter now required in :term:`SRC_URI`
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -242,7 +250,7 @@ The following recipes have been removed in this release:
    :oe_git:`openembedded-core </openembedded-core>` or :oe_git:`meta-openembedded </meta-openembedded>`.
 
 -  ``blktool``: It was created in 2004 as an alternative to hdparm and never
-   updated since (while :wikipedia:`hdparm <Hdparm>` remains in active.
+   updated since (while :wikipedia:`hdparm <Hdparm>` remains in active).
 
 -  ``cargo-c-native``: converted to a target recipe and renamed to ``cargo-c``.
 
diff --git a/documentation/migration-guides/release-notes-5.2.rst b/documentation/migration-guides/release-notes-5.2.rst
index 05fc92e85..2ad441449 100644
--- a/documentation/migration-guides/release-notes-5.2.rst
+++ b/documentation/migration-guides/release-notes-5.2.rst
@@ -44,11 +44,10 @@ New Features / Enhancements in |yocto-ver|
       uses.
 
    -  The :term:`GRUB_MKIMAGE_OPTS` can be used to control the flags to the
-      ``grub-mkimage`` command in the context of the Grub recipe (``grub-efi``).
+      ``grub-mkimage`` command in the context of the GRUB recipe (``grub-efi``).
 
    -  The :term:`SPDX_PACKAGE_VERSION` variable controls the package version as
-      seen in the SPDX 3.0 JSON output (``software_packageVersion``). The default
-      value for this variable is :term:`PV`.
+      seen in the SPDX 3.0 JSON output (``software_packageVersion``).
 
 -  Kernel-related changes:
 
@@ -345,8 +344,6 @@ New Features / Enhancements in |yocto-ver|
       -  ``wget``: increase timeout to 100s from 30s to match CDN worst
          response time.
 
-      -  ``wget``: Support setting :term:`PV` in :term:`SRC_URI`.
-
       -  Add support for fast initial shallow fetch. The fetcher will prefer an
          initial shallow clone, but will re-utilize an existing bare clone if
          there is one. If the remote server does not allow shallow fetches, the

-- 
2.47.0


