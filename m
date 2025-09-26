Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 475A2CAC5B9
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 08:52:20 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.12944.1758876732474647875
 for <docs@lists.yoctoproject.org>;
 Fri, 26 Sep 2025 01:52:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=I0HbEOj+;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 84435C00D94;
	Fri, 26 Sep 2025 08:51:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D7CE3606EC;
	Fri, 26 Sep 2025 08:52:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0AB55102F1873;
	Fri, 26 Sep 2025 10:52:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758876729; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=AnPPltgUnIih40VjMZODVMN6VGxMGbxfeCK+wTdfvTU=;
	b=I0HbEOj+r0aKXGboorj67NsjNZDeicWvrYHvO6qYaQQLWmXxbmDdI4GhmUi5QA54Q3h9R7
	3o6M5eCZ5JwuIX1ol57KCZQQn9i3CALcRh8lu6VzVS4dgiaVmrkpGjTUwPE+B4dSJedrdz
	O6/cMx7yoPI8cZbaPLNeOXV2R+Oaf7wa3v4hfD6g0sE592KGz9DhC8RhamJt1o1mGg6rBp
	5YJK2/bR+C3R0z1YR1mKpe/sssj3iQ9Bg0b4rf5Ylke4sVWEpmrN+m5syvRMtgRaF1h+H1
	KM1082DIp5SikJnUmmY+NWM0PHqT3J7Fi0ciMtBUzk4GLJ9RTp0Vh/qtZyhryA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Sep 2025 10:52:08 +0200
Message-Id: <DD2LRIFORB4T.LUXNVLU8Z22U@bootlin.com>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 26 Sep 2025 08:52:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7611

The following changes since commit 79b37fe79fee03a46a4d791fd9f50e23d4e24797=
:

  migration-guides: add release notes for 5.0.12 (2025-09-12 16:49:18 +0200=
)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to 6b248c541580eadab663f605ce6310302d7a2dae:

  test-manual/yocto-project-compatible.rst: fix a typo (2025-09-26 10:13:01=
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

