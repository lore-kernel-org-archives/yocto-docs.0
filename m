Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 059B3CD5BAC
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 13:52:01 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21647.1779198717739899405
 for <docs@lists.yoctoproject.org>;
 Tue, 19 May 2026 06:51:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Cojo6Mg7;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 325064E42CF1;
	Tue, 19 May 2026 13:51:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E2DD66070E;
	Tue, 19 May 2026 13:51:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BD2CB107E92AC;
	Tue, 19 May 2026 15:51:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779198715; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=CzGjyAq34oGm8j6cxz4itsStloHsEd2VT+Soylv9+0M=;
	b=Cojo6Mg7vGtj5/lOnPmDKJrJuGQzozdbeLTRl/b0yW/fD3aw/YTjye/0Zk4cxqq+FNVtOP
	X2sOsvAzQTm7/mW4dwWF+pgrhCijEYXVTcMAVhJzcRk3yYYK33S2OaRa3j7uHEcZIVsxsX
	cdO5C/sXIe1gb/b7D6LFRwI7g2H7BOIgkWjQtx+ulv9ZpM5VxUqm4nzSYNxaRzJtSr+hDu
	iZ9RoVRcjprDCKeTr7TIcT2VGd+sc2b2mLZGKuPNzDZ004jGpbzrQ0JQX6AK0gSRxlxbuD
	Vw9WqHsWRP4TNklCBPGeFO8Lt6fjP5el+CtQBssn4MTgfS4hUkxyZIff/4dbKw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 19 May 2026 15:51:54 +0200
Message-Id: <DIMPB1PL9E8Q.3MAQ24XREQNYZ@bootlin.com>
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
Subject: [wrynose] Pull request
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 May 2026 13:52:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9491

The following changes since commit 6b78593bed7174245fd7f6861263c69a3c439a74=
:

  ref-manual/variables: IMAGE_TYPES: add new wicenv type (2026-04-27 10:27:=
34 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs wrynose-next

for you to fetch changes up to 7ac955621b36a221126cd40f12c41fa98c213a24:

  contributor-guide: fix type "maintainance" to "maintenance" (2026-05-19 1=
5:39:56 +0200)

----------------------------------------------------------------
Lee Chee Yang (4):
      release-note-6.0: update downloads section
      release-note-6.0: update several section
      migration-guide: add release notes for 4.0.35
      migration-guide: add release notes for 5.3.4

Minwoo Choi (1):
      ref-manual/variables: document the 'dynamic layer' concept

Quentin Schulz (11):
      migration-guides: fix https:// prefix missing in anonymous reference
      ref-manual: classes: fix https:// prefix missing in anonymous referen=
ce
      migration-guides: migration-6.0: reword meta-poky templates removal
      migration-guides: migration-6.0: fix grammar and missing word
      migration-guide: migration-6.0: fix typos in cve-check removal
      migration-guides: release-notes-6.0: fix typo in documentation change=
s
      ref-manual: classes: add missing "task" after create_recipe_sbom
      ref-manual: fix "include to" grammar for UKI_DEVICETREE
      ref-manual: fragments: fix style inconsistencies
      ref-manual: variables: add hyphen to "space separated"
      ref-manual: variables: add hyphen to "space separated" and "auto gene=
rated"

Robert P. J. Day (11):
      index.rst: update "Software Overview" to "Technical Overview"
      yp-intro.rst: delete really old references
      yp-intro.rst: add link to "buildbot"
      YP Quick Build: delete extraneous periods in list
      YP Quick Build: use "set up" as a verb
      Quick Build guide: Various pedantic cleanups
      "Transitioning ..." doc: Various pedantic cleanups
      What I Wish I'd KNown: Various pedantic cleanups
      ref-manual: replace "naive" with "simple"
      overview-manual: fix "checkout" versus "check out"
      contributor-guide: fix type "maintainance" to "maintenance"

 documentation/brief-yoctoprojectqs/index.rst       |  28 +--
 .../contributor-guide/recipe-style-guide.rst       |   4 +-
 documentation/index.rst                            |   2 +-
 documentation/migration-guides/migration-6.0.rst   |  13 +-
 documentation/migration-guides/release-4.0.rst     |   1 +
 documentation/migration-guides/release-5.3.rst     |   1 +
 .../migration-guides/release-notes-4.0.35.rst      | 198 +++++++++++++++++=
+
 .../migration-guides/release-notes-5.3.4.rst       | 218 +++++++++++++++++=
+++
 .../migration-guides/release-notes-6.0.rst         | 229 ++++++++++++++---=
----
 .../overview-manual/development-environment.rst    |  10 +-
 documentation/overview-manual/yp-intro.rst         |   8 +-
 documentation/ref-manual/classes.rst               |   8 +-
 documentation/ref-manual/fragments.rst             |   6 +-
 .../ubuntu-debian-host-packages-nodocs.rst         |   2 +-
 documentation/ref-manual/variables.rst             |  21 +-
 .../transitioning-to-a-custom-environment.rst      |  16 +-
 documentation/what-i-wish-id-known.rst             |  18 +-
 17 files changed, 640 insertions(+), 143 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.35.rst
 create mode 100644 documentation/migration-guides/release-notes-5.3.4.rst

