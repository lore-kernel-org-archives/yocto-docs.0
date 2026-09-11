Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AE12C88E45
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 15:11:39 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41849.1789139488487030447
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Sep 2026 08:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=vtUazY+y;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 338D81A01ED
	for <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 15:11:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0861C601DE
	for <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 15:11:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 81E8D11C7AFA5;
	Fri, 11 Sep 2026 17:11:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789139481; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=5QWIyTr2G+ffy4eqPxdRvzxQAoWlQuhYx2Sr2q6QksA=;
	b=vtUazY+yW78w1TLIhR6RpO6cOkskJcFE3VjRtt3s9VojkHxs3hwRSzAcx/OIbGcq4JMfHB
	oEX4RNWcdlxSL2cgixcOiSlP7OF3MiJjIauzx0apgx/oFJDBAySOssc8rNNoWqUusmUXri
	/XF1zjoXyFIEPFjCDREEuXIWOZ+h07AWQqrAMTc2DOZyOkbU8ZhMNHtbTADq1SyaFdTTDO
	TWK0xUeLdLW9nWvlSHclW2X4H4mHAalE26VC1MOKigbbe1XPo+fVjKytC8HD2lxHynbHjf
	m8N/oZ8WITWsBvrt7Ptv3KrZr51GM1pBn7IEfLIMQT0XCNa3POjnF3ZDJD5Osg==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/8] Encourage setting global changes in the proper place
Date: Fri, 11 Sep 2026 17:11:06 +0200
Message-Id: <20260911-remove-local-conf-refs-v1-0-322e1e9a232d@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQrCMBAAv1L27EISoWn9SvHQxo2uxKRk2yKU/
 t1VjzMws4NQZRK4NDtU2li4ZAV7aiA8xnwn5JsyOONa09keK73KRphKGBOGkqOaKNg7b01nztG
 1HjSe1fL7Nx6uf5Z1elJYvjc4jg+81CJFegAAAA==
X-Change-ID: 20260819-remove-local-conf-refs-92710803f267
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6355;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ulINh6rNN2ypjVTAJSdf77RIEj3AJ0OljqcCYmQJMVk=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqpBoUaoksTS/kIarUseKhfuf82+422PxJkNMpD
 kOAEkGlw76JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaqQaFAAKCRDRgEFAKaOo
 NpcOEACv4Joo2Yn9k0GKrldPAW9dNeG8T6NmsMZvUYb/9pL+x82J1THeC+F8ygHvt7uBEFA7S1+
 ZARWPHg686efKDE7Sytrei63spze5KbvLaO2NyZKhbUaXWnpQvOupRCaASgFcHM/uTSX++Jw5BG
 FOeosQFwQBX9GXj8XmmqiJgA6EnXJUDwTCBaBtUH+s0FSYM3QgWRNL40akjPxOkMan+hKucbnPa
 J6uvBQgoUioBmOUmW1sk1I1X76MPbfAHMCxNu+sVSgSTuQFKKubTO9xDJ6CxOOoBRzfjKVOne8g
 9ldmpAibcNJis0tclUssv+2IAdu4O5UCIf/Mf4tdq/mD7H/G7XBu0ksqotCdIVu4K7PfGX6XApR
 Rw8RkLsySJ8DyvdKtH9dYEU7dQ5DXFV52ZFqBObmVHRasCPJwvP+EIk8KeNgWRzP3e3hd8+y3i+
 tm2TDDpmBsNjtAMma1WYjNlt1cIAsNaMABi0oRMOFzFYWT/S59RXGUi6BFoC3UIjpL4J0rvrBwP
 pfGmS80E9oi6u4i9KKoROocuWbov8BrG2KvBhUbSfrCoClLgy+dFc9eqvBSC7z4sRWW1UkWZ7Mz
 sbJEeK5NMBUsGMMxs01d6oh99nCSUhYgMNP+q/BeN1oDbYll8pD95c0rb0NwD4uU5whS53Cimie
 AAm+lPB0arPaBvw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 15:11:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10469

The purpose of this series is change the current documentation to
encourage readers to make global configuration changes in the
appropriate place. Currently, the documentation mostly says "set X in
your local.conf" file - which works, but isn't ideal, as we have distro,
machine, and other configuration files available. We should encourage
users to create their own version of those, and version them in their
layers.

So, I went over each occurrence of "local.conf" I could find in the
documentation and tried to replace these kinds of suggestions by better
recommendations, e.g. set this in your distro/machine configuration
file. Sometimes, local.conf is actually a good recommendation (for local
modifications), so these occurrences were left as-is.

The series begins with improvements to the "Configuration File" term. As
this term is being heavily used afterwards, we need to redirect the
reader to the appropriate file, depending on the change being done.

The second to last patch is where most of the replacements occur. These
were hard to categorize as individual patches, so a big patch it is.

The last patch is slightly different: it replaces hardcoded paths of
configuration files to links to our structure.rst document, which has
explanations on what these files are meant for. This patch contains only
that. Hopefully this can help the reader understand the purpose of the
file given the context in which it is being referenced.

