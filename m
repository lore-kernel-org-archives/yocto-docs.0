Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4342D59F4A
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 15:48:27 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.48792.1730908102809052220
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Nov 2024 07:48:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JJHD1Hwe;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C9E89C0008;
	Wed,  6 Nov 2024 15:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730908101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YKxcHpoFVEs9y9Skn7BsLvgOBJ84dlE78216RVar/FE=;
	b=JJHD1HweC6BpijUGpAPlBXtaErufl/F0UGNfvwAVgiGP2mAIPhm5EEuaoYcOsFxZGrmlAY
	8t+vQWCAzhfgqFaCYS0qehub8oiw3O8v8l8GBC/SG/uMY5A7fLd5Hq3rtISU2SEdEJ0h7n
	QiNfXu2ZmUWszOJFwU9K9CA9utWHS/C8PKseHBORdU2SEn8TS8YAzWJ8vOsUPIwftwMxCn
	jY5QQecH9EcOHyKujnbURTL97XHgvcT9+IOo+kIEnDqdpsgeMx5YQQS/5vJY/9l+Txv57I
	wZFcIgnK4aO635tCmRvQvl/M/nxn5HwQG6rs/uJcmOpQGGq5XK+llFJLQbEpuA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 06 Nov 2024 16:48:20 +0100
Message-Id: <D5F7PNWXHQGQ.1LP3EUZW7EEP0@bootlin.com>
Subject: [kirkstone] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-Mailer: aerc 0.18.2.r87.gd0484b15
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Nov 2024 15:48:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5708

The following changes since commit fe98cb44fd52e2e455255be33aacf60f12dd5bad=
:

  release-notes-4.0,brief-yoctoprojectqs: update BB_HASHSERVE_UPSTREAM for =
new infrastructure (2024-11-04 08:49:32 +0000)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs kirkstone-next

for you to fetch changes up to 1f61cd4a3e9c5bf75910559ddf2372f921c2a4ef:

  ref-manual: variables: add SIGGEN_LOCKEDSIGS* variables (2024-11-06 16:40=
:47 +0100)

----------------------------------------------------------------

Notes:
- Adapt "ref-manual: devtool-reference: document missing commands" to remov=
e
  the part on "ide-sdk".
- Do not pick the bblock commit from Julien, bblock is not backported on ki=
rkstone.
- Pick a commit from Michael to provide description for Sysroot, I was gett=
ing
  an error with newer versions of Sphinx.

----------------------------------------------------------------
Antonin Godard (2):
      ref-manual: devtool-reference: document missing commands
      conf.py: rename :cve: role to :cve_nist:

Julien Stephan (4):
      README: add instruction to run Vale on a subset
      documentation: Makefile: add SPHINXLINTDOCS to specify subset to sphi=
nx-lint
      styles: vocabularies: Yocto: add sstate
      ref-manual: variables: add SIGGEN_LOCKEDSIGS* variables

Michael Opdenacker (1):
      ref-manual: add description for the "sysroot" term

 documentation/Makefile                             | 23 ++++----
 documentation/README                               | 18 +++++-
 documentation/conf.py                              |  2 +-
 .../contributor-guide/recipe-style-guide.rst       |  2 +-
 .../migration-guides/release-notes-3.4.1.rst       | 14 ++---
 .../migration-guides/release-notes-3.4.2.rst       | 42 ++++++-------
 .../migration-guides/release-notes-3.4.3.rst       | 10 ++--
 .../migration-guides/release-notes-3.4.4.rst       |  6 +-
 .../migration-guides/release-notes-3.4.rst         | 56 +++++++++---------
 .../migration-guides/release-notes-4.0.1.rst       | 10 ++--
 .../migration-guides/release-notes-4.0.10.rst      | 42 ++++++-------
 .../migration-guides/release-notes-4.0.11.rst      | 24 ++++----
 .../migration-guides/release-notes-4.0.12.rst      | 48 +++++++--------
 .../migration-guides/release-notes-4.0.13.rst      | 68 +++++++++++-------=
----
 .../migration-guides/release-notes-4.0.14.rst      | 56 +++++++++---------
 .../migration-guides/release-notes-4.0.15.rst      | 34 +++++------
 .../migration-guides/release-notes-4.0.16.rst      | 30 +++++-----
 .../migration-guides/release-notes-4.0.17.rst      | 42 ++++++-------
 .../migration-guides/release-notes-4.0.18.rst      | 32 +++++-----
 .../migration-guides/release-notes-4.0.19.rst      | 36 ++++++------
 .../migration-guides/release-notes-4.0.2.rst       | 14 ++---
 .../migration-guides/release-notes-4.0.20.rst      | 16 ++---
 .../migration-guides/release-notes-4.0.21.rst      | 48 +++++++--------
 .../migration-guides/release-notes-4.0.22.rst      | 30 +++++-----
 .../migration-guides/release-notes-4.0.3.rst       | 30 +++++-----
 .../migration-guides/release-notes-4.0.4.rst       | 22 +++----
 .../migration-guides/release-notes-4.0.5.rst       | 10 ++--
 .../migration-guides/release-notes-4.0.6.rst       | 44 +++++++-------
 .../migration-guides/release-notes-4.0.7.rst       | 40 ++++++-------
 .../migration-guides/release-notes-4.0.8.rst       | 20 +++----
 .../migration-guides/release-notes-4.0.9.rst       | 42 ++++++-------
 .../migration-guides/release-notes-4.0.rst         | 62 ++++++++++--------=
--
 documentation/ref-manual/devtool-reference.rst     | 32 +++++++++-
 documentation/ref-manual/terms.rst                 | 25 ++++++++
 documentation/ref-manual/variables.rst             | 44 ++++++++++++++
 .../styles/config/vocabularies/Yocto/accept.txt    |  1 +
 36 files changed, 596 insertions(+), 479 deletions(-))

