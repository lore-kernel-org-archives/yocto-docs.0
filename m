Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70D8AC54F51
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 09:07:07 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7404.1785316016670330790
 for <docs@lists.yoctoproject.org>;
 Wed, 29 Jul 2026 02:06:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=KSVFx4Yp;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 64E7C1A12F6;
	Wed, 29 Jul 2026 09:06:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2DA166039A;
	Wed, 29 Jul 2026 09:06:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6D54111C11FD5;
	Wed, 29 Jul 2026 11:06:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785316013; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Mm8oyCfyIDPt0PqnewHVSi5J68C5Pe5WGkpjvgqICY0=;
	b=KSVFx4YpOKlw1u1lmYeSHOFEfHaoBJimk1MVrCzLF7Fjd+R5mrJD8Uqk4g+ziM6foPCwaj
	BN4hGr/TCF7OT8FiaDV3AirsTuPtVVKmhpisqtMZChHCpBfpszITG5wF9sqjpLHBZFYnx2
	YtVvOvcjjGVNbDo/jZxeWjj7o7DzwXPKVLvT1N/s1cIWKGVP9eEQpfigARElXYro/w1gWF
	emBvxhbYEwyS95vWS2DW5W6g2mvhwTMjY61LJtA34HPrkpFjwJJFo6k8YLo0YbAcwES09n
	Mn3lG31OIAnEzROpQPXrlZ1J1tXIr264MLRerEqO93UJF3mYfZLqS+PWbh0omQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Jul 2026 11:06:51 +0200
Message-Id: <DKAXPH8G4IZQ.22HU16HA2JPW5@bootlin.com>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 29 Jul 2026 09:07:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10183

The following changes since commit 5f708a1bc31ae94dd3513615b0ce079aa7897628=
:

  docs-wide: fix various broken links (2026-07-15 15:01:31 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to 8496602a28b19fec9ee55dc45572b31a32c70443:

  ref-manual: Fix occurrences of omitted space with :prepend (2026-07-29 10=
:56:47 +0200)

----------------------------------------------------------------
Antonin Godard (2):
      migration-guides: replace broken link with archive links
      kernel-dev/common.rst: remove taskhash mismatch note

Daniel Turull (1):
      ref-manual/release-process.rst: update LTS supported versions

Lee Chee Yang (1):
      migration-guide: add release notes for 5.0.19

Niko Mauno (1):
      ref-manual: Fix occurrences of omitted space with :prepend

 documentation/kernel-dev/common.rst                |  15 -
 documentation/migration-guides/release-5.0.rst     |   1 +
 .../migration-guides/release-notes-4.3.rst         |   2 +-
 .../migration-guides/release-notes-5.0.19.rst      | 663 +++++++++++++++++=
++++
 .../migration-guides/release-notes-5.0.rst         |   2 +-
 documentation/ref-manual/faq.rst                   |   6 +-
 documentation/ref-manual/release-process.rst       |   2 +-
 documentation/ref-manual/variables.rst             |   3 +-
 8 files changed, 673 insertions(+), 21 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-5.0.19.rst

