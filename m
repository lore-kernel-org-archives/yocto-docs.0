Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C53ACD4F5B
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 13:52:00 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21640.1779198714041915478
 for <docs@lists.yoctoproject.org>;
 Tue, 19 May 2026 06:51:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=rqv1ih3W;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 36C341A3611;
	Tue, 19 May 2026 13:51:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0B50A5FFC8;
	Tue, 19 May 2026 13:51:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A6020107E92A9;
	Tue, 19 May 2026 15:51:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779198711; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=QxC3FfozoFCK2JoA1g7yNfNbIxX1eBG8j5pZ2L+crUw=;
	b=rqv1ih3Wz/s24Q/0L5gmpeVbNwV1Yz+PL5xZaEpqMhs1J/jrSwN4bKraPGDxDtr9c+fSB4
	RO4v2txDxUJOhWYNae9J/rJhb9R34fBJH/QKZlMDhzuFlWwfKZESwSLr0zBjinxj4/xrvb
	A7RpFhDqN8fJ/bUmab0DUL1D7eyYFAjXlLDozh9F31lan0UlgC+S4C7XvDcx0WbFK1y6GF
	PbfZilKoKbRedS9+wIyBoYDapxaylju+pIdxWRgitIPkLhGIgkBDDVbG9PLMoLKAwJXeVA
	K70we+3EVtkEaj/csfLik67tmpnrDzwTbb/6Vnc30CkKlQMW6tUC7JCYhY3BKA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 19 May 2026 15:51:48 +0200
Message-Id: <DIMPAZ2PHS30.2ZPYURSIM1NIJ@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 May 2026 13:52:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9487

Hi Paul, Yoann,

(Copying Yoann here as well for the general status on the sent pull request=
s)

Here is a pull request for master that you'll receive alongside stable bran=
ch
pull requests.

master and wrynose are equal in content.

scarthgap contains the release note updates, and a select list of docs fixe=
s
picked from master.

whinlatter and kirkstone only contain the last release notes additions sent=
 by
Lee Chee Yang, probably the last pull request for those branches.

Cheers,
Antonin

The following changes since commit 6b78593bed7174245fd7f6861263c69a3c439a74=
:

  ref-manual/variables: IMAGE_TYPES: add new wicenv type (2026-04-27 10:27:=
34 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to d7376cca64a0784e59d4fd60b9baefb4da2ce289:

  contributor-guide: fix type "maintainance" to "maintenance" (2026-05-19 1=
5:33:23 +0200)

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

Robert P. J. Day (12):
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
      overview-manual: add a few more basic Git commands
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
 .../overview-manual/development-environment.rst    |  20 +-
 documentation/overview-manual/yp-intro.rst         |   8 +-
 documentation/ref-manual/classes.rst               |   8 +-
 documentation/ref-manual/fragments.rst             |   6 +-
 .../ubuntu-debian-host-packages-nodocs.rst         |   2 +-
 documentation/ref-manual/variables.rst             |  21 +-
 .../transitioning-to-a-custom-environment.rst      |  16 +-
 documentation/what-i-wish-id-known.rst             |  18 +-
 17 files changed, 650 insertions(+), 143 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.35.rst
 create mode 100644 documentation/migration-guides/release-notes-5.3.4.rst

