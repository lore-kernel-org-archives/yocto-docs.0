Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76760C4450A
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 12:19:13 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11533.1784204351359738687
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Jul 2026 05:19:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=amC/xVRu;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 00D10C2B9E8
	for <docs@lists.yoctoproject.org>; Thu, 16 Jul 2026 12:19:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9FBF5602B8
	for <docs@lists.yoctoproject.org>; Thu, 16 Jul 2026 12:19:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1487511BD3CD0;
	Thu, 16 Jul 2026 14:19:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784204348; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=TEbVXg6FHBSZKt8D9RYJ8HGV3/E3/9C3AESDzqa0CIM=;
	b=amC/xVRuO6aVh7MixUF+ytfJyZRQPvaSID0b6p+2Nt/o+NpimmuOQk0oxjKisTZf47OAm9
	m1ze+xyV/7vk/NEgXjBBvNF4OtHvn7j6MU6qF8KP/1LByUsEdp8p2aL1mToORjtik6Nz1i
	EkxDMn+9bSBbr2iqiO4sXv5KvChz2Q16PolSWc16liSsKWLSfwIGaxQqcNS0tR28PEEuLY
	wMCFulwJUtruC0XHahBscf7FuhL9l3Zh3ZuZSQ7TAKX4rWZzJWA2dkf2PXTSx+pZvymJhE
	utLiucgduKtFokLj9cTmiu/hDkxAKV09rQ8/Wnl/j9hE3MM2VNDmFPrLuzPDKA==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v2 0/4] Generate documentation links for OE-Core
Date: Thu, 16 Jul 2026 14:18:30 +0200
Message-Id: <20260716-gen-doc-links-intersphinx-v2-0-83cb3aef6ff6@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDQAxA0atI1g0Mkdraq0gXM2OqqSXKREUQ7
 96pXb7F/zsYJ2GDR7FD4lVMRs2gSwGx99oxSpsN5KhyN3fHjhXbMeJHdDAUnTnZ1ItueKVYlj7
 U5KoAuZ8Sv2Q7383zb1vCm+P8G8JxfAE4Ff0QfQAAAA==
X-Change-ID: 20260708-gen-doc-links-intersphinx-52c33ab9206b
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5361;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=IWJjd11QeMBBghJZ4Ss29uHGjBQjD/AhqA9ZILCcFrM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqWMw5b368oY6qgO/kCMQL71P0ST+ue5vR7uBlo
 OblkFWm7h6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaljMOQAKCRDRgEFAKaOo
 NjYgEACyqs1+vMMxfXbBMJunUaPHhZRNdxVTd+o6e6QzBy6pg9LYGi9CWfwyz0jMYJCiy6vASg7
 /1Luz46hxDjo64lB6LytiSKe+4+rlWCNGAqTQj6yTR5JCw03b7kNitEXIMPlT7EyWBOFL9G1ZHc
 SE1Oc27QgpfVTDqRUO3CHJNLAFs8RPdo9DQuHdKpYk4HP/tiUILVIPrZ2mWvJVi1wjID+W3d7Di
 VuBTbVYMD9fwWYEeV18u6GC6qvMk1UKdRk5WKkoFQ5tDHIy4s70HO5+yiPanR4Kch8O9iPldekZ
 PVL6G/nkrxt/YIiFWx4MM60QrP8i390ulqIknPQxI45W5w0oNp1Vf/KnrWBUBkXgbq7Mfm308l1
 96OVWDd39N1XfEKChpYBQIotU2BQniIS8wBsNvcc2cBWaw3nNo/e5mtXAYHgdm8HTk+ExosrKve
 +XBfOoFFo/bMiTYcypeyHmc3kvCv+A/lG8NdHDiPq+SrFCmBdsnrFTOfO7TSLlUuoPem6qmACQb
 f/3JE8TTJFWU5/9CVUVXPQFWUH6pVkIfS+okG3UTKcTSAJyzY1s0bVI83GbQGqgLOJySotdskuk
 v4Xwv9t0XQNSwFS804PnlIoofixFqyTSqjgagjuJBW0DyIVoY9ehEku6xfRWUsucoyxP92emk61
 2QjOA9PpRNZ0JCw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Jul 2026 12:19:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10085

The purpose of this series is to make links to yocto-docs accessible
from OE-Core through a doclink flag, making the overall documentation
more accessible. This link can be shown with:

  $ bitbake-getvar do_install --value -f doclink
  https://docs.yoctoproject.org/blacksail/ref-manual/tasks.html#term-do_install
  $ bitbake-getvar S --value -f doclink
  https://docs.yoctoproject.org/blacksail/ref-manual/variables.html#term-S

This is made possible through a file generated automatically, which
contains assignments such as:

