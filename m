Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A8E3C5478C
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 14:01:41 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.12825.1709042496800150421
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Feb 2024 06:01:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jFN9iIea;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0B8E120007;
	Tue, 27 Feb 2024 14:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709042495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=y3Xk07VdJ4C6J1ZSjw86Z0JrO5HOp9JiHGcdpLRA3GM=;
	b=jFN9iIeaz5Y5QFXwawsHHMTt7TdLijFeQWq44U16KBtNsDOyoCk8f6kTsn64G29e1KOFHb
	syqX7+hZ8ICFCuC6qfFHpL/WfGL2mSSqR9bZHwRsJBnhN0Bong5ccnhZSVByEEGSxe1PiD
	F6nF9W7+XoS0Fjbv730Cw9RdexzHKqLcjV36heyM5k58nTnJ9IA7M/99cE5ikpZD5OzE26
	clePwNm6O9EO+p2a6jJH1Sgwz2RC4ML4s0p8kv12LgUqvE3kyMp/KG/VwxQGUcnIxIKZRF
	1fISZz7Z1QqPT8Ml1Oe+uZrWzZr1/oHS4rf94Ux1MA7bl6fJQw5RFabecIr8qw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 00/16] documentation backports
Date: Tue, 27 Feb 2024 15:01:12 +0100
Message-Id: <20240227140128.481522-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Feb 2024 14:01:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4891

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From recent updates in the "master" branch.

A number of older commits have also been cherry-picked
to reduce the delta with the "master" branch,
making the application of recent changes easier.

Michael Opdenacker (14):
  ref-manual: release-process: grammar fix
  manuals: suppress excess use of "following" word
  dev-manual: packages: clarify shared PR service constraint
  dev-manual: packages: need enough free space
  manuals: update disk space requirements
  manuals: add minimum RAM requirements
  manuals: update references to buildtools
  ref-manual: system-requirements: modify anchor
  ref-manual/system-requirements.rst: recommend buildtools for not
    supported distros
  manuals: updates for building on Windows (WSL 2)
  ref-manual: system-requirements.rst: simplify supported distro
    requirements
  ref-manual: system-requirements: update packages to build docs
  ref-manual: system-requirements.rst: fix AlmaLinux variable name
  ref-manual: system-requirements: remove outdated note

Paul Eggleton (1):
  ref-manual: add info on buildtools-make-tarball

Simone Weiß (1):
  dev-manual: Rephrase spdx creation

 documentation/brief-yoctoprojectqs/index.rst  |  33 +--
 documentation/bsp-guide/bsp.rst               |   9 +-
 documentation/dev-manual/building.rst         |   2 +-
 documentation/dev-manual/debugging.rst        |   8 +-
 .../dev-manual/development-shell.rst          |   2 +-
 documentation/dev-manual/layers.rst           |   8 +-
 documentation/dev-manual/libraries.rst        |   4 +-
 documentation/dev-manual/licenses.rst         |   2 +-
 documentation/dev-manual/new-machine.rst      |   2 +-
 documentation/dev-manual/new-recipe.rst       |   8 +-
 documentation/dev-manual/packages.rst         |  22 +-
 .../dev-manual/prebuilt-libraries.rst         |   4 +-
 .../dev-manual/python-development-shell.rst   |   2 +-
 documentation/dev-manual/qemu.rst             |   4 +-
 documentation/dev-manual/runtime-testing.rst  |   4 +-
 documentation/dev-manual/sbom.rst             |  39 ++-
 .../dev-manual/speeding-up-build.rst          |   4 +-
 documentation/dev-manual/start.rst            |  84 +++---
 documentation/dev-manual/wic.rst              |   2 +-
 documentation/kernel-dev/common.rst           |   4 +-
 .../migration-guides/migration-1.5.rst        |   9 +-
 .../migration-guides/migration-1.7.rst        |   4 +-
 .../migration-guides/migration-2.1.rst        |   6 +-
 .../migration-guides/migration-2.2.rst        |  18 +-
 .../migration-guides/migration-2.4.rst        |   8 -
 .../migration-guides/migration-2.5.rst        |   8 +-
 .../migration-guides/migration-3.2.rst        |   2 +-
 .../migration-guides/migration-3.3.rst        |   6 +-
 .../migration-guides/migration-3.4.rst        |   2 +-
 .../migration-guides/migration-4.0.rst        |   4 +-
 documentation/overview-manual/concepts.rst    |  23 +-
 documentation/overview-manual/yp-intro.rst    |  19 +-
 documentation/poky.yaml.in                    |  31 +-
 documentation/ref-manual/classes.rst          |   8 +-
 .../ref-manual/devtool-reference.rst          |   8 +-
 documentation/ref-manual/faq.rst              |   6 +-
 documentation/ref-manual/features.rst         |   2 +-
 documentation/ref-manual/images.rst           |   2 +-
 documentation/ref-manual/release-process.rst  |   8 +-
 documentation/ref-manual/structure.rst        |   2 +-
 .../ref-manual/system-requirements.rst        | 270 +++++++++---------
 documentation/ref-manual/terms.rst            |  24 +-
 documentation/ref-manual/variables.rst        |   8 +-
 documentation/sdk-manual/appendix-obtain.rst  |  14 +-
 documentation/sdk-manual/intro.rst            |   2 +-
 .../test-manual/understand-autobuilder.rst    |   2 +-
 .../toaster-manual/setup-and-use.rst          |   4 +-
 47 files changed, 373 insertions(+), 374 deletions(-)

-- 
2.34.1


