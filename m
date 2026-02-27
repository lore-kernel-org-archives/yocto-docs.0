Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05F72FD5330
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:01:00 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92241.1772186449137566578
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Feb 2026 02:00:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=xKlUr243;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1570A1A1A54;
	Fri, 27 Feb 2026 10:00:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D777E5FE46;
	Fri, 27 Feb 2026 10:00:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E825D103693FF;
	Fri, 27 Feb 2026 11:00:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772186442; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=btsDDEuG24dky088A5tTF4BEIUVik9GwDTxsGAJZLg8=;
	b=xKlUr243gROl/YTJGIJOegddB7mLjUMcDhJhWCfmokGS+zkGTgc9ZODO5+zJkGXrUXdjfp
	OStOI18a1J+exS+1X7NaJ9gVYuXGE534mIXYCfHrUhQAKycjSH4Ph1kl+QdujeTgY9o74E
	bRp+8b/DeaaGvW0SvwoLxLq3J6HYktQJQvsckrQjQFQQ0SuZZqzcBwL9UTPLHurYpOv8/6
	cVHztZ5qDP5ET1/vsAlE/RL02CQOyFmB/hLsCxESqtfynHwt1V3nPVBKICTuC53I1LpcJG
	LVDsAUjp63HpShWCDQmn2CXGlvQmg04TxfZtWG3Ed8T2B9TPCXYmQGetjAmkyQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 11:00:39 +0100
Message-Id: <DGPNNV5207RI.3V92ES0XIXL1I@bootlin.com>
Subject: [whinlatter] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 Feb 2026 10:01:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9006

The following changes since commit 9c363d270ab45f3443391fb7275817db69d8a5d4=
:

  migration-guides/migration-5.3.rst: add note on *FLAGS behavior change (2=
026-02-11 15:19:36 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs whinlatter-next

for you to fetch changes up to f34c14ce30d74f2c1fc4d7150d1175a6f911a1a3:

  qemu.rst: parsing of the code-block was not done (2026-02-27 09:16:39 +01=
00)

----------------------------------------------------------------
Antonin Godard (3):
      tools/host_packages_scripts/tlmgr_docs_pdf.sh: install perl
      what-i-wish-id-known.rst: replace figure by the new SVG
      Makefile: pass -silent to latexmk

Jan Vermaete (1):
      qemu.rst: parsing of the code-block was not done

Michael Opdenacker (1):
      ref-manual/classes.rst: fix broken links to U-Boot documentation

Robert P. J. Day (1):
      dev-manual: delete references to "tar" package format

 documentation/Makefile                                 |   2 +-
 documentation/dev-manual/packages.rst                  |   6 +++---
 documentation/dev-manual/qemu.rst                      |   2 +-
 documentation/figures/yp-how-it-works-new-diagram.png  | Bin 219234 -> 0 b=
ytes
 documentation/ref-manual/classes.rst                   |   4 ++--
 .../tools/host_packages_scripts/tlmgr_docs_pdf.sh      |   2 +-
 documentation/what-i-wish-id-known.rst                 |   2 +-
 7 files changed, 9 insertions(+), 9 deletions(-)
 delete mode 100644 documentation/figures/yp-how-it-works-new-diagram.png

