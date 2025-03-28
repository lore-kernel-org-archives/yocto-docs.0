Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B4C5C36013
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 13:07:46 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.10700.1743167256085288673
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Mar 2025 06:07:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=acHQHjId;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DEB04441A1;
	Fri, 28 Mar 2025 13:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743167254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1ZwnHCmp63EAggyoXJit1TNwJkl2Qon0Ygs+K1Fn2GQ=;
	b=acHQHjIdxxbumXBbQioP95kaMbgXg0fNYLFJfMibTbZ8fphCnol/TAoQrQbPnZ0Xw95IHp
	ifuGDdrw74/LJ7TkD1ll4A8XcOnGPDhlbdNMybItPDLTLsNmEXXCC8TZNkclZ2aF+sNmZO
	DwWAKhQWuVAJfQI2gIVBqZKn/HRu50xu2RhP4V3SUSN7Fyl4DueIfmh3Ql6eiuoYXSSJeF
	8yzNowJil58LVxKwvtHdAL+GxXIimd+136PcPK6msaTe5OBgSAPgO3fNMhz0uLumw66uO7
	Bwmd/LlDLPk/C2Mb/Etoha7m7Q6hvHQd0R+TK5ATpzgQ0Jdofwlc8y2u5u79rg==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 00/11] Final release note updates for 5.2
Date: Fri, 28 Mar 2025 14:07:03 +0100
Message-Id: <20250328-release-note-5-2-updates-2-v1-0-c913513e9140@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPee5mcC/x3MQQqEMBAF0atIr23QaBj1KuIiTr5jg0RJqwji3
 Se4q7epmxRRoNRlN0WcorKGhDLP6Du78AOLTyZTGFtU5sMRC5yCw7qDLRs+Nu92aKpmGq2vbdu
 0o6c02CImud55PzzPHwqWGsJsAAAA
X-Change-ID: 20250327-release-note-5-2-updates-2-8fb5d45989bd
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1757;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=e+01kZ38/a+h4TY3ZWy8mQjSskQzbtQfOlOZnhzEqpY=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn5p8UDClJbrRRM4adsDmLYwTOUF0cTm+rWf30b
 IN3NJOs/gCJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+afFAAKCRDRgEFAKaOo
 Nvr9D/9dIcLdvL5YV0kGmirwv7yf0PcmhUsMm7tBRgVhWlS2La9ZCnDBbnJhnCLexrgxspnIFNa
 mC9RZ/BdsPcfzQCrz5khnI4iWZKWUkgrxbdrZM4cBdvrreIOUVd7Esx4WzxteOC3CQGAE5WP1zi
 USfefSLcPCn/lOrIcMhBKFUWs/yAIGzFXP8A8pixfqH4qSdUUOx/0N5J259Kit6yC08+5ZKKXFu
 P2YYx4uMK7hecXK8cxKRPhNm3scWOiLBhHix26cfc/e173RyAhVCFcdn3uPXMc6UKW+W/B1F3wv
 TL1yY4YqXHtJi80ivBCjqlCC6n0rggWrEk6n2mgw0lWyxYeggjxIasvIUT48HPpJCIYeHPCipWn
 L5Qq8iIPwARBcJC9ijQUXMKreZ8iJyZCPK4cK7Vs2uUl8cxrZ8Nq5CjnMWNAirL1zA54PvJD01V
 dnsZd3NXoM399HEBOEuYr32N6U7CTYB+EhFSFuYHfuREvyZ+XwxguTyuSiGS8pSVyrucOI2m3Nb
 jxYUIFGsn9OeyJRZ1cUwFGpnZ+GLbFmIc2bF7WpWPQRsHK/bOm4Pakr6Lg03+gZ6ABk1hdDBp3w
 DNT2NIVNcmu2szFp5OLUaOP3rQZzUuqj8/mr13+LWFwQrZbRcd49Y10mko/rMsOYiWOJpHvVc0A
 Ie5+SVpcMkJpL4A==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujedufeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeefgfdvvdegveffhfffueeivefgleeljeeukeegveelgfejvdehheevkedtveeiheenucffohhmrghinhephigrmhhlrdhinhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthhhohhmr
 ghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Mar 2025 13:07:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6656

This series makes the final updates before the 5.2 release, which
includes adding the recipe upgrades, license changes, as well as cleaning
up a few empty sections.

It also updates the release notes / migration guide and overall
documentation with regards to the latest changes on Poky.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (11):
      migration-guides/release-notes-5.2.rst: add the list of contributors
      migration-guides/release-notes-5.2.rst: add recipe upgrades
      migration-guides/release-notes-5.2.rst: add LICENSE recipe changes
      migration-guides/release-notes-5.2.rst: add security fixes
      migration-guides/release-notes-5.2.rst: add an entry for addfragments
      migration-guides/migration-5.2.rst: final update for 5.2
      ref-manual/system-requirements.rst: update list of supported distributions
      poky.yaml.in: bump minimum required Python version to 3.9
      ref-manual/variables.rst: document the GRUB_MKIMAGE_OPTS variable
      ref-manual/variables.rst: document the SPDX_PACKAGE_VERSION variable
      migration-guides/{migration,release-note}-5.2: update for 5.2 release

 documentation/migration-guides/migration-5.2.rst   |   39 +-
 .../migration-guides/release-notes-5.2.rst         | 1516 +++++++++++++++++++-
 documentation/poky.yaml.in                         |    2 +-
 documentation/ref-manual/system-requirements.rst   |   10 +-
 documentation/ref-manual/variables.rst             |   10 +
 5 files changed, 1567 insertions(+), 10 deletions(-)
---
base-commit: ea1636013722c12e72ca115240c8ce533e05ece2
change-id: 20250327-release-note-5-2-updates-2-8fb5d45989bd

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


