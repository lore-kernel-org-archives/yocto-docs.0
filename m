Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2662EC54E4A
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 13:58:41 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.12582.1709042318812690434
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Feb 2024 05:58:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=frV/CzyF;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E3F2E0006;
	Tue, 27 Feb 2024 13:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709042317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kCSg4aAm/EAUR4HZJJUE9qybfoopKvn5WJaXmGfKw9g=;
	b=frV/CzyF006kCXUhwjisKt8bsAFpPoiaaKSFv+Ltv5z3Y066quwzcNyM0ImJ0GkjWPRUPg
	uNbPc1HaPiZQyCitqJXyw8WlSgZnSksGnFPP72zWvEh9CNF7iuLpkLmlmt3rw0hg4Ie4GF
	RRQxa85rIzl4L8p9keh2bDGrdlRDQY8B2pZTWxxxAeCHj7R3OCZETEaPmSZy4mV5lulmTc
	rz0COJWktXfKmCsU0QrzgTBduaP0PeKqkc2NtC6KbcMGa/NwiXuMJfagIiD1x0kSGvuZOP
	CCLGCnovQRyIOoWzxUOTcDVA+eZcJC4Lm0hzM3fHzFtZhj83Mx2y3Ho7HnbPcw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [nanbield][PATCH 0/6] documentation backports
Date: Tue, 27 Feb 2024 14:58:24 +0100
Message-Id: <20240227135830.481147-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Feb 2024 13:58:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4884

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From the updates in the "master" branch

Michael Opdenacker (5):
  ref-manual: system-requirements: update packages to build docs
  ref-manual: release-process: grammar fix
  manuals: suppress excess use of "following" word
  dev-manual: packages: clarify shared PR service constraint
  dev-manual: packages: need enough free space

Simone Weiß (1):
  dev-manual: Rephrase spdx creation

 documentation/bsp-guide/bsp.rst               |  9 ++---
 documentation/dev-manual/building.rst         |  2 +-
 documentation/dev-manual/debugging.rst        |  8 ++--
 .../dev-manual/development-shell.rst          |  2 +-
 documentation/dev-manual/layers.rst           |  8 ++--
 documentation/dev-manual/libraries.rst        |  4 +-
 documentation/dev-manual/licenses.rst         |  2 +-
 documentation/dev-manual/new-machine.rst      |  2 +-
 documentation/dev-manual/new-recipe.rst       |  8 ++--
 documentation/dev-manual/packages.rst         | 22 +++++++---
 .../dev-manual/prebuilt-libraries.rst         |  4 +-
 .../dev-manual/python-development-shell.rst   |  2 +-
 documentation/dev-manual/qemu.rst             |  4 +-
 documentation/dev-manual/runtime-testing.rst  |  4 +-
 documentation/dev-manual/sbom.rst             | 40 +++++++++++--------
 .../dev-manual/speeding-up-build.rst          |  4 +-
 documentation/dev-manual/start.rst            |  6 +--
 documentation/kernel-dev/common.rst           |  4 +-
 .../migration-guides/migration-1.5.rst        |  6 +--
 .../migration-guides/migration-2.2.rst        |  6 +--
 .../migration-guides/migration-2.4.rst        |  8 ----
 .../migration-guides/migration-2.5.rst        |  8 +---
 .../migration-guides/migration-4.0.rst        |  2 +-
 documentation/overview-manual/concepts.rst    | 18 ++++-----
 documentation/overview-manual/yp-intro.rst    |  2 +-
 documentation/ref-manual/classes.rst          |  8 ++--
 .../ref-manual/devtool-reference.rst          |  4 +-
 documentation/ref-manual/faq.rst              |  6 +--
 documentation/ref-manual/features.rst         |  2 +-
 documentation/ref-manual/images.rst           |  2 +-
 documentation/ref-manual/release-process.rst  |  8 ++--
 documentation/ref-manual/structure.rst        |  2 +-
 .../ref-manual/system-requirements.rst        | 10 ++---
 documentation/ref-manual/terms.rst            |  4 +-
 documentation/ref-manual/variables.rst        |  8 ++--
 documentation/sdk-manual/appendix-obtain.rst  | 10 ++---
 documentation/sdk-manual/intro.rst            |  2 +-
 .../toaster-manual/setup-and-use.rst          |  4 +-
 38 files changed, 130 insertions(+), 125 deletions(-)

-- 
2.34.1


