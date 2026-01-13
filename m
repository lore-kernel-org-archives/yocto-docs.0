Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF05DD29DFE
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 09:54:20 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.55747.1768298049353344008
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 01:54:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=AlsXsu6o;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 66335C20879
	for <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 09:53:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DCD946075A;
	Tue, 13 Jan 2026 09:54:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7D14D103C92E6;
	Tue, 13 Jan 2026 10:54:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768298046; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Flfx7rM4Hvkr9SARRXCnf7aFJYK5U5R3NksxXrQN3Qs=;
	b=AlsXsu6ouWcy9Lz728rLLKqvpQGihjlsghonS6KSigQe6I4zyZsR2ujHYsiKCU9gjDIMOt
	imnU3/d3w2/hKnCoKQtACpHMx6m99vLe7rwMg6TguzNEqqnJIIXZqi7tFvWWUNm3uZdsxv
	k1ORJpammrcHl7rpikZ2O8J123ZsXa//lRqCviJan6TjL9TbapJT9bzR3SkEmix/X9Xd6K
	pPgPd2sYeTfVH9TYfHAIOhEFoMte3FE2yioLRiIZzTXa3tsCbTvbJ5jX3djUUL6gxTdOqt
	pMxSOHLuc4Gxsx+LK4ZZPcBcVOpo0P/+IN4cvKBmTuB5jdG5UdiNFQ9HlbkJ7w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Jan 2026 10:54:04 +0100
Message-Id: <DFNDCBAFKMQ0.1SZFJLNOJEVLX@bootlin.com>
Subject: [whinlatter] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 09:54:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8478

The following changes since commit 102a33294e63a5581c413555040f790161fc80ff=
:

  Fix bitbake version mapping for whinlatter (2026-01-09 15:00:43 +0000)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs whinlatter-next

for you to fetch changes up to ea0501a135043aefc7c6049be811f4c1277f1f8b:

  contributor-guide/recipe-style-guide.rst: explain difference between laye=
r and recipe license(s) (2026-01-13 09:59:23 +0100)

----------------------------------------------------------------
Antonin Godard (12):
      Add a new "Security" section
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
      contributor-guide/recipe-style-guide.rst: explain difference between =
layer and recipe license(s)

 diagrams/poky-buildprocess/Pokyarch_diag.jpg       |  Bin 285707 -> 0 byte=
s
 diagrams/poky-buildprocess/Pokyarch_diag.svg       |  205 ---
 diagrams/poky-buildprocess/Pokyarch_diag2.svg      | 1544 ----------------=
----
 diagrams/poky-buildprocess/pokyarch4.dia           |  Bin 3495 -> 0 bytes
 diagrams/poky-buildprocess/pokyarch4.png           |  Bin 52531 -> 0 bytes
 .../contributor-guide/recipe-style-guide.rst       |   14 +
 documentation/contributor-guide/submit-changes.rst |    2 +-
 documentation/dev-manual/index.rst                 |    4 -
 documentation/dev-manual/qemu.rst                  |   11 +
 documentation/dev-manual/sbom.rst                  |    2 +-
 documentation/dev-manual/security-subjects.rst     |  194 ---
 documentation/index.rst                            |    8 +-
 .../migration-guides/release-notes-4.2.rst         |    2 +-
 .../migration-guides/release-notes-4.3.rst         |    2 +-
 documentation/overview-manual/concepts.rst         |    4 +-
 .../overview-manual/figures/YP-flow-diagram.png    |  Bin 190715 -> 0 byte=
s
 .../overview-manual/svg/yp-flow-diagram.svg        |  950 ++++++++++++
 documentation/overview-manual/yp-intro.rst         |    5 +-
 documentation/ref-manual/classes.rst               |    2 +-
 documentation/ref-manual/faq.rst                   |    2 +-
 documentation/ref-manual/features.rst              |    2 +-
 documentation/ref-manual/release-process.rst       |   39 +
 documentation/ref-manual/variables.rst             |   10 +-
 documentation/security-manual/index.rst            |   19 +
 documentation/security-manual/intro.rst            |   28 +
 .../read-only-rootfs.rst                           |    0
 .../securing-images.rst                            |   20 +-
 .../vulnerabilities.rst                            |    0
 documentation/security-reference/index.rst         |   14 +
 .../reporting-vulnerabilities.rst                  |   85 ++
 documentation/security-reference/security-team.rst |  110 ++
 documentation/test-manual/ptest.rst                |   19 +
 32 files changed, 1318 insertions(+), 1979 deletions(-)
 delete mode 100644 diagrams/poky-buildprocess/Pokyarch_diag.jpg
 delete mode 100644 diagrams/poky-buildprocess/Pokyarch_diag.svg
 delete mode 100644 diagrams/poky-buildprocess/Pokyarch_diag2.svg
 delete mode 100644 diagrams/poky-buildprocess/pokyarch4.dia
 delete mode 100644 diagrams/poky-buildprocess/pokyarch4.png
 delete mode 100644 documentation/dev-manual/security-subjects.rst
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
 create mode 100644 documentation/security-reference/index.rst
 create mode 100644 documentation/security-reference/reporting-vulnerabilit=
ies.rst
 create mode 100644 documentation/security-reference/security-team.rst

