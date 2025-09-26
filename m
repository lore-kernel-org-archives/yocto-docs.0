Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4603DCAC5AC
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 08:52:20 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.12910.1758876732637152330
 for <docs@lists.yoctoproject.org>;
 Fri, 26 Sep 2025 01:52:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=bPfG/0Tt;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 040854E40DF7
	for <docs@lists.yoctoproject.org>; Fri, 26 Sep 2025 08:52:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C8488606E3;
	Fri, 26 Sep 2025 08:52:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BDEF7102F1872;
	Fri, 26 Sep 2025 10:52:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758876729; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=QzQe1SQFJp2bEyKgcZaGgjUlcS/7x1cyaQ4as7awEz0=;
	b=bPfG/0TtS8BMlPGowR+vlNB9tgxB1AaJlja9ksbwaPiC/8DDvGkniu253JxxFbFaQydUru
	rHgLuEVMsOlTBPqYNs7VqRB1c8p+vKwLWIzMghP1Huh+ProF/u8+WidER68KAw/rvmc8/t
	eKxUdrvRYDn6dEwi26Z7DqQazfpsGD/wOC134Ceirkyo2MB8UE74/5bmAEkpj7Ycw/Kbmt
	XzydB+Mp9NjddFAC3mUJchQWBW3/FAfciJRJSAMbMdsGlfWS5DMNErdk2LMhOeES9nMw2Y
	PA1bD3WjC2upGe4TV5bqF9h0IWu2niwrrTI6/HKXPS49EeN6nqWQkZPS5V3E5w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Sep 2025 10:52:07 +0200
Message-Id: <DD2LRHYTAV60.2H0TT95ZBWXGA@bootlin.com>
Subject: [master] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 26 Sep 2025 08:52:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7613

The following changes since commit e77139b5c616e6e5ad436eb91416fd804389425f=
:

  migration-guides: add release notes for 5.0.12 (2025-09-12 16:48:32 +0200=
)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to a84c234acfedfa714419006c743405e2f9acaedc:

  test-manual/yocto-project-compatible.rst: fix a typo (2025-09-26 09:56:59=
 +0200)

----------------------------------------------------------------
Antonin Godard (2):
      ref-manual/structure.rst: extend PERSISTENT_DIR description
      test-manual/yocto-project-compatible.rst: fix a typo

Barne Carstensen (1):
      test-manual: update runtime-testing Exporting Tests section

Peter Kjellerstedt (2):
      migration-5.3.rst: Correct a typo
      migration-5.3.rst: Correct info about the removed libsoup-2.4 recipe

Quentin Schulz (7):
      contributor-guide: submit-changes: fix improper bold string
      contributor-guide: submit-changes: clarify example with Yocto bug ID
      contributor-guide: submit-changes: align CC tag description
      contributor-guide: submit-changes: make the Cc tag follow kernel guid=
elines
      contributor-guide: submit-changes: reword commit message instructions
      contributor-guide: submit-changes: number instruction list in commit =
your changes
      contributor-guide: submit-changes: make "Crediting contributors" part=
 of "Commit your changes"

Yoann Congal (1):
      migration-guides/release-notes-5.3: using runqemu with compressed ima=
ges

 documentation/contributor-guide/submit-changes.rst | 178 +++++++++++------=
----
 documentation/migration-guides/migration-5.3.rst   |   8 +-
 .../migration-guides/release-notes-5.3.rst         |   7 +
 documentation/ref-manual/structure.rst             |  11 ++
 documentation/test-manual/runtime-testing.rst      |  19 ++-
 .../test-manual/yocto-project-compatible.rst       |   2 +-
 6 files changed, 127 insertions(+), 98 deletions(-)

