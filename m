Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2575.1793957905525416206
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Nov 2026 01:38:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ybWYhdS7;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2B8154E413F5
	for <docs@lists.yoctoproject.org>; Fri,  6 Nov 2026 09:38:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 016B35FFBC;
	Fri,  6 Nov 2026 09:38:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 44F4D103292D3;
	Fri,  6 Nov 2026 10:38:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793957901; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=lrVAZSm47mPqou8KeFERY6jPf7kvzRtcifKSEd+XuzE=;
	b=ybWYhdS7wwhcaJnpYSbUM2M7Y5HCCTEL/1VPyzXbmEHqe4sQ2nnFKMvXK6VjzsvPzteuvq
	CaIATouyavN5ce+M3ADMGlVi//FBsAEq/TQ3MTGAQx8riXYqbTVMIrNQL1YHXTJXRHaULV
	/xd2eTGGagFp8qqoY1iqFjcerCzJ3GlwRbvSWtfWov3CQ+yZSKcm7osJetNbXHNWW2Bd59
	vNwNVCTJnGaLRkWdB01EW4Ljiu51qSE+3S9WBgzJEDGy8lTiYls0LstIAHs9gtJrSm717Q
	DWXn5dXLIZ6NKJqbTaFdpMffc2YQE2m4oD1BhCfohJ0ucfMnPia8CL8iFlt2UA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Nov 2026 10:38:19 +0100
Message-Id: <DMO101VACBBI.3N9E71H8A5QWG@bootlin.com>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Fri, 06 Nov 2026 09:38:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10774

The following changes since commit 7b54854d12f3f2c909727702d39066a3d22a4a40=
:

  ref-manual/release-process.rst: add textual legend (2026-10-23 09:42:49 +=
0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to 2c5846cc2c2649b29de7e7a6ac07fef5c2e7f302:

  contributor-guide: Adopt new AI-Assisted Contribution Policy (2026-11-04 =
15:16:40 +0100)

----------------------------------------------------------------
Antonin Godard (6):
      AGENTS.md: tell the agent about conventions and standards
      theme_overrides.css: rework admonition colors
      standards.md: update our admonitions encouraged usage
      tools/obsolete-variables: add script
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

 AGENTS.md                                          |   5 +
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
 documentation/tools/obsolete-variables             | 135 ++++
 16 files changed, 1627 insertions(+), 103 deletions(-)
 create mode 100644 documentation/contributor-guide/ai-assisted-contributio=
n-policy.rst
 create mode 100644 documentation/governance/history.rst
 create mode 100644 documentation/governance/index.rst
 create mode 100644 documentation/governance/leadership.rst
 create mode 100644 documentation/migration-guides/release-notes-5.0.21.rst
 create mode 100755 documentation/tools/obsolete-variables
