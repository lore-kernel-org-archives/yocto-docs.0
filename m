Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50B3DC44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 13:19:24 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5732.1784121562452219651
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Jul 2026 06:19:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=nDR24iTx;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 522331A0F27;
	Wed, 15 Jul 2026 13:19:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 274B86035D;
	Wed, 15 Jul 2026 13:19:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9B59611BD04C2;
	Wed, 15 Jul 2026 15:19:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784121559; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=h97WgIsO+n4L6EehRlyFMV9sb+S7xWXmxt1Ykr4newE=;
	b=nDR24iTxW7Oxi5gDfOq9Qv+OgxnEfXlzsFFE7e9lT2ku07nBINXEhbYhXDOMN5w0PtC+YF
	TrdACgxxctvnIOvTNuEZ0IKVIfUkTBHXjVwHsSA1g9O/psbxOO9LIaYIGbmQsOPTMtOnkm
	8rP0xSRVN7SSsOltNypMx8iBTGLO4bDuQMUAdblrOYl4GaRtGZf/0KryCNGYT9j54A6Obi
	weH7+OSb3UOmk7a2ctCFGD/GlMvSEhGwcDa1w6RWapxmmQfd6K1AyElesdQGnF+PBGncIc
	VdrYrhwyjojKJvQC0KadoEOEzl1dJNROA8GmsiN1l9q68X04gUNXSISU/3g3wA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Jul 2026 15:19:17 +0200
Message-Id: <DJZ6B4POA8IQ.TOP9DCSDI1PQ@bootlin.com>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 15 Jul 2026 13:19:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10075

The following changes since commit 51c53ef1e8b4ec4afbb84252e59dd5501f405064=
:

  ref-manual/variables.rst: document the IMAGE_*_DEBUGFS variables (2026-07=
-03 11:17:14 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to 5f708a1bc31ae94dd3513615b0ce079aa7897628:

  docs-wide: fix various broken links (2026-07-15 15:01:31 +0200)

----------------------------------------------------------------
Antonin Godard (7):
      ref-manual/variables.rst: document the LOCALE_UTF8_IS_DEFAULT variabl=
e
      migration-guides/release-notes-3.4.2.rst: fix a broken link
      docs-wide: fix broken path links
      ref-manual/classes.rst: replace obsolete mailing list thread
      ref-manual/images.rst: update obsolete VMWare links
      migration-guides/release-notes-5.0.rst: remove broken link
      docs-wide: fix various broken links

Robert P. J. Day (2):
      ref-manual: expand on kernel "do_sizecheck" task
      ref-manual: add "KERNEL_IMAGE_STRIP_EXTRA_SECTIONS" to variables

 documentation/dev-manual/new-recipe.rst            |  2 +-
 documentation/dev-manual/start.rst                 |  2 +-
 documentation/dev-manual/x32-psabi.rst             |  4 +--
 .../migration-guides/release-notes-3.4.2.rst       |  4 +--
 .../migration-guides/release-notes-5.0.rst         |  2 +-
 .../overview-manual/development-environment.rst    |  4 +--
 documentation/profile-manual/usage.rst             | 38 ++++++++++--------=
----
 documentation/ref-manual/classes.rst               | 11 +++----
 documentation/ref-manual/images.rst                |  5 +--
 documentation/ref-manual/tasks.rst                 | 19 +++++++----
 documentation/ref-manual/variables.rst             | 33 ++++++++++++++----=
-
 11 files changed, 68 insertions(+), 56 deletions(-)

