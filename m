Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CB7FE7542C
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 09:04:40 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.117209.1766567074739034819
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 01:04:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=LH0Tt0pe;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 89514C1A59E
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 09:04:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ABF876073D;
	Wed, 24 Dec 2025 09:04:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 06D3210AB1012;
	Wed, 24 Dec 2025 10:04:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766567072; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Qi2efeZ0eAbsi6yIINBEXZ9FC9dGBMRHxfWegWiNIFM=;
	b=LH0Tt0peyx52ojvJAul52yM9i8x+ZoGWBXGd8VOk0OFTPRUC5PuG6b3EGwe8xTX49KpRGT
	p50aAaWnFETufj6KU4DBD/GRECO5nI5cwCSPkA7ASM1NllPaU/r4fMDrHY6U1cwLowSfgZ
	asmLCnsnbAopwCQOW+ABcoASfpO0FxYCkzUIBE13TMJi4CydfH0mcL9kaMgjlAJU2bk+dI
	bxFmEvwl/S674SSGkTJR083fNkb1Q1KLRFHzZXYEi4Wh0e4SzWIKUQyNGSP/ED7//pnMjH
	MOrEl+IrMQ6yNa7KqLoOmnscYlgSntNZk8XuhK6fbB2JjMz8pf0KTqjatmPC4w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 24 Dec 2025 10:04:31 +0100
Message-Id: <DF6BRH5HNZDT.110EA2RAJNP80@bootlin.com>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 09:04:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8322

The following changes since commit d84d916d4fc505e8386693306b6a90b0064c0518=
:

  brief-yoctoprojectqs/index.rst: fix improper code-block indentation (2025=
-12-16 15:04:45 +0000)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to f9042e1da554017fe46460c1fd2bdf8c74b3fa18:

  ref-manual: drop documentation for oelint class (2025-12-19 10:43:34 +010=
0)

----------------------------------------------------------------
Antonin Godard (9):
      ref-manual/classes.rst: document the image-container class
      tools/build-docs-container: move container files in their own directo=
ry
      Makefile: fix rsvg-convert --format capitalization
      tools/build-docs-container: add CentOS Stream 9 support
      ref-manual/system-requirements.rst: fix AlmaLinux PDF build
      ref-manual/system-requirements.rst: add RockyLinux install instructio=
ns
      migration-guides: add Wrynose release note templates
      Add the sphinx-copybutton extension
      ref-manual: drop documentation for oelint class

Lee Chee Yang (1):
      migration-guide: update 5.3 release notes download section

 documentation/Makefile                             |   4 +-
 documentation/Pipfile                              |   1 +
 documentation/conf.py                              |   4 +
 documentation/migration-guides/index.rst           |   1 +
 documentation/migration-guides/migration-6.0.rst   |  70 +++++++++++
 documentation/migration-guides/release-6.0.rst     |  10 ++
 .../migration-guides/release-notes-5.3.rst         |  84 +++++++++++--
 .../migration-guides/release-notes-6.0.rst         | 131 +++++++++++++++++=
++++
 documentation/ref-manual/classes.rst               |  61 +++++++---
 documentation/ref-manual/system-requirements.rst   | 105 +++++++++++++++--
 documentation/ref-manual/variables.rst             |  18 +++
 documentation/tools/build-docs-container           |  55 ++++++---
 .../{ =3D> containerfiles}/Containerfile.almalinux   |   0
 .../tools/{ =3D> containerfiles}/Containerfile.apt   |   0
 .../{ =3D> containerfiles}/Containerfile.debian      |   0
 .../tools/{ =3D> containerfiles}/Containerfile.dnf   |   3 +
 .../{ =3D> containerfiles}/Containerfile.fedora      |   0
 .../tools/containerfiles/Containerfile.rocky       |   1 +
 .../tools/containerfiles/Containerfile.stream      |   1 +
 .../{ =3D> containerfiles}/Containerfile.ubuntu      |   0
 .../{ =3D> containerfiles}/Containerfile.zypper      |   0
 .../tools/host_packages_scripts/almalinux_docs.sh  |   2 +-
 .../host_packages_scripts/almalinux_docs_pdf.sh    |   1 -
 .../host_packages_scripts/almalinux_essential.sh   |   6 +-
 .../host_packages_scripts/centosstream_docs.sh     |   1 +
 .../centosstream_essential.sh                      |   1 +
 .../tools/host_packages_scripts/pip3_docs.sh       |   2 +-
 .../tools/host_packages_scripts/rockylinux_docs.sh |   1 +
 .../host_packages_scripts/rockylinux_essential.sh  |   1 +
 .../tools/host_packages_scripts/tlmgr_docs_pdf.sh  |   8 ++
 .../tools/host_packages_scripts/ubuntu_docs.sh     |   2 +-
 31 files changed, 521 insertions(+), 53 deletions(-)
 create mode 100644 documentation/migration-guides/migration-6.0.rst
 create mode 100644 documentation/migration-guides/release-6.0.rst
 create mode 100644 documentation/migration-guides/release-notes-6.0.rst
 rename documentation/tools/{ =3D> containerfiles}/Containerfile.almalinux =
(100%)
 rename documentation/tools/{ =3D> containerfiles}/Containerfile.apt (100%)
 rename documentation/tools/{ =3D> containerfiles}/Containerfile.debian (10=
0%)
 rename documentation/tools/{ =3D> containerfiles}/Containerfile.dnf (91%)
 rename documentation/tools/{ =3D> containerfiles}/Containerfile.fedora (10=
0%)
 create mode 120000 documentation/tools/containerfiles/Containerfile.rocky
 create mode 120000 documentation/tools/containerfiles/Containerfile.stream
 rename documentation/tools/{ =3D> containerfiles}/Containerfile.ubuntu (10=
0%)
 rename documentation/tools/{ =3D> containerfiles}/Containerfile.zypper (10=
0%)
 delete mode 100644 documentation/tools/host_packages_scripts/almalinux_doc=
s_pdf.sh
 create mode 120000 documentation/tools/host_packages_scripts/centosstream_=
docs.sh
 create mode 120000 documentation/tools/host_packages_scripts/centosstream_=
essential.sh
 create mode 120000 documentation/tools/host_packages_scripts/rockylinux_do=
cs.sh
 create mode 120000 documentation/tools/host_packages_scripts/rockylinux_es=
sential.sh
 create mode 100644 documentation/tools/host_packages_scripts/tlmgr_docs_pd=
f.sh

