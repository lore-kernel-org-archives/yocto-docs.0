Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07F5AE7BDA2
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 11:27:12 +0000 (UTC)
Received: from smtp-42aa.mail.infomaniak.ch (smtp-42aa.mail.infomaniak.ch [84.16.66.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17614.1771241224740426653
 for <docs@lists.yoctoproject.org>;
 Mon, 16 Feb 2026 03:27:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@0leil.net header.s=20231125 header.b=cr/lfefs;
 spf=pass (domain: 0leil.net, ip: 84.16.66.170, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fF0qB274QzHHh;
	Mon, 16 Feb 2026 12:27:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1771241222;
	bh=QX6ME4kF7CCr92So9o5dmJN3tjabLKQZ6J/d5izzpuA=;
	h=From:Subject:Date:To:Cc:From;
	b=cr/lfefsXWq0x+kTSx0uXZANIZ9fYKLr2WN1p+ro1qgI3jxW2SGsUPKVDnQF+SmNT
	 11BJ9oCSMZg4N5ZGWoMDHPM+todyRG7Hd+Yq30JKpyGnV39ZEuxmGFebpvt9j/JGv4
	 +/znwZVwpPPmHEi78zo4B25xmHapW2SNlmJ7JnDR4AXGL0CZDLTdMMBV9AM1jvsmg0
	 cQRsOBFikGqrO+t0yX4v4Iw6TBtyb4cipPFS6pa67P/pMdLk8xdnvwAWRd1EUSqrPV
	 eS4pdqLx4XoPyC/U3QZELEsqB7vdYjnibjtEFcw3bVWdzAwY5TOwVqpyY6uU+NQaAu
	 C8y7TyERSvILg==
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4fF0q9300hz8yB;
	Mon, 16 Feb 2026 12:27:01 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH v4 0/3] migrate Debian/Ubuntu to pip packages for docs +
 fix epub and latexpdf targets not finding glob images
Date: Mon, 16 Feb 2026 12:26:52 +0100
Message-Id: <20260216-fix-make-multi-target-v4-0-749e588cb7f5@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNwQ6CMAwG4FchO1uzFhjiyfcwHibrYFHBDCQSw
 rs7iEZjwqXJ3/z9OoqWveNW7KNReO5d65o6hGQTiaLSdcngTMiCJKUoKQfrnnDTF4bb49o56LQ
 vuQNDhnOTWJtxIcLt3XMoLu7xFHLl2q7xw/Kmx3n7FmO5IvYIEghjhYoNWqkPRcXeD1vDYhZ7+
 iphrCkECBmzRqOSwqrzvxJ/FCUJcU2Jg4KodlpZTCm1v8o0TS++xE98RgEAAA==
X-Change-ID: 20251029-fix-make-multi-target-d2de9d4ff7ec
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 16 Feb 2026 11:27:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8925

This fixes images being improperly handled by our Make targets by
switching to a sphinx extension that generates a PNG or PDF of an SVG
upon request by Sphinx itself.

To do that, we need sphinxcontrib-svg2pdfconverter>=2.0.0 which is not
available for all supported distros, including Debian/Ubuntu which only
used packages from their official package feeds until now. This migrates
both distros to use pip packages for building the docs such that the
same instructions are used for all supported distros.
This however required to use a virtualenv to install packages, since
Debian doesn't allow using pip outside of a virtualenv since Bookworm
(12). So this migrates the pip package installation to use a virtualenv
as well. Since sourcing scripts in RUN commands to make variables
accessible in later container layers is not possible in Containerfile,
we do the same logic as in the venv bin/activate script manually in the
Containerfile.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Changes in v4:
- migrate all distros to use virtualenv for installing packages via pip,
- migrate Debian and Ubuntu to use pip installation steps for building
  the docs,
- tested all distros build correctly by running the `html epub` make
  targets (`all` doesn't work for almalinux, rockylinux and centos
  stream at the moment),
- Link to v3: https://patch.msgid.link/20260211-fix-make-multi-target-v3-1-1168a6f1525f@cherry.de

Changes in v3:
- rebased on top of master, rebuilt with `make all` no build error to be
  seen,
- Link to v2: https://patch.msgid.link/20251202-fix-make-multi-target-v2-1-7eea1d64cf6b@cherry.de

Changes in v2:
- switched to upstream sphinxcontrib-svg2pdfconverter since the
  necessary MR got merged and a new release made,
- removed IMAGEDIRS Make variable as it is now unused,
- added sphinxcontrib-svg2pdfconverter to Pipfile (not tested) and pip
  installation script,
- Link to v1: https://patch.msgid.link/20251030-fix-make-multi-target-v1-0-213616ed1f0a@cherry.de

---
Quentin Schulz (3):
      use a venv for installing packages with pip
      consistently use pip packages for all distros
      convert SVGs to PDF and PNG using sphinxcontrib.rsvgconverter plugin

 documentation/Makefile                             | 27 +++-------------------
 documentation/Pipfile                              |  2 ++
 documentation/conf.py                              |  1 +
 documentation/ref-manual/system-requirements.rst   |  3 +++
 documentation/tools/build-docs-container           |  4 +++-
 .../tools/containerfiles/Containerfile.apt         | 10 ++++++++
 .../tools/containerfiles/Containerfile.dnf         |  6 +++++
 .../tools/containerfiles/Containerfile.zypper      |  7 ++++++
 .../tools/host_packages_scripts/pip3_docs.sh       |  4 +++-
 .../tools/host_packages_scripts/ubuntu_docs.sh     |  2 +-
 10 files changed, 39 insertions(+), 27 deletions(-)
---
base-commit: 095981c08b9d63905472df5d1d60c07af96f0250
change-id: 20251029-fix-make-multi-target-d2de9d4ff7ec

Best regards,
--  
Quentin Schulz <quentin.schulz@cherry.de>


