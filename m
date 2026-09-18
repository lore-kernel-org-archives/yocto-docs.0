Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B50BC982D8
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 13:53:56 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11747.1789739630856504835
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Sep 2026 06:53:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ZDw2hUKv;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7BF881A091E
	for <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:53:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 50A1260649
	for <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:53:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D125D10328D58;
	Fri, 18 Sep 2026 15:53:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789739623; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=dSUTALoLMY6bH2wZVkZwGLJhYQiBSJ7s53VrpSjOZBk=;
	b=ZDw2hUKvHK323/nU8SqqiIxyytfSvPMhvGuTvaZ3WMK7Gq6tBPk3GFn5iHZv0H9WntdOPz
	VVija7Ov+AWN/WF2eYEuc5u2istwnFv+6LLayf61ITrFFuTgBRaSxkH48QoSe32Zdbn0fi
	34vJEl3mO/rphmo2CB8MI0B8cRhcd1kZfY7KP6SRi7raYI7TedFBUJZTLVRjRPtFZXaUrE
	nUGenFajYg5CXxKfq9xEpeiaFLIbyDIinovBd2edqfQ2vE52bD78hMnX0PPgdABbnBa/2O
	WU1YPneLtvB6TZrSoqhtcGsarKlAabBwYSmI1BAhlbnUkzXAQbXWEahyZhsKvQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 00/20] Updates and release notes for 6.1
Date: Fri, 18 Sep 2026 15:53:30 +0200
Message-Id: <20260918-releases-notes-6-1-v1-0-2d0fceffa242@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqDMBCF4VeRWXcgCWovr1Jc2OTETimxZFQE8
 d2b1s2Bb3H+jRRZoHSrNspYRGVMBfZUkX/2aQBLKCZnXGuutuGMN3qFchqnsi1bviC4YGJsan+
 mcvxkRFn/0Xt3WOfHC376lWjfv3pluUx2AAAA
X-Change-ID: 20260915-releases-notes-6-1-8ed2d0ff54c7
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2474;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Hu1wqmsQIFhoX/IDarWjmIIcDz4HnEa2ViS81/PZvcE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqrUJiQrOoUi7WXh2FOb6jd0huZBzyc+3hVuHjx
 0g92AHuU+mJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaq1CYgAKCRDRgEFAKaOo
 Nla4EAC147KlAMMH1LUEDcIVE6PORot2heXV5F9/P0H2xtXcBai0JOMyWpKYFSTSSrNSloYyn8V
 faEFQYn3sjQ1nodBfSSYxqiWRalbGpeaD/+2Vbq374JDqxJHHTuNBmomOwfsjXJIJTw7pvaX0pJ
 5zjYB9AhFONBLeG5Qx87okwZSKPifJnLCKvUv0qJBFd+9ea1o3QQglvO9cnvLG/lVEzLTB8eZP8
 T2cQBwN6O3XGydztYaelm513zrs4DVxdC7xdzc2CKHavk6oMX8m2KMGfx/4GNvl5xEmR9upP3zu
 NNjaSfTAfos54bl2VDCeHL54iNC30LUqLBQsxob29WW0bITWJi6dRjR/vu3Ibe2MkFCKD6YtdHV
 r7quK56jSSZrtvJ6SJwIED1XPsGbDdewN1Na9kMraODNtkUE50C0Zv2+fbJVEX9fp3hzFwtstuh
 2iSauUdJ04fUs3BiyUj8B7LSxmx3qpt2r26mAe6pVVeBOV5ugiQzZ0/lmExyegjgYWcwlrIl4vG
 VI7nbAfqF7WlEtiiZOvBNOhOwJ39zQTrzT0Sp7UbgIgA5g7pZ6fUPm//3Ev5hZpEJdkjh+oNntm
 lwfj0kN+04FljHGZMY63+/siNb3H1OCyaQ7tSPYZDHJBjuK/FTufUa9pjAk3kyvBe350QvJFk5W
 ksCvw6rsdpHTqCg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:53:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10532

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (20):
      ref-manual/fragments.rst: document core/yocto/monitor-disk-space
      ref-manual/system-requirements.rst: refresh our supported distro list
      migration-guides/release-notes-6.{0,1}.rst: update path to check_sanity_everybuild
      ref-manual/classes.rst: linux-kernel-base: drop the class documentation
      ref-manual,dev-manual: remove srpm mode archiver class mentions
      migration-guides/migration-6.1.rst: add tip to use convert-spdx-licenses.py
      ref-manual/variables.rst: document the KERNEL_TOOLCHAIN variable
      ref-manual/variables.rst: document the FIT_OS variable
      ref-manual/variables.rst: document the CARGO_PROFILE variable
      ref-manual/features.rst: add section for SDK features
      ref-manual/variables.rst: drop documentation for SDK_TOOLCHAIN_LANGS
      ref-manual/classes.rst: document the python_pbr class
      ref-manual/variables.rst: document RETAIN_IGNORE_TASKS
      ref-manual/variables.rst: document the KERNEL_MODULE_INSTALL_PREFIX variable
      migration-guides/migration/migration-6.1.rst: add note on moved class functions
      migration-guides/migration/release-notes-6.1.rst: cover recent changes
      migration-guides/release-notes-6.1.rst: add license updates
      migration-guides/release-notes-6.1.rst: add CVE fixes
      migration-guides/release-notes-6.1.rst: add recipe upgrades
      migration-guides/release-notes-6.1.rst: add contributors

 documentation/dev-manual/licenses.rst              |    4 +-
 documentation/migration-guides/migration-6.1.rst   |   80 +-
 .../migration-guides/release-notes-4.1.1.rst       |    2 +-
 .../migration-guides/release-notes-4.1.rst         |    2 +-
 .../migration-guides/release-notes-5.3.rst         |    4 +-
 .../migration-guides/release-notes-6.0.rst         |    2 +-
 .../migration-guides/release-notes-6.1.rst         | 2065 +++++++++++++++++++-
 documentation/ref-manual/classes.rst               |   25 +-
 documentation/ref-manual/features.rst              |   21 +
 documentation/ref-manual/fragments.rst             |   10 +
 documentation/ref-manual/system-requirements.rst   |    8 +-
 documentation/ref-manual/variables.rst             |   41 +-
 12 files changed, 2150 insertions(+), 114 deletions(-)
---
base-commit: e9fd43e2584fa793dbdbe1545c3c67c41f7d3ef7
change-id: 20260915-releases-notes-6-1-8ed2d0ff54c7


