Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF6ECC44506
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 14:47:13 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.629.1783694831599085760
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Jul 2026 07:47:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=njN5CoIl;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 624671A0F40
	for <docs@lists.yoctoproject.org>; Fri, 10 Jul 2026 14:47:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3726A60342
	for <docs@lists.yoctoproject.org>; Fri, 10 Jul 2026 14:47:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CE5BB11BD1324;
	Fri, 10 Jul 2026 16:47:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783694828; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Kvl42h0nodogBfggT/i+X/Pf2VKI2yWh04EO6BcYqXk=;
	b=njN5CoIlyiL7p5azwOq7eGfQEW0QgnfQ0ZDMK//9LBrEbBM7hRlsg4Nx98Co2bqxByE4hu
	bWBIM/qGPvZW/CeLvChOp9hisLSOkLNJvx5RmQytqI3hROc07jw2nCz0Vxz43/2qSsQMON
	2rYzJEPjiUauLgJcX4gO0MvkyX4lKkdGAFc+JN/yDNEkqEAJoTBtWw5kIKSs8B2g57qdzF
	x7t55wdJgCQzpQWYyCWfSt3+809wyqmZp0rhPFi0VyfyPTicsehgYvxqZxVegV3xifzJiA
	V8YqCez4X47XaqjP+vfbEh+Jxz7Ey2grrJKLDSdCquJWuUS/DkjdMDxgiAEbXQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/8] Fix broken links
Date: Fri, 10 Jul 2026 16:46:47 +0200
Message-Id: <20260710-linkcheck-v1-0-999168371d5e@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QpAMBSA4VfRubbaRpRXkYs5Dg4abUgt7264/
 OrvD+DJMXmokgCOTva82giVJoCjsQMJ7qJBS13IUkmxsJ1xJJxFqXJltMGswB5ivznq+fpedfP
 bH+1EuL8DuO8HSnBxO20AAAA=
X-Change-ID: 20260710-linkcheck-7141a2ac36cf
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1908;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=u3/XZeVwmf7Ua06fXtLqkwQQLMIDR2k7jZfAsu0fHgo=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqUQXpUO80MX/eVJDk5zSOQ80pL80YgFbNt+VrU
 XWPPq5skdOJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCalEF6QAKCRDRgEFAKaOo
 NoNDEACc1XIqW7YZqHYsOeHW2Fx9yRmkphBAZEESgURPQrb12TCtaZ86NjVi9cvVdIzJ7kEQhUn
 d/jePH1DOFYGEuYke4qkYUYDg/RIu7im2ZmYMkYX2eWFHyQzPwk+dEbuiVwhOsC2E5hneKwnaH/
 8mXMZ2EQjw2mUWiS9NE9g2A2L7jp9MnV9msrfIF/Q3HMXj7iUh1oNk3PG+8Wf3QJAYbWLMsoZuE
 PM+ZY3Jy8yE4p7e7XE/KQD1ItEyNcej7fE0g1AFgdroGH8QsDVmfY53y6lPow5nY4JQxwzl8qAv
 nNZa8v1Sx4ok7o8uNt1HqXg9+sMnqtdqXbqqpUGi4fFvqg4RZWMyGg8xxgygSC/r/pmq/87PGTf
 C1RKLonaJQRpVgSbOLMC8Pl8dhRhLIl+RD4jDHNPxIzxM7tjsTXd7oeuxNj4XbTRoWiE3P3gPk0
 uZ3ZjDDjWpXZqHqUzKQiychFVIRTEuT0FjIzVSZkGMyR2lWVq6rhzxe5fyqyizemdVi2Pz/MyI9
 X1P0Wlz639J7eMgmlsgvHCGc4sBcOUBjx2p0sJA0T87Wvn7eV+xjVC2OwaCvhQRb4E0Yfzc3Tuf
 qRI2sMv369W4I6HiXwP/NgeSnhlp4FD1nNgpjNrwNNGVKVGvpKzLu6UnxHwrV57hv70M/YT4dur
 Yootcj830BBctaw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Jul 2026 14:47:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10056

Use the linkcheck builder to fix broken links. The first two patches add
some exclusion patterns, and the remaining ones fix the links. Specific
replacements are split in separate patches.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (8):
      conf.py: add linkcheck builder exclusions
      conf.py: add extra links known to be broken
      migration-guides/release-notes-3.4.2.rst: fix a broken link
      docs-wide: fix broken path links
      ref-manual/classes.rst: replace obsolete mailing list thread
      ref-manual/images.rst: update obsolete VMWare links
      migration-guides/release-notes-5.0.rst: remove broken link
      docs-wide: fix various broken links

 documentation/conf.py                              | 23 +++++++++++++
 documentation/dev-manual/new-recipe.rst            |  2 +-
 documentation/dev-manual/start.rst                 |  2 +-
 documentation/dev-manual/x32-psabi.rst             |  4 +--
 documentation/migration-guides/migration-6.0.rst   |  4 +--
 .../migration-guides/release-notes-3.4.2.rst       |  4 +--
 .../migration-guides/release-notes-5.0.rst         |  2 +-
 .../migration-guides/release-notes-5.3.rst         |  2 +-
 .../migration-guides/release-notes-6.0.rst         |  6 ++--
 .../overview-manual/development-environment.rst    |  4 +--
 documentation/profile-manual/usage.rst             | 38 ++++++++++------------
 documentation/ref-manual/classes.rst               | 11 +++----
 documentation/ref-manual/faq.rst                   |  2 +-
 documentation/ref-manual/images.rst                |  5 +--
 documentation/ref-manual/variables.rst             | 14 ++++----
 .../yocto-project-supported-features.rst           |  2 +-
 16 files changed, 69 insertions(+), 56 deletions(-)
---
base-commit: 0cd9c643c0185c60eb9aae90fe48c3597b1781d6
change-id: 20260710-linkcheck-7141a2ac36cf