S[doclink] = 'https://docs.yoctoproject.org/${LAYERSERIES_COMPAT_core}/ref-manual/variables.html#term-S'
do_install[doclink] = 'https://docs.yoctoproject.org/${LAYERSERIES_COMPAT_core}/ref-manual/tasks.html#term-do_install'

This can be used in projects that want to point to documentation, like
Toaster.

This could also be included automatically from OE-Core's bitbake.conf with:

  # Default path to yocto-docs, assuming it is next to the openembedded-core
  # repository, as would be provided by bitbake-setup.
  YOCTO_DOCS_DIR ??= "${COREBASE}/../yocto-docs"

  include ${YOCTO_DOCS_DIR}/documentation/oecore/doclinks.conf

The main point for this is to make documentation for variables easily
accessible, with the hope that this would also encourage people to
contribute to documentation more as it would create a bridge between
OE-Core and yocto-docs.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (4):
      ref-manual/tasks.rst: convert to glossaries
      ref-manual/variables.rst: remove flags from variable names
      tools: add gen-doc-links to generate documentation link flags
      .pre-commit-config.yaml: add gen-doc-links

 .pre-commit-config.yaml                            |    7 +
 .../contributor-guide/recipe-style-guide.rst       |   20 +-
 documentation/dev-manual/build-quality.rst         |    2 +-
 documentation/dev-manual/building.rst              |    2 +-
 documentation/dev-manual/debugging.rst             |   32 +-
 documentation/dev-manual/development-shell.rst     |    2 +-
 documentation/dev-manual/devtool.rst               |   14 +-
 documentation/dev-manual/layers.rst                |    6 +-
 documentation/dev-manual/libraries.rst             |    2 +-
 documentation/dev-manual/limiting-resources.rst    |    4 +-
 documentation/dev-manual/multiconfig.rst           |   20 +-
 documentation/dev-manual/new-machine.rst           |    2 +-
 documentation/dev-manual/new-recipe.rst            |   82 +-
 documentation/dev-manual/packages.rst              |    6 +-
 .../dev-manual/python-development-shell.rst        |    2 +-
 documentation/dev-manual/quilt.rst                 |    4 +-
 documentation/dev-manual/speeding-up-build.rst     |    4 +-
 documentation/kernel-dev/common.rst                |   24 +-
 documentation/migration-guides/migration-1.3.rst   |    2 +-
 documentation/migration-guides/migration-1.5.rst   |    4 +-
 documentation/migration-guides/migration-1.6.rst   |    2 +-
 documentation/migration-guides/migration-1.7.rst   |    8 +-
 documentation/migration-guides/migration-1.8.rst   |   10 +-
 documentation/migration-guides/migration-2.1.rst   |   20 +-
 documentation/migration-guides/migration-2.3.rst   |    4 +-
 documentation/migration-guides/migration-2.5.rst   |    2 +-
 documentation/migration-guides/migration-2.6.rst   |    6 +-
 documentation/migration-guides/migration-3.0.rst   |    2 +-
 documentation/migration-guides/migration-3.1.rst   |    2 +-
 documentation/migration-guides/migration-3.2.rst   |   12 +-
 documentation/migration-guides/migration-3.4.rst   |    2 +-
 documentation/migration-guides/migration-4.0.rst   |    6 +-
 documentation/migration-guides/migration-5.1.rst   |   14 +-
 documentation/migration-guides/migration-5.2.rst   |    2 +-
 .../migration-guides/release-notes-3.4.rst         |    2 +-
 .../migration-guides/release-notes-4.2.rst         |    2 +-
 .../migration-guides/release-notes-5.1.rst         |   12 +-
 .../migration-guides/release-notes-5.2.rst         |   14 +-
 .../migration-guides/release-notes-5.3.rst         |    6 +-
 .../migration-guides/release-notes-6.0.rst         |    8 +-
 documentation/oecore/doclinks.conf                 | 1064 ++++++++++++++++++++
 documentation/overview-manual/concepts.rst         |  150 +--
 documentation/ref-manual/classes.rst               |   60 +-
 documentation/ref-manual/devtool-reference.rst     |    2 +-
 documentation/ref-manual/faq.rst                   |    2 +-
 documentation/ref-manual/features.rst              |    4 +-
 documentation/ref-manual/qa-checks.rst             |   30 +-
 documentation/ref-manual/structure.rst             |   12 +-
 documentation/ref-manual/tasks.rst                 | 1056 +++++++++----------
 documentation/ref-manual/terms.rst                 |    6 +-
 documentation/ref-manual/variables.rst             |  114 +--
 documentation/test-manual/intro.rst                |    2 +-
 documentation/test-manual/runtime-testing.rst      |    2 +-
 documentation/tools/gen-doc-links                  |  112 +++
 54 files changed, 2017 insertions(+), 976 deletions(-)
---
base-commit: 358519ca6406a89fee42c45dcaf63a37a374f33c
change-id: 20260708-gen-doc-links-intersphinx-52c33ab9206b


