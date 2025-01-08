Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81501E77188
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 16:00:42 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.22837.1736352041539451712
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Jan 2025 08:00:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=giRV9CwC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 72F6B60011;
	Wed,  8 Jan 2025 16:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736352039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=opKAfNnye6yJEHQOfbKCdNMJPiOJ+uJH2yHQfR36VZ4=;
	b=giRV9CwCQHhg1Yzvn2Y3N2xQBHenr6wZ50z9pT+BPtwMJjRO8JeTyXJ3BJrEl7ohD5bQwG
	deeUFYmKzTrPxVunHoiziyXIO0c1ExfdGcU899TAOsKL9e5qd9aTB0OSG80FD+dBkpXWGN
	X7/LB3s8pRR8gSEDinMJ0rC/esu+5/n2APWX4JsQrra1OG/hkP9RpqicX7sRxJseUVx1rO
	gaOVwVgXIepjuRladK4JaK1IVqv3vnzBnitsNoS/SeQkF7TtjV8Ppob7pzRsDaMKJwa75j
	ofCl63Q44N4kK9IrsENWJFVhf9QJf0FrVgOJ3jqRcr6W+tnZzv+YHB+ZCcrU/w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jan 2025 17:00:39 +0100
Message-Id: <D6WTFESL069M.34PJ3SED8DRYL@bootlin.com>
Subject: [kirkstone] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Jan 2025 16:00:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6071

The following changes since commit 6fda76e3a879e72979b3678ce583604783f178bb=
:

  reproducible-builds.rst: show how to build a single package (2024-12-27 1=
4:27:35 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs kirkstone-next

for you to fetch changes up to 3128bf149f40928e6c2a3e264590a0c6c9778c6a:

  ref-manual: move runtime-testing section to the test-manual (2025-01-08 1=
1:51:29 +0100)

----------------------------------------------------------------
Antonin Godard (5):
      contributor-guide/submit-changes.rst: suggest to remove the git signa=
ture
      ref-manual/devtool-reference: add warning note on deploy-target and s=
hared objects
      SSTATE_MIRRORS/SOURCE_MIRROR_URL: add instructions for mirror authent=
ication
      ref-manual/packages: move ptest section to the test-manual
      ref-manual: move runtime-testing section to the test-manual

 documentation/contributor-guide/submit-changes.rst |   7 ++
 documentation/dev-manual/index.rst                 |   1 -
 documentation/dev-manual/packages.rst              | 112 +----------------=
---
 documentation/migration-guides/migration-1.5.rst   |   4 +-
 documentation/migration-guides/migration-1.6.rst   |   2 +-
 documentation/ref-manual/classes.rst               |   8 +-
 documentation/ref-manual/devtool-reference.rst     |  20 ++++
 documentation/ref-manual/features.rst              |   2 +-
 documentation/ref-manual/images.rst                |   4 +-
 documentation/ref-manual/qa-checks.rst             |   1 -
 documentation/ref-manual/release-process.rst       |   6 +-
 documentation/ref-manual/tasks.rst                 |   8 +-
 documentation/ref-manual/variables.rst             |  75 ++++++++++++--
 documentation/test-manual/index.rst                |   2 +
 documentation/test-manual/intro.rst                |   6 +-
 documentation/test-manual/ptest.rst                | 114 +++++++++++++++++=
++++
 .../runtime-testing.rst                            |   5 +-
 17 files changed, 234 insertions(+), 143 deletions(-)
 create mode 100644 documentation/test-manual/ptest.rst
 rename documentation/{dev-manual =3D> test-manual}/runtime-testing.rst (99=
%)

