Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2572.1793957903967460763
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Nov 2026 01:38:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=qFT8oa6V;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 19D25C69166
	for <docs@lists.yoctoproject.org>; Fri,  6 Nov 2026 09:38:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7DF285FFBC;
	Fri,  6 Nov 2026 09:38:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 05DCA10329280;
	Fri,  6 Nov 2026 10:38:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793957900; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=iTtpaFINgzq7qAex0UuI835ZWBaL3Yq9gPXBFtku4+0=;
	b=qFT8oa6VlirGz98MvjRPj/sn4J0k662C3mciUHgHFUO4LSkRfF58+T8Rr8zTj4rEav9WYq
	NbC22FTFPu79Dz7erow77AHcjgOR2J5BTuTI+LNdrWJsmhVsfR6bN1ZoCla9Gpq0BzPSr5
	L5wRPwyFzdD1wiCWIFLCnNyLtpRqAS5WtIL3X3ts8PDmnh70WyAWlSIBBFBkf0PxXIbwJR
	R6q3Vg2QPzeAtmh5YdU6gnVw/BMhr42kjdbFkjd6VMkEZdMH9CzArMeUfLjcP5liTrRu23
	E8VDu2Sc+F1AvD/ux6gesDNXvGM/1oEOX5REOX2XEJpTN6MvpC0RFec/bm3mZg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Nov 2026 10:38:18 +0100
Message-Id: <DMO101A7T5MJ.1DQQQ06O51JUV@bootlin.com>
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
Subject: [wrynose] Pull request
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Fri, 06 Nov 2026 09:38:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10772

The following changes since commit 197ed05f4f157432e7fcab63ced8df1249217366=
:

  ref-manual/release-process.rst: add textual legend (2026-10-23 09:45:16 +=
0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs wrynose-next

for you to fetch changes up to a361ccfc75eb853805e5acd4ab32b439f6d0af06:

  contributor-guide: Adopt new AI-Assisted Contribution Policy (2026-11-06 =
09:49:56 +0100)

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

 AGENTS.md                                          |  70 ++
 .../ai-assisted-contribution-policy.rst            | 199 ++++++
 documentation/contributor-guide/index.rst          |   1 +
 documentation/contributor-guide/submit-changes.rst |  50 --
 documentation/migration-guides/release-5.0.rst     |   1 +
 .../migration-guides/release-notes-5.0.21.rst      | 709 +++++++++++++++++=
++++
 documentation/overview-manual/svg/git-workflow.svg |  30 +-
 documentation/sphinx-static/theme_overrides.css    |  45 +-
 documentation/standards.md                         |  14 +-
 documentation/template/template.svg                |  40 +-
 10 files changed, 1056 insertions(+), 103 deletions(-)
 create mode 100644 AGENTS.md
 create mode 100644 documentation/contributor-guide/ai-assisted-contributio=
n-policy.rst
 create mode 100644 documentation/migration-guides/release-notes-5.0.21.rst
