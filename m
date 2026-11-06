Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2573.1793957904496303392
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Nov 2026 01:38:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Vc69eZ+c;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 27E3CC69168;
	Fri,  6 Nov 2026 09:38:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A36885FFBC;
	Fri,  6 Nov 2026 09:38:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 04C6D1032927D;
	Fri,  6 Nov 2026 10:38:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793957901; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=YcapbuDY7mgL3CNQiXIBjye64U/Kb8RdVOPKU0O4K/c=;
	b=Vc69eZ+cHqKOM7yZZ344jcg0sYFJ/pxTsSJ0WC/C9ZysBwQtBWM5cpP43q3lYwm49hhhTZ
	XnGZgYU1BvC1SlGzCv2NbZhDN2Uxi8P9RHqfEIXzEi0HNZj3ckOH8ny54eT438TC2B6lIX
	A/QOKZezmXXBDaLpSuu71hauoe2I6WNyiYQOLnTQ1NXgHcfxK442tmgIsgLCputAqFNSRZ
	88bPlnIbi3sNxiB4O+n9QeRx9k7hDrX2qo7CFTM/VYVzgpSN0jvhNX0q4J5FEitvmI5t2U
	qbxzuWtaoDms9qa/T883X8HBM+KnjIPsFGDR5hMfUyhS14TBTL/KREuV47bqvQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Nov 2026 10:38:17 +0100
Message-Id: <DMO1011TY9Z4.1QTPFAN6R2SA0@bootlin.com>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Fri, 06 Nov 2026 09:38:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10771

The following changes since commit 37331af0a948b0f04eb11a194adbc214f9dd8674=
:

  ref-manual/release-process.rst: add textual legend (2026-10-23 09:45:16 +=
0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to 7a4ccf27524f102f0ba64f1bb1c39c73997b1548:

  contributor-guide: Adopt new AI-Assisted Contribution Policy (2026-11-06 =
09:50:52 +0100)

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
