Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89814C54FCD
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 09:07:07 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7405.1785316016804933842
 for <docs@lists.yoctoproject.org>;
 Wed, 29 Jul 2026 02:06:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=PAjaAbUC;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F1E9B4E40FDC
	for <docs@lists.yoctoproject.org>; Wed, 29 Jul 2026 09:06:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AE1AC603BD;
	Wed, 29 Jul 2026 09:06:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4ADDE11C14B2C;
	Wed, 29 Jul 2026 11:06:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785316013; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=raGEu+2GaKBGXgixAShSpUAIm1VGE5rGnxg8nxthmiE=;
	b=PAjaAbUCABcLdnbTDBBmGGc2oBpExPwZxzNt31T0O+OtjoH/WoCs8Wj9ZUXA03gSN+sQtA
	Xlivlp0WLnJhGGmjW2GJr+qT3O33ydXyz8vS9h+vzRHwsA1nj9m+MitYyHnkNUAzq0cooy
	X0LDd5aj2WIcOlCOwAiqxOccMY03ZgVmLWlTk6aDeKgCKKN0Qt5tpnI6XQY47EWYfSUnhq
	8ahN4Jtz02T5pfv3ahw5UHLf7k/fO3CBbw1ZBxk6mNM1oxtI3o1NTIYfeyM0dKUda22RQy
	HDFC5wP4MyZvwBwtxKukMXVT+exLmoTlVwo/wYciINLo4iuavD6eRf7/qKycUw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Jul 2026 11:06:52 +0200
Message-Id: <DKAXPHV7SYNU.1LJ8TDN74LSQ6@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 29 Jul 2026 09:07:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10184

The following changes since commit 358519ca6406a89fee42c45dcaf63a37a374f33c=
:

  docs-wide: fix various broken links (2026-07-15 14:31:33 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to 41dae3c3da3ada1745fc60228ff6269c64ee2361:

  ref-manual/variables.rst: SSTATE_MIRRORS: link to the new sstate-mirrors-=
setup doc (2026-07-29 10:47:14 +0200)

----------------------------------------------------------------
Antonin Godard (21):
      ref-manual/variables.rst: remove flags from variable names
      tools/gen-cve-release-notes: add argparse support
      conf.py: add linkcheck builder exclusions for frequent links
      migration-guides/migration-3.4.rst: replace rlbl broken link
      migration-guides: replace broken link with archive links
      kernel-dev/common.rst: remove taskhash mismatch note
      ref-manual/faq.rst: limit systemd as default question to Poky
      index.rst: add introduction paragraphs
      index.rst: move the contributor guide out of the Manuals section
      index.rst: move the "Overview and Concepts" manual in the "Introducti=
on and Overview" section
      index.rst: move external links to the bottom of the intro section
      overview-manual: move the intro content in the index
      bsp-guide: rename to bsp-manual
      contributor-guide/identify-component.rst: use the same tense as other=
 section
      bitbake.rst: rename section to "BitBake User Manual"
      index.rst: move release notes in their own section
      dev-manual: add a shared state mirror setup document
      ref-manual/variables.rst: SSTATE_MIRRORS: remove uninative mapping no=
te
      ref-manual/variables.rst: SSTATE_MIRRORS: remove directory structure =
note
      ref-manual/variables.rst: SSTATE_MIRRORS: move password note to share=
d state mirror document
      ref-manual/variables.rst: SSTATE_MIRRORS: link to the new sstate-mirr=
ors-setup doc

Daniel Turull (2):
      ref-manual/release-process.rst: update LTS supported versions
      ref-manual/release-process: clarify upstream criteria for stable

Joshua Watt (1):
      migration-guide: Add guide for converting licenses

Lee Chee Yang (2):
      migration-guide: add release notes for 5.0.19
      migration-guide: add release notes for 6.0.2

Niko Mauno (4):
      identity-component: Replace unicode with regular ASCII
      ref-manual: Fix occurrences of omitted space with :prepend
      ref-manual: Prune superfluous space with :append
      dev-manual: Fix missing whitespace around '=3D' operator

 documentation/README                               |  22 +-
 documentation/bitbake.rst                          |   6 +-
 documentation/bsp-guide/index.rst                  |  15 -
 documentation/{bsp-guide =3D> bsp-manual}/bsp.rst    |  34 +-
 .../figures/bsp-dev-flow.png                       | Bin
 documentation/bsp-manual/index.rst                 |  15 +
 documentation/conf.py                              |  17 +
 .../contributor-guide/identify-component.rst       |   8 +-
 documentation/dev-manual/index.rst                 |   1 +
 documentation/dev-manual/layers.rst                |   6 +-
 documentation/dev-manual/new-machine.rst           |   2 +-
 documentation/dev-manual/sstate-mirrors-setup.rst  | 194 ++++++
 documentation/dev-manual/start.rst                 |   2 +-
 documentation/dev-manual/upgrading-recipes.rst     |   2 +-
 documentation/index.rst                            |  68 ++-
 documentation/kernel-dev/advanced.rst              |   2 +-
 documentation/kernel-dev/common.rst                |  21 +-
 documentation/migration-guides/migration-2.5.rst   |   2 +-
 documentation/migration-guides/migration-3.4.rst   |   2 +-
 documentation/migration-guides/migration-5.3.rst   |   2 +-
 documentation/migration-guides/migration-6.1.rst   |  69 +++
 documentation/migration-guides/release-5.0.rst     |   1 +
 documentation/migration-guides/release-6.0.rst     |   1 +
 .../migration-guides/release-notes-4.3.rst         |   2 +-
 .../migration-guides/release-notes-5.0.19.rst      | 663 +++++++++++++++++=
++++
 .../migration-guides/release-notes-5.0.rst         |   2 +-
 .../migration-guides/release-notes-5.3.rst         |   3 +-
 .../migration-guides/release-notes-6.0.2.rst       | 273 +++++++++
 documentation/overview-manual/concepts.rst         |   2 +-
 .../overview-manual/development-environment.rst    |   4 +-
 documentation/overview-manual/index.rst            |  59 +-
 documentation/overview-manual/intro.rst            |  69 ---
 documentation/overview-manual/yp-intro.rst         |   4 +-
 documentation/ref-manual/faq.rst                   |  16 +-
 documentation/ref-manual/qa-checks.rst             |   2 +-
 documentation/ref-manual/release-process.rst       |   4 +-
 documentation/ref-manual/resources.rst             |   2 +-
 documentation/ref-manual/structure.rst             |   2 +-
 documentation/ref-manual/terms.rst                 |  12 +-
 documentation/ref-manual/variables.rst             |  60 +-
 documentation/sphinx-static/theme_overrides.css    |   4 +
 documentation/standards.md                         |   6 +-
 documentation/tools/gen-cve-release-notes          |  13 +-
 .../transitioning-to-a-custom-environment.rst      |   2 +-
 documentation/what-i-wish-id-known.rst             |   6 +-
 45 files changed, 1468 insertions(+), 234 deletions(-)
 delete mode 100644 documentation/bsp-guide/index.rst
 rename documentation/{bsp-guide =3D> bsp-manual}/bsp.rst (98%)
 rename documentation/{bsp-guide =3D> bsp-manual}/figures/bsp-dev-flow.png =
(100%)
 create mode 100644 documentation/bsp-manual/index.rst
 create mode 100644 documentation/dev-manual/sstate-mirrors-setup.rst
 create mode 100644 documentation/migration-guides/release-notes-5.0.19.rst
 create mode 100644 documentation/migration-guides/release-notes-6.0.2.rst
 delete mode 100644 documentation/overview-manual/intro.rst

