Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AE2ACAC5AE
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 08:52:20 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.12943.1758876732163864169
 for <docs@lists.yoctoproject.org>;
 Fri, 26 Sep 2025 01:52:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=VwwBPzBJ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8954E1A0FC5
	for <docs@lists.yoctoproject.org>; Fri, 26 Sep 2025 08:52:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5E477606B5;
	Fri, 26 Sep 2025 08:52:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 86E1C102F186F;
	Fri, 26 Sep 2025 10:52:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758876730; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=tJt5gNbEn/9S9+i2f4bkxj/S6wFifOsHc1ibux3SUOw=;
	b=VwwBPzBJaJnlyUDjUP+VIfA/MBlY7mY4snZQ22m7KIrhbLyin3ld86piJtyNjwh/+RChn9
	tpUEfhguMURc2YP6ozXJEbyeVEfv0kN54rBT/Q00nWR77DgJdGPScnXDoqsqRo2MZAvARL
	5pDj4PefAFnuIOP7JePVpraq/qU1G+1mHvpwMRfh30vB4jO9CblQ5BoymLzSDxK4Ozx20L
	k2P9u16G+6e0zF7cmAXN3s8aF3PmQdh6Slh4Q21orJ1/RHk6jUN69F7Yz5l0nMR5GHcyuS
	eciShftKtdI6ZqmiML4Hc2CqrgqtCLNMuZRhFkXGDRQOhaL+lhN4BM0Vx7GMkg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Sep 2025 10:52:09 +0200
Message-Id: <DD2LRINS3QQK.1JAAN1TD89D70@bootlin.com>
Subject: [kirkstone] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 26 Sep 2025 08:52:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7612

The following changes since commit 71a3933c609ce73ff07e5be48d9e7b03f22ef8d7=
:

  ref-manual/variables.rst: expand IMAGE_OVERHEAD_FACTOR glossary entry (20=
25-09-12 16:39:42 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs kirkstone-next

for you to fetch changes up to 95f31030628d0f7681401b1de6fb8e7a362963c1:

  test-manual/yocto-project-compatible.rst: fix a typo (2025-09-26 10:14:22=
 +0200)

----------------------------------------------------------------
Antonin Godard (1):
      test-manual/yocto-project-compatible.rst: fix a typo

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

 documentation/contributor-guide/submit-changes.rst | 178 +++++++++++------=
----
 .../test-manual/yocto-project-compatible.rst       |   2 +-
 2 files changed, 93 insertions(+), 87 deletions(-)

