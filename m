Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9C96FD532D
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:00:59 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92240.1772186449094516701
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Feb 2026 02:00:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=QliEAbKq;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 85FDD4E40C4E
	for <docs@lists.yoctoproject.org>; Fri, 27 Feb 2026 10:00:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 570CB5FE46;
	Fri, 27 Feb 2026 10:00:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 56CE510369403;
	Fri, 27 Feb 2026 11:00:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772186442; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=mA4kyM+0oO3ARzNALStwru2QuX2371aaGMXaaz5rnxo=;
	b=QliEAbKqMSve6tcBWrZiTVJgAahlmMWFTmvLiCnKKhD2/zrVhy3HbMbhBgkV7ZA9ZhRKJ7
	f/Sm49Anq2/Oe4Hr/9G9kwR7UQj/CEP/2s5TSDHGwYa8j9MgnMv0KnFX74ZFe6Nu6RanU5
	yq3Dl87by19IEAxhgrKj706ZLFtMB/jeZhWricmNQ6aqo8g/VhEpxfAWjbZsYYdiz+jD3K
	yjmXiiXrGILlSOIf5Q6Ka11uf9fiUUsf13SxtacMWzs02iopfXrivAMPpAMf1WPUhVb2ne
	kB/uYSSBorNbccc03Ia2QOquhXuc/Cifbzu2ALz/dnW/ahN1Gqmz16016Hns6A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 11:00:39 +0100
Message-Id: <DGPNNVBDOVB1.182FDKTY67Q39@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 Feb 2026 10:00:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9003

The following changes since commit 7570d210e90cc8fc6c8346f97504111ddeafb539=
:

  _templates/footer.html: show a dynamically created id of the docs (2026-0=
2-24 17:35:16 +0000)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to d97cfeaa55ed42722998d3313c1857aa377f6881:

  tools/containerfiles: fix docker warning (2026-02-27 10:54:14 +0100)

----------------------------------------------------------------
Antonin Godard (5):
      docs-wide: remove Bazaar fetcher references
      tools/host_packages_scripts/tlmgr_docs_pdf.sh: install perl
      what-i-wish-id-known.rst: replace figure by the new SVG
      Makefile: pass -silent to latexmk
      tools/containerfiles: fix docker warning

Jan Vermaete (1):
      qemu.rst: parsing of the code-block was not done

Kamel Bouhara (Schneider Electric) (1):
      ref-manual: add SPDX_INCLUDE_KERNEL_CONFIG and SPDX_INCLUDE_PACKAGECO=
NFIG

Michael Opdenacker (1):
      ref-manual/classes.rst: fix broken links to U-Boot documentation

Quentin Schulz (4):
      Makefile: use python3 -m sphinx instead of sphinx-build
      use a venv for installing packages with pip
      consistently use pip packages for all distros
      convert SVGs to PDF and PNG using sphinxcontrib.rsvgconverter plugin

Robert P. J. Day (1):
      dev-manual: delete references to "tar" package format

 documentation/Makefile                             |  35 +++------------
 documentation/Pipfile                              |   2 +
 documentation/conf.py                              |   1 +
 documentation/dev-manual/external-scm.rst          |   2 +-
 documentation/dev-manual/packages.rst              |   6 +--
 documentation/dev-manual/qemu.rst                  |   2 +-
 documentation/dev-manual/sbom.rst                  |   6 +++
 .../figures/yp-how-it-works-new-diagram.png        | Bin 219234 -> 0 bytes
 documentation/migration-guides/migration-1.3.rst   |   2 -
 .../migration-guides/release-notes-6.0.rst         |   6 +++
 documentation/ref-manual/classes.rst               |   4 +-
 documentation/ref-manual/system-requirements.rst   |   3 ++
 documentation/ref-manual/variables.rst             |  48 +++++++++++++++++=
++--
 documentation/tools/build-docs-container           |   4 +-
 .../tools/containerfiles/Containerfile.apt         |  18 ++++++++
 .../tools/containerfiles/Containerfile.dnf         |  15 +++++++
 .../tools/containerfiles/Containerfile.zypper      |  15 +++++++
 .../tools/host_packages_scripts/pip3_docs.sh       |   4 +-
 .../tools/host_packages_scripts/tlmgr_docs_pdf.sh  |   2 +-
 .../tools/host_packages_scripts/ubuntu_docs.sh     |   2 +-
 documentation/what-i-wish-id-known.rst             |   2 +-
 21 files changed, 133 insertions(+), 46 deletions(-)
 delete mode 100644 documentation/figures/yp-how-it-works-new-diagram.png

