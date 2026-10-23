Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2258.1792742258439509007
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Oct 2026 00:57:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=NJEwJpT/;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 513B51A12EB
	for <docs@lists.yoctoproject.org>; Fri, 23 Oct 2026 07:57:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1E84660769;
	Fri, 23 Oct 2026 07:57:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 19BAB10328EC8;
	Fri, 23 Oct 2026 09:57:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792742254; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=5R/L/577/0gTMax7VYaBDH/LxhU3so5pIAwnXC7jAFg=;
	b=NJEwJpT/wutM/0arVBkEGEro2XcbVKhy5KtmTzw7KkjyqWSycsHKE+bbK+pZZh9GPCqbfb
	2a0xpqvesDjIJXSr+XoPQnZbQLhhoxHfvqL21LeLPbqtsKZD8y9zGIj2p4PPRF6DDZ+uhH
	ZgRR3LUtoNSYSjoz9gsbciumsaEeio6YY8OYX9VJT0Ml2yjF+2zoX42F5ztscjHUWVitxh
	KsBnaurZQ/9j3fnPly2q40aVs88zo1bj//gFYMV1kWQQt4vSpBTettI90j920CxnbUn2k2
	PD5Joc4lqCVivL8irj1Jnj8lk3tZW5wL8dD6m9NtdcN4XK0QKGE+RJKyhot2mw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Oct 2026 09:57:33 +0200
Message-Id: <DMC239OE10SD.2ZYTPJJFYSC7R@bootlin.com>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Fri, 23 Oct 2026 07:57:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10719

The following changes since commit 04a6651f50f4c1ca9b6c566bba6465d6617a62a9=
:

  ref-manual: put the ARCHIVER_MODE comments on their own lines (2026-10-15=
 09:20:21 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to 7b54854d12f3f2c909727702d39066a3d22a4a40:

  ref-manual/release-process.rst: add textual legend (2026-10-23 09:42:49 +=
0200)

----------------------------------------------------------------
Adrian Freihofer (3):
      dev-manual/devtool: update devtool ide-sdk section for recent feature=
s
      dev-manual/devtool: add diagrams for the ide-sdk workflow and archite=
cture
      dev-manual/devtool: convert add/modify/upgrade flow diagrams to Merma=
id

Andrej Kozemcak (1):
      ref-manual/variables.rst: document the QB_FSINFO variable

Antonin Godard (6):
      docs-wide: recommend a minimum of 16 CPU cores
      AGENTS.md: add file
      migration-guides: add Garburn release note templates
      tools/gen-releases-svg: add script
      ref-manual/svg/releases.svg: update diagram
      ref-manual/release-process.rst: add textual legend

Lee Chee Yang (2):
      release-notes-6.1: update Downloads section
      migration-guide: add release notes for 6.0.4

Robert P. J. Day (3):
      ref-manual: add a terms entry for Wic
      dev-manual: update recommendations for build system
      dev-manual: update pre-release recipes section, drop ref to "irssi"

 AGENTS.md                                          |   65 +
 documentation/brief-yoctoprojectqs/index.rst       |    6 +-
 documentation/dev-manual/devtool.rst               | 1104 ++++++++----
 .../dev-manual/figures/devtool-add-flow.mmd        |  107 ++
 .../dev-manual/figures/devtool-add-flow.png        |  Bin 181699 -> 0 byte=
s
 .../dev-manual/figures/devtool-add-flow.svg        |    1 +
 .../figures/devtool-ide-sdk-architecture.mmd       |   84 +
 .../figures/devtool-ide-sdk-architecture.svg       |    1 +
 .../figures/devtool-ide-sdk-nfs-architecture.mmd   |   89 +
 .../figures/devtool-ide-sdk-nfs-architecture.svg   |    1 +
 .../figures/devtool-ide-sdk-workflow.mmd           |   76 +
 .../figures/devtool-ide-sdk-workflow.svg           |    1 +
 .../dev-manual/figures/devtool-modify-flow.mmd     |  110 ++
 .../dev-manual/figures/devtool-modify-flow.png     |  Bin 171676 -> 0 byte=
s
 .../dev-manual/figures/devtool-modify-flow.svg     |    1 +
 .../dev-manual/figures/devtool-upgrade-flow.mmd    |   81 +
 .../dev-manual/figures/devtool-upgrade-flow.png    |  Bin 138917 -> 0 byte=
s
 .../dev-manual/figures/devtool-upgrade-flow.svg    |    1 +
 documentation/dev-manual/new-recipe.rst            |   46 +-
 documentation/dev-manual/start.rst                 |    7 +-
 documentation/migration-guides/index.rst           |    1 +
 documentation/migration-guides/migration-6.2.rst   |   46 +
 documentation/migration-guides/release-6.0.rst     |    1 +
 documentation/migration-guides/release-6.2.rst     |   10 +
 .../migration-guides/release-notes-6.0.4.rst       |  445 +++++
 .../migration-guides/release-notes-6.1.rst         |   58 +
 .../migration-guides/release-notes-6.2.rst         |  159 ++
 documentation/poky.yaml.in                         |    2 +
 documentation/ref-manual/devtool-reference.rst     |    4 +
 documentation/ref-manual/release-process.rst       |    3 +
 documentation/ref-manual/svg/releases.svg          | 1899 +---------------=
----
 documentation/ref-manual/system-requirements.rst   |    8 +-
 documentation/ref-manual/terms.rst                 |    6 +
 documentation/ref-manual/variables.rst             |   24 +
 documentation/sphinx-static/theme_overrides.css    |    5 +
 documentation/tools/gen-releases-svg               |   95 +
 36 files changed, 2270 insertions(+), 2277 deletions(-)
 create mode 100644 AGENTS.md
 create mode 100644 documentation/dev-manual/figures/devtool-add-flow.mmd
 delete mode 100644 documentation/dev-manual/figures/devtool-add-flow.png
 create mode 100644 documentation/dev-manual/figures/devtool-add-flow.svg
 create mode 100644 documentation/dev-manual/figures/devtool-ide-sdk-archit=
ecture.mmd
 create mode 100644 documentation/dev-manual/figures/devtool-ide-sdk-archit=
ecture.svg
 create mode 100644 documentation/dev-manual/figures/devtool-ide-sdk-nfs-ar=
chitecture.mmd
 create mode 100644 documentation/dev-manual/figures/devtool-ide-sdk-nfs-ar=
chitecture.svg
 create mode 100644 documentation/dev-manual/figures/devtool-ide-sdk-workfl=
ow.mmd
 create mode 100644 documentation/dev-manual/figures/devtool-ide-sdk-workfl=
ow.svg
 create mode 100644 documentation/dev-manual/figures/devtool-modify-flow.mm=
d
 delete mode 100644 documentation/dev-manual/figures/devtool-modify-flow.pn=
g
 create mode 100644 documentation/dev-manual/figures/devtool-modify-flow.sv=
g
 create mode 100644 documentation/dev-manual/figures/devtool-upgrade-flow.m=
md
 delete mode 100644 documentation/dev-manual/figures/devtool-upgrade-flow.p=
ng
 create mode 100644 documentation/dev-manual/figures/devtool-upgrade-flow.s=
vg
 create mode 100644 documentation/migration-guides/migration-6.2.rst
 create mode 100644 documentation/migration-guides/release-6.2.rst
 create mode 100644 documentation/migration-guides/release-notes-6.0.4.rst
 create mode 100644 documentation/migration-guides/release-notes-6.2.rst
 create mode 100755 documentation/tools/gen-releases-svg
