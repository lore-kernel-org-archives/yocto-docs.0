Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D086E75426
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 09:04:40 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.117208.1766567074637493988
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 01:04:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=n13g7kxU;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AA9371A23CB;
	Wed, 24 Dec 2025 09:04:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6F7F560742;
	Wed, 24 Dec 2025 09:04:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 903CE10AB1010;
	Wed, 24 Dec 2025 10:04:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766567071; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=/5aYLYFL4cec/wwa+hwqhSM5eTfkWOUIKDpflGsGkBs=;
	b=n13g7kxUbRdl3ocvGf2OEa1a78AQf+De+8sYoy0l3y3gYhcsG//RF4f0/dYXB/8dpfjHtZ
	MehSXpXZJsThuO0/1SuiTsaASCcGUaRtVvLpX8caFrimxq+QS37UMls+mHruqNtnr/M0Zi
	98msM9Kxx3XTDh0qwS8pUFSETOMPKEAfoxFlgScYwUUQ/YgoQB/RN30Ffs0LBD6S8p6w6Y
	iKA2fvxSM81fF2UjRWq2Ct6Pb1vKTLr6qxLQG/1wimhapSUsHEE5fZ1ZLxbQf3iglqZM8d
	0iFNfbjjawesmxY41PDHsLIMPgOWwSnHfzcdOpPa0NXAFIUSBRW6ysdh+wUSnw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 24 Dec 2025 10:04:31 +0100
Message-Id: <DF6BRGXQ4FK0.1O17MP77M8S@bootlin.com>
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [whinlatter] Pull request
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 09:04:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8321

The following changes since commit e7b40b71dec8d4aee2e7b711e7c1083b2920f171=
:

  migration-guide: update 5.3 release notes download section (2025-12-17 10=
:55:50 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs whinlatter-next

for you to fetch changes up to 5cb8899781a91fa511b4a84c22eda23a16806a73:

  Add the sphinx-copybutton extension (2025-12-24 09:58:45 +0100)

----------------------------------------------------------------
Antonin Godard (7):
      ref-manual/classes.rst: document the image-container class
      Makefile: fix rsvg-convert --format capitalization
      tools/build-docs-container: move container files in their own directo=
ry
      tools/build-docs-container: add CentOS Stream 9 support
      ref-manual/system-requirements.rst: fix AlmaLinux PDF build
      ref-manual/system-requirements.rst: add RockyLinux install instructio=
ns
      Add the sphinx-copybutton extension

 documentation/Makefile                             |   4 +-
 documentation/Pipfile                              |   1 +
 documentation/conf.py                              |   4 +
 documentation/ref-manual/classes.rst               |  47 +++++++++
 documentation/ref-manual/system-requirements.rst   | 105 +++++++++++++++++=
++--
 documentation/ref-manual/variables.rst             |  18 ++++
 documentation/tools/build-docs-container           |  55 +++++++----
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
 26 files changed, 232 insertions(+), 32 deletions(-)
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

