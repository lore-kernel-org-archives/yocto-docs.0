Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F486FD006E
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 09:38:03 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.157024.1772444281744915393
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 01:38:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=sIUo1oQA;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D268C4E424D9
	for <docs@lists.yoctoproject.org>; Mon,  2 Mar 2026 09:37:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A3BF45FE89
	for <docs@lists.yoctoproject.org>; Mon,  2 Mar 2026 09:37:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AD6AB10369502;
	Mon,  2 Mar 2026 10:37:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772444279; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=zehH84A4vnO4S2iAUTw9H/J5pZXMyp8ELVoF4+S5Mko=;
	b=sIUo1oQAglnYrga3IclsC7YwoRs7S51tGd/GnuNXdVmwIxaNrGEDIIKj5d+BcX8DfcC2PP
	UuuO4fGhICAOTg5IkAw2iJIEaAKU4Bre6Wvg8hlCCemw6M2+xWZ0qwCv1LdtEWRO+QmHhi
	pc+Pu3aVLMXYk03kj9BN+F4Tlj1vT1If2vL/60T8Veyde+M3iH0bMLa/rfasb88nTgMgON
	hhT2+Nbh7RhV1RFmswTvQ4lHCINK8IXkKklMyEGEjLAuHlVjyM/n7wdyTBcYQrv+04fvHL
	jvCDDuXY6ncE9+uzSDp4w/dqhS5WEFHa+0ZNNmGL39azoKG6WVB1jtIOvwKKZQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/8] Update the documentation for 6.0 (Wrynose)
Date: Mon, 02 Mar 2026 10:37:47 +0100
Message-Id: <20260302-release-notes-6-0-v1-0-9662dee58591@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqDMBBG4VeRWTsQE0mlr1JcePltp0gsGRVBf
 HdTXX6Lc3ZSRIHSM9spYhWVKSQUeUbdpwlvsPTJZI31xhaOI0Y0Cg7TDGXPhh/OtaWpvC/7gVL
 3ixhku56v+rYu7Rfd/B/RcZyPEgfedQAAAA==
X-Change-ID: 20260213-release-notes-6-0-733b408664df
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1287;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=VDNZi2cDpC24tHxGeghE3HaYAC2QYJN1xHtcW/n2ohU=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBppVp1AF0ph3nFg94lAISKTky2fTgVg73iZObyI
 Ihxo8Phl8GJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaaVadQAKCRDRgEFAKaOo
 NkX7EACHHRuJ0eNkxQl9ZX/GJ2VRXLqJGYguKalZ3s5teik9zTmPoWm1841xHlVXa82+OixGSae
 QSY5v5CSRmINWjMfLzwlymzHi4Mf+e6/YtJZP1qJD2ewtvHN+/5z5ZBXFwUlEPGN28VIqhywmVp
 Vaqa7qMdnCK46yMRjgUqivM7C9TCxR0skLWxqhFY85/paI3jc1Teofc56dN/CGHMB6o2CYlouQc
 Gnx103Z5lka1sTb6UuAHodsv1qaQ8xXbVpFEoeZQEtscwtsaLPEDMGtLI4iXEmdDpr/Za3kTB/0
 EBkfdGwPi/Vzy0UUjUQGXHub5QvAXDWzdHSgZE2zJ9FNMZO0g/XO+tN37mnG6Ao6SP76ToeqPfI
 RFOAt2TApHHqbNP/6G+ObqWFfcs5QKvS21/VH55D6KLwt13Xp5Dmi19qPUNO4F9wpxaGH5bmfxg
 b9ZJ5GVatjVY9iynFps40ck6olZBl2ZaPW3Dt2xbjSkBfxKSmu2PYjSz84j6UTaxE/qQo3KMGZ5
 LCRJ7sEwShZdrTtKxnKa39fHoqyMj3lB6Y6vID1aO850o8gD8fYn8BrGQNOzhVuQaxTrCCZK9v1
 YfMCC/Qf6Srk4Jocd8N1ZWO/LeAZz+5hkiNHbS3SkZYCw/gpEslAhK+vxYeA76of1ZaTzoV3CTv
 ojypxVhjKmi6aXQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Mar 2026 09:38:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9018

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (8):
      conf.py: define new {oecore,bitbake,meta_yocto}_rev roles
      ref-manual/variables.rst: document qemuboot variables
      ref-manual/variables.rst: SPDX_PACKAGE_URL: add missing parenthesis
      ref-manual/variables.rst: document the LTO variable
      ref-manual/variables.rst: document the SPDX_CONCLUDED_LICENSE variable
      migration-guides: update 6.0 (Wrynose) release notes
      docs-wide: add warning on disabled NPM fetcher
      ref-manual/faq.rst: remove the CVS proxy note

 documentation/conf.py                              |  16 +-
 documentation/dev-manual/devtool.rst               |   5 +
 documentation/dev-manual/packages.rst              |  10 +-
 documentation/migration-guides/migration-6.0.rst   | 193 +++++++++-
 .../migration-guides/release-notes-6.0.rst         | 414 ++++++++++++++++++++-
 documentation/ref-manual/classes.rst               |   5 +
 documentation/ref-manual/faq.rst                   |   2 +-
 documentation/ref-manual/variables.rst             | 172 ++++++++-
 8 files changed, 792 insertions(+), 25 deletions(-)
---
base-commit: d97cfeaa55ed42722998d3313c1857aa377f6881
change-id: 20260213-release-notes-6-0-733b408664df


