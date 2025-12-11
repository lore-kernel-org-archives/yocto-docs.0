Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0AB0D41C1E
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 10:23:51 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6384.1765448625523253014
 for <docs@lists.yoctoproject.org>;
 Thu, 11 Dec 2025 02:23:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ILxfgBBE;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 05AB24E41B6E
	for <docs@lists.yoctoproject.org>; Thu, 11 Dec 2025 10:23:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CF1756068C;
	Thu, 11 Dec 2025 10:23:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C1980103C8E11;
	Thu, 11 Dec 2025 11:23:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765448623; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=bILKDIVpyutbAL5caxNYYeVJEm+EPmoNMQDmhmHgPBM=;
	b=ILxfgBBEI5lNshn+cCIY4VrSIL2l71n5ScyHa4MnzeOvLForCqE/JW/f0uAlXyrglJrSOJ
	e6yAiNWvTjKUgEaFUoLM8W0tbf96Z8iS7Zu8PDbLRnfq4T0fQ9X0HmPsPGAhUwiOCUNbNz
	FY0pz0sdii7gTOLSGPJjnWRMtoDiKPa6LWjuxjz0t2FJsZWIS4opcQ6jvv9yFTakc21P+4
	pngybpOZbTzE32ax0o0J6GoTuQKY2nJOp2lfXGYnsXpZHG9Ih+XsNSuUfvuBTOl1QKEi6m
	+005932zLORGUJqimoUYfjGlXaY8PD3j5LT/w05b+hKVyeePdUb2t6GymT+Xmg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Dec 2025 11:23:42 +0100
Message-Id: <DEVBB0I6YWNS.LU8EZV02UUQ4@bootlin.com>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 11 Dec 2025 10:23:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8251

The following changes since commit c9b19880d281be41660306f1f7456b9735c21487=
:

  migration-guides/release-notes-5.3.rst: latest changes from master (2025-=
11-28 16:35:20 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to 81e14ca2d5cff9e2104c556655144b069633790c:

  Add a new "Security" section (2025-12-11 10:43:45 +0100)

----------------------------------------------------------------
Antonin Godard (15):
      ref-manual/variables.rst: NVD_DB_VERSION: fix default value
      dev-manual/temporary-source-code.rst: fix definition of WORKDIR
      overview-manual/yp-intro.rst: change removed ECOSYSTEM to ABOUT
      overview-manual/yp-intro.rst: link to YP members and participants
      ref-manual/svg/releases.svg: mark styhead and walnascar EOL
      ref-manual/svg/releases.svg: mark whinlatter as current release
      poky.yaml.in: split automatic and manually replaced macros
      ref-manual/yocto-project-supported-features.rst: fix TSC wiki links
      contributor-guide/submit-changes.rst: remove mention of Upstream-Stat=
us
      tools/build-docs-container: move container files in their own directo=
ry
      Makefile: fix rsvg-convert --format capitalization
      tools/build-docs-container: add CentOS Stream 9 support
      ref-manual/system-requirements.rst: fix AlmaLinux PDF build
      ref-manual/system-requirements.rst: add RockyLinux install instructio=
ns
      Add a new "Security" section

Lee Chee Yang (1):
      migration-guides: add release notes for 5.0.14

 documentation/Makefile                             |   4 +-
 documentation/contributor-guide/submit-changes.rst |   8 +-
 documentation/dev-manual/index.rst                 |   1 -
 documentation/dev-manual/security-subjects.rst     | 194 -----------------=
--
 documentation/dev-manual/temporary-source-code.rst |  14 +-
 documentation/index.rst                            |   7 +-
 documentation/migration-guides/release-5.0.rst     |   1 +
 .../migration-guides/release-notes-4.3.rst         |   2 +-
 .../migration-guides/release-notes-5.0.14.rst      | 211 +++++++++++++++++=
++++
 documentation/overview-manual/yp-intro.rst         |   9 +-
 documentation/poky.yaml.in                         |  15 +-
 documentation/ref-manual/svg/releases.svg          |  16 +-
 documentation/ref-manual/system-requirements.rst   | 102 +++++++++-
 documentation/ref-manual/variables.rst             |   4 +-
 .../yocto-project-supported-features.rst           |   4 +-
 documentation/security-reference/index.rst         |  14 ++
 .../reporting-vulnerabilities.rst                  |  85 +++++++++
 documentation/security-reference/security-team.rst | 110 +++++++++++
 documentation/tools/build-docs-container           |  55 ++++--
 .../tools/containerfiles/Containerfile.almalinux   |   1 +
 .../tools/{ =3D> containerfiles}/Containerfile.apt   |   0
 .../{ =3D> containerfiles}/Containerfile.debian      |   0
 .../tools/{ =3D> containerfiles}/Containerfile.dnf   |   3 +
 .../{ =3D> containerfiles}/Containerfile.fedora      |   0
 .../tools/containerfiles/Containerfile.rocky       |   1 +
 .../Containerfile.stream}                          |   0
 .../{ =3D> containerfiles}/Containerfile.ubuntu      |   0
 .../{ =3D> containerfiles}/Containerfile.zypper      |   0
 .../tools/host_packages_scripts/almalinux_docs.sh  |   2 +-
 .../host_packages_scripts/almalinux_docs_pdf.sh    |   1 -
 .../host_packages_scripts/almalinux_essential.sh   |   6 +-
 .../host_packages_scripts/centosstream_docs.sh     |   1 +
 .../centosstream_essential.sh                      |   5 +
 .../tools/host_packages_scripts/rockylinux_docs.sh |   1 +
 .../host_packages_scripts/rockylinux_essential.sh  |   5 +
 .../tools/host_packages_scripts/tlmgr_docs_pdf.sh  |   7 +
 36 files changed, 629 insertions(+), 260 deletions(-)
 delete mode 100644 documentation/dev-manual/security-subjects.rst
 create mode 100644 documentation/migration-guides/release-notes-5.0.14.rst
 create mode 100644 documentation/security-reference/index.rst
 create mode 100644 documentation/security-reference/reporting-vulnerabilit=
ies.rst
 create mode 100644 documentation/security-reference/security-team.rst
 create mode 120000 documentation/tools/containerfiles/Containerfile.almali=
nux
 rename documentation/tools/{ =3D> containerfiles}/Containerfile.apt (100%)
 rename documentation/tools/{ =3D> containerfiles}/Containerfile.debian (10=
0%)
 rename documentation/tools/{ =3D> containerfiles}/Containerfile.dnf (91%)
 rename documentation/tools/{ =3D> containerfiles}/Containerfile.fedora (10=
0%)
 create mode 120000 documentation/tools/containerfiles/Containerfile.rocky
 rename documentation/tools/{Containerfile.almalinux =3D> containerfiles/Co=
ntainerfile.stream} (100%)
 rename documentation/tools/{ =3D> containerfiles}/Containerfile.ubuntu (10=
0%)
 rename documentation/tools/{ =3D> containerfiles}/Containerfile.zypper (10=
0%)
 delete mode 100644 documentation/tools/host_packages_scripts/almalinux_doc=
s_pdf.sh
 create mode 100644 documentation/tools/host_packages_scripts/centosstream_=
docs.sh
 create mode 100644 documentation/tools/host_packages_scripts/centosstream_=
essential.sh
 create mode 100644 documentation/tools/host_packages_scripts/rockylinux_do=
cs.sh
 create mode 100644 documentation/tools/host_packages_scripts/rockylinux_es=
sential.sh
 create mode 100644 documentation/tools/host_packages_scripts/tlmgr_docs_pd=
f.sh

