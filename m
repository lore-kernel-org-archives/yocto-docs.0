Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D00FAD29DFC
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 09:54:10 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55508.1768298048862587433
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 01:54:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=b5do2w76;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 09F1E4E420A1
	for <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 09:54:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CA4706073B;
	Tue, 13 Jan 2026 09:54:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AD5F4103C92EC;
	Tue, 13 Jan 2026 10:54:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768298046; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=feNVrTv1WQAq/x47uctu9RIa/V1/zuDfPTZaSp7c358=;
	b=b5do2w76ypsjW8cJqax4TdE0rK9nKQDVt1AAqynfqzhufOmuY1kc5A2kBsXu+HKU5wiVM1
	TTKbQl43ACHW1biiUvZx5vHrbD5g2YGctl10ZaKbLJA2pbcOpzjckRUqTTUKOAzgmPi244
	KlLSWllBRLUN4ONjhbz/fkwLzT50GLd7axEWsDR2xB6EKalByZ7B+H+BOS0+NbMgD/wxhZ
	ZliKOCBsnzv4s8AZSz6etRZoIKrJL+1EkREEWmjxWFAh8pkaDH77hkGYjK2pgvBZGYzf4W
	/FYcF265gFFLWiEKAtp3vq0nWeGFjZkG8tfbGfdt32sRpkcgke5ZrUlPnnNLLQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Jan 2026 10:54:05 +0100
Message-Id: <DFNDCBHUWM1Y.1XFNAP47MNOSO@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 09:54:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8476

The following changes since commit 5c2b70c5f854eea8b712c6c0c3395ceb8dd7d974=
:

  Fix bitbake version mapping for whinlatter (2026-01-09 15:00:38 +0000)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to b8a56b8b2e8c0417b2f7204f80c79b05d95e9ce4:

  contributor-guide/recipe-style-guide.rst: explain difference between laye=
r and recipe license(s) (2026-01-13 09:47:57 +0100)

----------------------------------------------------------------
Antonin Godard (12):
      Add a security manual
      Move security related manuals to the security manual
      security-manual/securing-images.rst: remove old links
      test-manual/ptest.rst: detail the exit code and output requirements
      ref-manual/release-process.rst: add a "Development Cycle" section
      overview-manual/yp-intro.rst: fix SDK type in bullet list
      overview-manual: convert YP-flow-diagram.png to SVG
      Remove diagrams directory
      dev-manual/qemu: add an example for the snapshot+nographic mode
      ref-manual/variables.rst: document the CCACHE_TOP_DIR variable
      set_versions.py: remove missing_tags array
      contributor-guide/recipe-style-guide.rst: explain difference between =
layer and recipe license(s)

Pierre-Loup GOSSE (2):
      ref-manual/variables.rst: document UBOOT_INITIAL_ENV_BINARY variables
      migration-guides/release-notes-6.0.rst: add U-Boot initial env binary

 diagrams/poky-buildprocess/Pokyarch_diag.jpg       |  Bin 285707 -> 0 byte=
s
 diagrams/poky-buildprocess/Pokyarch_diag.svg       |  205 ---
 diagrams/poky-buildprocess/Pokyarch_diag2.svg      | 1544 ----------------=
----
 diagrams/poky-buildprocess/pokyarch4.dia           |  Bin 3495 -> 0 bytes
 diagrams/poky-buildprocess/pokyarch4.png           |  Bin 52531 -> 0 bytes
 .../contributor-guide/recipe-style-guide.rst       |   14 +
 documentation/contributor-guide/submit-changes.rst |    2 +-
 documentation/dev-manual/index.rst                 |    3 -
 documentation/dev-manual/qemu.rst                  |   11 +
 documentation/dev-manual/sbom.rst                  |    2 +-
 documentation/index.rst                            |    1 +
 .../migration-guides/release-notes-4.2.rst         |    2 +-
 .../migration-guides/release-notes-6.0.rst         |    6 +
 documentation/overview-manual/concepts.rst         |    4 +-
 .../overview-manual/figures/YP-flow-diagram.png    |  Bin 190715 -> 0 byte=
s
 .../overview-manual/svg/yp-flow-diagram.svg        |  950 ++++++++++++
 documentation/overview-manual/yp-intro.rst         |    5 +-
 documentation/ref-manual/classes.rst               |    2 +-
 documentation/ref-manual/faq.rst                   |    2 +-
 documentation/ref-manual/features.rst              |    2 +-
 documentation/ref-manual/release-process.rst       |   39 +
 documentation/ref-manual/variables.rst             |   56 +-
 documentation/security-manual/index.rst            |   19 +
 documentation/security-manual/intro.rst            |   28 +
 .../read-only-rootfs.rst                           |    0
 .../securing-images.rst                            |   20 +-
 .../vulnerabilities.rst                            |    0
 documentation/set_versions.py                      |   30 +-
 documentation/test-manual/ptest.rst                |   19 +
 29 files changed, 1155 insertions(+), 1811 deletions(-)
 delete mode 100644 diagrams/poky-buildprocess/Pokyarch_diag.jpg
 delete mode 100644 diagrams/poky-buildprocess/Pokyarch_diag.svg
 delete mode 100644 diagrams/poky-buildprocess/Pokyarch_diag2.svg
 delete mode 100644 diagrams/poky-buildprocess/pokyarch4.dia
 delete mode 100644 diagrams/poky-buildprocess/pokyarch4.png
 delete mode 100644 documentation/overview-manual/figures/YP-flow-diagram.p=
ng
 create mode 100644 documentation/overview-manual/svg/yp-flow-diagram.svg
 create mode 100644 documentation/security-manual/index.rst
 create mode 100644 documentation/security-manual/intro.rst
 rename documentation/{dev-manual =3D> security-manual}/read-only-rootfs.rs=
t (100%)
 rename documentation/{dev-manual =3D> security-manual}/securing-images.rst=
 (88%)
 rename documentation/{dev-manual =3D> security-manual}/vulnerabilities.rst=
 (100%)

