Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2574.1793957905434146415
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Nov 2026 01:38:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ln4tW5tj;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 480104E413F6;
	Fri,  6 Nov 2026 09:38:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 11D7A60025;
	Fri,  6 Nov 2026 09:38:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A5EB6103292CA;
	Fri,  6 Nov 2026 10:38:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793957901; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=wf1vGNXdrZmAIknBVW5mhLj+jLfgex6ClV1lSaeYfxY=;
	b=ln4tW5tjaRR+UwxO7VxxH+Qf5LzMuip4Uq4rgCJTdj6VgH6V1ffw85iZaTouCk28acwpX2
	e03qkqK6HmDHakZbARKn5wUeWAN9vMaDkLqQaE0DABz9se2yENuTiyxwmom85sjvl+HeGF
	c298NY53WC7WrZ1EjKheSf2JrdcsBgtRQP93OIHtTcHdHhdN93p0t+ZYa3TrMkOES8yNcx
	epwzBgBOggZSD/a7Avgslqmyk1oHDi247soSzrvh8NjG7ivu/8FGNJCNk4Ey/2BQDF1O3J
	U8JndfXTaGjf5w40EiA0nmI1p+X9k85N0Imop4Z2rAZuKlqMGj5X8SZFBHqgcA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Nov 2026 10:38:19 +0100
Message-Id: <DMO101LT9IJI.3KQ38SPPEJ2PJ@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
Subject: [blacksail] Pull request
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Fri, 06 Nov 2026 09:38:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10773

The following changes since commit 64607e243b13b3d81e91af9a9bed72fb9ee0fd0e=
:

  ref-manual/release-process.rst: add textual legend (2026-10-23 09:45:16 +=
0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs blacksail-next

for you to fetch changes up to 28a708ecb3c2ce1669094f9f4c1bdcbc28438bcc:

  governance: Add start of project history and leadership sections (2026-11=
-06 10:10:29 +0100)

----------------------------------------------------------------
Antonin Godard (6):
      AGENTS.md: add file
      AGENTS.md: tell the agent about conventions and standards
      theme_overrides.css: rework admonition colors
      standards.md: update our admonitions encouraged usage
      standards.md: recommend Nimbus Sans instead of Nimbus Roman
      docs-wide: convert diagrams that use Nimbus Roman to use Nimbus Sans

Lee Chee Yang (1):
      migration-guide: add release notes for 5.0.21

Paul Barker (1):
      contributor-guide: Adopt new AI-Assisted Contribution Policy

Richard Purdie (3):
      ref-manual/faq: Add entry about emails on patch merging
      ref-manual/faq: Add entry about github pull requests
      governance: Add start of project history and leadership sections

 AGENTS.md                                          |  70 ++
 .../ai-assisted-contribution-policy.rst            | 199 ++++++
 documentation/contributor-guide/index.rst          |   1 +
 documentation/contributor-guide/submit-changes.rst |  50 --
 documentation/governance/history.rst               | 343 ++++++++++
 documentation/governance/index.rst                 |  14 +
 documentation/governance/leadership.rst            |  79 +++
 documentation/index.rst                            |  10 +
 documentation/migration-guides/release-5.0.rst     |   1 +
 .../migration-guides/release-notes-5.0.21.rst      | 709 +++++++++++++++++=
++++
 documentation/overview-manual/svg/git-workflow.svg |  30 +-
 documentation/ref-manual/faq.rst                   |  55 ++
 documentation/sphinx-static/theme_overrides.css    |  45 +-
 documentation/standards.md                         |  14 +-
 documentation/template/template.svg                |  40 +-
 15 files changed, 1557 insertions(+), 103 deletions(-)
 create mode 100644 AGENTS.md
 create mode 100644 documentation/contributor-guide/ai-assisted-contributio=
n-policy.rst
 create mode 100644 documentation/governance/history.rst
 create mode 100644 documentation/governance/index.rst
 create mode 100644 documentation/governance/leadership.rst
 create mode 100644 documentation/migration-guides/release-notes-5.0.21.rst
