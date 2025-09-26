Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55C1ECAC5BC
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 08:52:20 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.12909.1758876732520409549
 for <docs@lists.yoctoproject.org>;
 Fri, 26 Sep 2025 01:52:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=An8eNuwk;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 58B01C00D92
	for <docs@lists.yoctoproject.org>; Fri, 26 Sep 2025 08:51:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B0E3B606B5;
	Fri, 26 Sep 2025 08:52:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9B9CE102F1871;
	Fri, 26 Sep 2025 10:52:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758876729; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=MM3Do/w1fgakHfyzvEZqk9d9eRR1Y1upSyjYX50K2rI=;
	b=An8eNuwk3bl+uQF8GhOBdL3PQXeMYl3tq+GHoMn8w4OP2niRefBDTOJEPbQFrWzVXIkuYI
	GaSK2rmk0wGhOuxDcgZWSOj+B+8FF/5mPqA0J6W4i03za02O/MHldf8Kwink+kI978B6z6
	n73GN6Ygz999IMMEkAB8q9hRRKUhlOv9TwylkdYYEdbUkTjXC15p6v4JeQ5Yo+k1Qke9Zh
	AOP5RHrOSKy0Mb/4U3ONBtmJukIBQxEe5SJA6NgFeXYZwfk65Aqleo+X6yUcusYzh6qSxk
	rbBP82yXeNN5DYAUMkdzDBlEbYpOuy5TxJtr6tdg4pvTLSuCEEvhzOu1ici7qQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Sep 2025 10:52:08 +0200
Message-Id: <DD2LRI7RKOSD.1LOYS5B8JPN1X@bootlin.com>
Subject: [walnascar] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 26 Sep 2025 08:52:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7614

The following changes since commit 29330751c8a2b82b4bd80659d2a0a8bac51afca5=
:

  migration-guides: add release notes for 5.0.12 (2025-09-12 16:48:58 +0200=
)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs walnascar-next

for you to fetch changes up to c76ea1be1e08184d162c92aba168a44fd5573c58:

  test-manual/yocto-project-compatible.rst: fix a typo (2025-09-26 10:12:45=
 +0200)

----------------------------------------------------------------
Antonin Godard (1):
      test-manual/yocto-project-compatible.rst: fix a typo

Barne Carstensen (1):
      test-manual: update runtime-testing Exporting Tests section

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
 documentation/test-manual/runtime-testing.rst      |  19 ++-
 .../test-manual/yocto-project-compatible.rst       |   2 +-
 3 files changed, 105 insertions(+), 94 deletions(-)

