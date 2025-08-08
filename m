Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F2A2C87FCB
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 16:43:40 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.27299.1754671414211237654
 for <docs@lists.yoctoproject.org>;
 Fri, 08 Aug 2025 09:43:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ccYSgCSK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 707CB443D6;
	Fri,  8 Aug 2025 16:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754671412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HS8kFEc11+dT48naS4ZStpX4bHjBGlbYJl7K21kmgzU=;
	b=ccYSgCSK7tfm9ufqRK/BoirulmFRAb2aHxt0brEGg5wvlU5XmaO2Gcp999IWbVR7utns5y
	DU5YlYFZo3VDXJuvs4JhPDqU177Y77zep4/xDds28ybIuBplJsORC3XPR9FbjrKugGChgP
	hMGp7Z4m4wnlzbUaBtvZAsvZThftnIcEo9V/GSqar0R72IwgtU8cp6TQUQAavu4UI2pp5K
	t2Ag4ePtoJAodscUaKBPc3BVAvBFMED7NXpnAr3CnIvgBnPHpzuFNvDVWwh7jpdXNtn+8T
	moOX9kQI0yeVX59I+uEWzcLjaNzJ4lBdic6dNzZDlOdpHTH3nf43kLNL/gOFHQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 08 Aug 2025 18:43:31 +0200
Message-Id: <DBX73QJ1DL23.1F4WDK617ZORE@bootlin.com>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdegfedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheefheekfeekvefghedthefftdeigfetieffleehfefggfeikeffteegveeuhfegnecuffhomhgrihhnpeihrghmlhdrihhnnecukfhppedvrgdtvdemkeegvdelmeekudejrgemgedttddumegttdgsvgemugehkegrmeegvdeltdemlegvrgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvleemkedujegrmeegtddtudemtgdtsggvmeguheekrgemgedvledtmeelvggrjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 08 Aug 2025 16:43:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7445

The following changes since commit dc984e5f54c38748603243053fde8b4d078ba586=
:

  ref-manual: gather all QA checks in qa-checks.rst (2025-07-29 11:10:30 +0=
200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to dbc6137cd13f982a7fd4d1b2df79dccb177db0fc:

  poky.yaml.in: increase required disk space to 140G (2025-08-08 16:34:19 +=
0200)

----------------------------------------------------------------
Antonin Godard (27):
      ref-manual/system-requirements.rst: update supported distributions
      dev-manual: add a hash equivalence server setup document
      ref-manual/tasks.rst: add documentation for do_recipe_qa
      ref-manual/variables.rst: document SPDX_PACKAGE_URL
      ref-manual/variables.rst: document KMETA_CONFIG_FEATURES
      ref-manual/variables.rst: document TESTSDK_SUITES
      ref-manual/variables.rst: document PSEUDO_INCLUDE_PATHS
      Drop the icecc class and related variables
      ref-manual/variables.rst: document the FIT_CONF_PREFIX variable
      ref-manual/variables.rst: add link for BB_DEFER_BBCLASSES
      ref-manual/variables.rst: document SPL_DTB_BINARY
      ref-manual/variables.rst: document UBOOT_VERSION
      ref-manual/classes.rst: document the go-mod-update-modules class
      ref-manual/variables.rst: document OE_SHARED_UMASK
      ref-manual/variables.rst: document CVE_CHECK_VEX_JUSTIFICATION
      ref-manual/classes.rst: document the testexport class
      docs-wide: update wic source plugin names
      ref-manual/tasks.rst: do_package_qa: update link to qa checks
      ref-manual/qa-checks.rst: add space around equal warning
      docs-wide: fix space around equal assignments
      migration-guides/release-notes-5.3: updates
      Add a script to validate documentation glossaries
      Makefile: add a checks rule
      ref-manual/variables.rst: fix the glossary
      ref-manual/variables.rst: sort variables
      ref-manual/terms.rst: sort entries
      poky.yaml.in: increase required disk space to 140G

Erik Lindsten (1):
      overview-manual/yp-intro.rst: fix broken link to article

 documentation/Makefile                             |   7 +-
 documentation/bsp-guide/bsp.rst                    |   4 +-
 documentation/dev-manual/building.rst              |   8 +-
 documentation/dev-manual/hashequivserver.rst       | 129 +++++
 documentation/dev-manual/index.rst                 |   1 +
 documentation/dev-manual/layers.rst                |   2 +-
 documentation/dev-manual/new-recipe.rst            |   2 +-
 documentation/dev-manual/qemu.rst                  |   4 +-
 documentation/dev-manual/start.rst                 |   4 +
 documentation/dev-manual/wic.rst                   |  16 +-
 documentation/migration-guides/migration-4.0.rst   |  10 +-
 documentation/migration-guides/migration-5.3.rst   |  89 ++++
 .../migration-guides/release-notes-5.3.rst         | 564 +++++++++++++++++=
+++-
 documentation/overview-manual/concepts.rst         |  16 +-
 documentation/overview-manual/yp-intro.rst         |   2 +-
 documentation/poky.yaml.in                         |   6 +-
 documentation/ref-manual/classes.rst               | 113 ++---
 documentation/ref-manual/qa-checks.rst             |  16 +
 documentation/ref-manual/system-requirements.rst   |  57 ++-
 documentation/ref-manual/tasks.rst                 |  13 +-
 documentation/ref-manual/terms.rst                 |  26 +-
 documentation/ref-manual/variables.rst             | 403 +++++++--------
 documentation/sdk-manual/appendix-customizing.rst  |   4 +-
 documentation/tools/check-glossaries               |  90 ++++
 24 files changed, 1210 insertions(+), 376 deletions(-)
 create mode 100644 documentation/dev-manual/hashequivserver.rst
 create mode 100755 documentation/tools/check-glossaries

