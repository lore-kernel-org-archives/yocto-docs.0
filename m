Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2274.1792742258559194068
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Oct 2026 00:57:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=mrI3PEC7;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8A8D94E412D3;
	Fri, 23 Oct 2026 07:57:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 53CF26076B;
	Fri, 23 Oct 2026 07:57:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 67D6110328EBA;
	Fri, 23 Oct 2026 09:57:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792742254; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=8EUrKqabufG6WaQuqwfgvqzIIOPGjoBfRWNvNoizNsM=;
	b=mrI3PEC78pfKAhIUy8pO6xzKR6EGXH+0/m2ilY+rveXgGn9jHyhAZHvDFLIFfxzmCprQFT
	fbO6apcYN92/A0jNyTztWVqkHfcRdqtkJzYltwqU+xm6XbHrHHvVoKFVz4hw9wgDEgvnxG
	c4MSWPelBDi9llRFwFJwq3P/e9GskpHtck5cHAMaWudd4/X8UeBe+207kexYDOq3gzlOUT
	MNypi1FEWdz0MHOfAd4GlzsD7lv+a70XNjQVf5sj/VuibwIS/aqKe1bkH3ND4E0idRmlYu
	eHjRtgVCF8jAKITVKFVY4/jRfA5SFSxJdsTgFy25K+hOuFK1jQ3JhDPF5zeSsQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Oct 2026 09:57:33 +0200
Message-Id: <DMC239GU78T2.1VQTO091V89IS@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
Subject: [blacksail] Pull request
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Fri, 23 Oct 2026 07:57:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10722

The following changes since commit c75568b0e658c275ae08e1664353e7aeed41a174=
:

  dev-manual: correct directory name for oe-core wic files (2026-10-15 15:5=
4:20 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs blacksail-next

for you to fetch changes up to 64607e243b13b3d81e91af9a9bed72fb9ee0fd0e:

  ref-manual/release-process.rst: add textual legend (2026-10-23 09:45:16 +=
0200)

----------------------------------------------------------------
Adrian Freihofer (3):
      dev-manual/devtool: update devtool ide-sdk section for recent feature=
s
      dev-manual/devtool: add diagrams for the ide-sdk workflow and archite=
cture
      dev-manual/devtool: convert add/modify/upgrade flow diagrams to Merma=
id

Antonin Godard (3):
      docs-wide: recommend a minimum of 16 CPU cores
      ref-manual/svg/releases.svg: update diagram
      ref-manual/release-process.rst: add textual legend

Lee Chee Yang (2):
      release-notes-6.1: update Downloads section
      migration-guide: add release notes for 6.0.4

Robert P. J. Day (2):
      dev-manual: update recommendations for build system
      dev-manual: update pre-release recipes section, drop ref to "irssi"

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
 documentation/migration-guides/release-6.0.rst     |    1 +
 .../migration-guides/release-notes-6.0.4.rst       |  445 +++++
 .../migration-guides/release-notes-6.1.rst         |   58 +
 documentation/poky.yaml.in                         |    2 +
 documentation/ref-manual/devtool-reference.rst     |    4 +
 documentation/ref-manual/release-process.rst       |    3 +
 documentation/ref-manual/svg/releases.svg          | 1899 +---------------=
----
 documentation/ref-manual/system-requirements.rst   |    8 +-
 documentation/sphinx-static/theme_overrides.css    |    5 +
 28 files changed, 1864 insertions(+), 2277 deletions(-)
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
 create mode 100644 documentation/migration-guides/release-notes-6.0.4.rst
