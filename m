Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4ECEF3C9BE
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 16:33:04 +0000 (UTC)
Received: from smtp-190f.mail.infomaniak.ch (smtp-190f.mail.infomaniak.ch [185.125.25.15])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24390.1771950777993697793
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 08:32:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@0leil.net header.s=20231125 header.b=JgtmDzIl;
 spf=pass (domain: 0leil.net, ip: 185.125.25.15, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fL3DR5WJzzjRF;
	Tue, 24 Feb 2026 17:32:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1771950775;
	bh=7/9kZwDJqhnXcDGAbgvzn6FbRLjYytB32SJqfbvVzus=;
	h=From:Subject:Date:To:Cc:From;
	b=JgtmDzIl29aG7HHTia07vKpGb0+kEqq5r0dvlIR/xZ3yGgqeiDtPX46Tp9Z02ncht
	 yoTY0JtrodZwRGWcGL752BHYSOBryoAsfV7FL+euZhREpFCb5iKvCJkc37RXPOKeuR
	 tMkiI2qHusQSXRAYgy+eF96PToDJaK2P2S7hKeHXBmLJHF0tlJ/03/EYYi6gAKJ8Kl
	 fKo5KFtkutbLGyc+zGjTF9DJl462DntQADU5w8Czr+X49NuLHOk+4eYRnkvxEE7Tuc
	 UveR/nyTLjtCeRiEfP5kb9I5DkH6CCqwzEsZUuGOgHDQJ0oSOiQ/bgSt+T9ORtndU6
	 xteCSxXGZsThQ==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4fL3DQ6mL1zW5h;
	Tue, 24 Feb 2026 17:32:54 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH v5 0/4] venv migration for docs, migrate Debian/Ubuntu to
 it, fix epub and latexpdf targets not finding glob images
Date: Tue, 24 Feb 2026 17:32:35 +0100
Message-Id: <20260224-fix-make-multi-target-v5-0-7ebf281618b4@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XPwQrCMAwG4FeRno00WdttnnwP8VDb1BV1SjeHI
 nt3qyiKsEvgD8kXchcdp8idWM7uIvEQu3hqc9DzmXCNbXcM0ecsSJJGSTWEeIWj3TMcL4c+Qm/
 Tjnvw5Ln2KoSSnci758R58OWuNzk3setP6fY6M+Cz+xYLOSEOCBIIC4OGPQZpV67hlG4Lz+IpD
 vRVcplSCBBKZoveKBfM9l8pPoqRhDilFFlBNJU1ATXp8K+oX8VMKSp/VKqadVW5bRn0rzKO4wN
 Ft3tajAEAAA==
X-Change-ID: 20251029-fix-make-multi-target-d2de9d4ff7ec
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Feb 2026 16:33:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8978

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

Unlike agreed upon during review of v4, I actually decided to NOT do a
sed on ./yocto-docs-venv in pip3_docs.sh because we don't actually need
to. . ($PWD) currently seems to be resolved to / (the default location
for WORKDIR if unmodified by us or our base image (listed in FROM)) so
that means the venv will be outside of the /docs mount.

We may want to think about migrating the instructions in Containerfile
as being run with a non-root user to better match what the user will be
doing. I'm not sure this is straightforward (need to create a user
within the container likely with a stable UID/GID and make sure it's
mapped correctly to the user outside of the container). Just something I
thought when working on this.

This was tested by commenting out /temp/host_packages_docs_pdf.sh in
Containerfiles because ain't nobody got time for installing all those
packages and then running

for distro in almalinux:8 almalinux:9 centos:stream9 fedora:39 fedora:40 fedora:41 fedora:42 leap:15.5 leap:15.6 rockylinux:8 rockylinux:9 debian:12 debian:13 ubuntu:22.04 ubuntu:24.04 ubuntu:25.04 ubuntu:25.10; do
	echo "============$distro==============="
	git clean -ffdx
	CONTAINERCMD=podman tools/build-docs-container $distro html epub || echo $distro >> ../../fail.log
done

Nothing written to fail.log :)

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Changes in v5:
- switched to relative path for the venv,
- renamed venv to yocto-docs-venv,
- added patch to switch from sphinx-build to python3 -m sphinx for
  better working with venv,
- dropped --system-site-packages from venv as it isn't working due
  to sphinxcontrib-svg2pdfconverter v2.0.0 breaking sphinxcontrib
  namespace,
- slightly reworded commit logs to explain design choices (specifically
  why not using --system-site-packages for the venv),
- Link to v4: https://patch.msgid.link/20260216-fix-make-multi-target-v4-0-749e588cb7f5@cherry.de

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
Quentin Schulz (4):
      Makefile: use python3 -m sphinx instead of sphinx-build
      use a venv for installing packages with pip
      consistently use pip packages for all distros
      convert SVGs to PDF and PNG using sphinxcontrib.rsvgconverter plugin

 documentation/Makefile                             | 33 ++++------------------
 documentation/Pipfile                              |  2 ++
 documentation/conf.py                              |  1 +
 documentation/ref-manual/system-requirements.rst   |  3 ++
 documentation/tools/build-docs-container           |  4 ++-
 .../tools/containerfiles/Containerfile.apt         | 14 +++++++++
 .../tools/containerfiles/Containerfile.dnf         | 11 ++++++++
 .../tools/containerfiles/Containerfile.zypper      | 11 ++++++++
 .../tools/host_packages_scripts/pip3_docs.sh       |  4 ++-
 .../tools/host_packages_scripts/ubuntu_docs.sh     |  2 +-
 10 files changed, 55 insertions(+), 30 deletions(-)
---
base-commit: b70b4599a18ab6261f0c51f51c09f7f1c1bca093
change-id: 20251029-fix-make-multi-target-d2de9d4ff7ec

Best regards,
--  
Quentin Schulz <quentin.schulz@cherry.de>


