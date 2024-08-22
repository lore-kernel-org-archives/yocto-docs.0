Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19230C3DA4A
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 09:37:12 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.9554.1724319423611504694
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Aug 2024 02:37:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PpT6KypF;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 99520FF804;
	Thu, 22 Aug 2024 09:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724319421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=qHFU1vak7Wc34boS9wnxI3gLP4RTi1rj2nak/nZCacQ=;
	b=PpT6KypFbEHa/18+0IWP/1E6Juv3WlYaFTG8XCaD60cOe+TvPcZWxClLVRK56ccNQXPrHB
	Xv4zB5wl9KvpbhcS+dMd5kYRdnuMltfY7l5snK9HzPGVi1jFZP53ljjPaOGnzo35kDO3wq
	0yffUqZ9hKeyFkjwFZ2z9z5Du0B466LqyemjYgISI45kSorscZgdLF8reHX0Xi6tmMh8GR
	9wtv2YDFagzWG6hmMZz87bYNxj1muhDfh06xYoSPMpD2ztCuVjhGGNTvnEua7z8hz6XJgI
	7/Q1dT+hdD+8Uk44472xeJUxwsIY4ychQK/3FI4qVGSOrqOn7mlOjjq+z/2FQw==
Date: Thu, 22 Aug 2024 11:37:01 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: docs@lists.yoctoproject.org
Subject: [master] Pull request
Message-ID: <20240822093701d1bb33e9@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 22 Aug 2024 09:37:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5340

The following changes since commit 48f8eaf956e6897d714a9f628295bf0a320b3547:

  docs: modify reference from python2.py to python.py (2024-06-27 18:37:36 +0200)

are available in the Git repository at:

  git://git.yoctoproject.org/yocto-docs contrib/abelloni/master-next

for you to fetch changes up to cf811228d7d25ad7136e24e7c6b9dcd39ca43610:

  migration-guides: add release notes for 5.0.3 (2024-08-22 11:31:14 +0200)

----------------------------------------------------------------
Jan Vermaete (1):
      ref-manual: added wic.zst to the IMAGE_TYPES

Lee Chee Yang (2):
      migration-guide: add release notes for 4.0.20
      migration-guides: add release notes for 5.0.3

Matthias Pritschet (1):
      ref-manual: fix typo and move SYSROOT_DIRS example

Peter Kjellerstedt (1):
      test-manual: Add a missing dot

 documentation/migration-guides/release-4.0.rst     |   2 +
 documentation/migration-guides/release-5.0.rst     |   1 +
 .../migration-guides/release-notes-4.0.20.rst      | 130 +++++++++
 .../migration-guides/release-notes-5.0.3.rst       | 314 +++++++++++++++++++++
 documentation/ref-manual/variables.rst             |  49 ++--
 documentation/test-manual/intro.rst                |   2 +-
 6 files changed, 473 insertions(+), 25 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.20.rst
 create mode 100644 documentation/migration-guides/release-notes-5.0.3.rst

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