NOTE: this series was sent rebased on top of another one sent shortly
before: "Assorted fixes and additions" [1].

[1]: https://lore.kernel.org/r/20260911-assorted-fixes-v1-0-0d92a8112918@bootlin.com

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (8):
      ref-manual/terms.rst: Configuration File: precise machine conf files location
      ref-manual/terms.rst: Configuration File: split paragraph in a list
      ref-manual/terms.rst: Configuration File: use a link to local.conf
      ref-manual/classes.rst: buildstats: remove local.conf default value
      dev-manual/wic.rst: remove local.conf mentions
      ref-manual/variables.rst: GCCVERSION: replace local.conf and mention recipe existence
      docs-wide: advise setting global changes in the proper place
      docs-wide: replace hardcoded conf paths to structure.rst refs

 documentation/brief-yoctoprojectqs/index.rst       |   4 +-
 documentation/bsp-manual/bsp.rst                   |   6 +-
 documentation/dev-manual/bblock.rst                |   2 +-
 documentation/dev-manual/bmaptool.rst              |   5 +-
 documentation/dev-manual/build-quality.rst         |  15 +-
 documentation/dev-manual/building.rst              |  33 ++---
 documentation/dev-manual/custom-distribution.rst   |  14 +-
 .../custom-template-configuration-directory.rst    |   8 +-
 documentation/dev-manual/customizing-images.rst    |  11 +-
 documentation/dev-manual/debugging.rst             |  16 +--
 documentation/dev-manual/device-manager.rst        |   8 +-
 documentation/dev-manual/devtool.rst               |   4 +-
 documentation/dev-manual/disk-space.rst            |   2 +-
 .../dev-manual/efficiently-fetching-sources.rst    |   2 +-
 documentation/dev-manual/error-reporting-tool.rst  |   6 +-
 documentation/dev-manual/external-scm.rst          |   2 +-
 documentation/dev-manual/external-toolchain.rst    |   8 +-
 documentation/dev-manual/layers.rst                |  22 +--
 documentation/dev-manual/libraries.rst             |   7 +-
 documentation/dev-manual/licenses.rst              |  11 +-
 documentation/dev-manual/limiting-resources.rst    |   2 +-
 documentation/dev-manual/multiconfig.rst           |  10 +-
 documentation/dev-manual/new-recipe.rst            |   9 +-
 documentation/dev-manual/packages.rst              |  20 +--
 documentation/dev-manual/poky-manual-setup.rst     |   2 +-
 documentation/dev-manual/upgrading-recipes.rst     |  12 +-
 documentation/dev-manual/wayland.rst               |   4 +-
 documentation/dev-manual/wic.rst                   |   9 +-
 documentation/dev-manual/x32-psabi.rst             |   2 +-
 documentation/kernel-dev/common.rst                |  25 ++--
 documentation/migration-guides/migration-1.3.rst   |   4 +-
 documentation/migration-guides/migration-1.6.rst   |   6 +-
 documentation/migration-guides/migration-1.7.rst   |   4 +-
 documentation/migration-guides/migration-2.0.rst   |   2 +-
 documentation/migration-guides/migration-2.1.rst   |   2 +-
 documentation/migration-guides/migration-4.1.rst   |   2 +-
 documentation/migration-guides/migration-4.2.rst   |   4 +-
 .../migration-guides/release-notes-4.2.rst         |   2 +-
 .../migration-guides/release-notes-5.2.rst         |   2 +-
 .../migration-guides/release-notes-6.0.rst         |   2 +-
 documentation/overview-manual/concepts.rst         |  45 +++---
 documentation/profile-manual/intro.rst             |  12 +-
 documentation/profile-manual/usage.rst             |  15 +-
 documentation/ref-manual/classes.rst               |  30 ++--
 documentation/ref-manual/devtool-reference.rst     |   2 +-
 documentation/ref-manual/faq.rst                   |   8 +-
 documentation/ref-manual/images.rst                |   5 +-
 documentation/ref-manual/structure.rst             |  12 +-
 documentation/ref-manual/system-requirements.rst   |   2 +-
 documentation/ref-manual/terms.rst                 |  44 +++---
 documentation/ref-manual/variables.rst             | 158 ++++++++++-----------
 documentation/ref-manual/varlocality.rst           |   2 +-
 documentation/sdk-manual/appendix-customizing.rst  |   9 +-
 documentation/sdk-manual/appendix-obtain.rst       |  15 +-
 documentation/security-manual/read-only-rootfs.rst |   2 +-
 documentation/security-manual/securing-images.rst  |   6 +-
 documentation/test-manual/reproducible-builds.rst  |   6 +-
 documentation/test-manual/runtime-testing.rst      |  16 +--
 .../test-manual/understand-autobuilder.rst         |   4 +-
 documentation/toaster-manual/reference.rst         |   2 +-
 .../transitioning-to-a-custom-environment.rst      |   4 +-
 61 files changed, 367 insertions(+), 343 deletions(-)
---
base-commit: 670d4f143a899e3030f1dbde48d0e855b3b06521
change-id: 20260819-remove-local-conf-refs-92710803f267


