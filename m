Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63740CCD193
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 07:27:54 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.12699.1760945270079160478
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Oct 2025 00:27:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=1sgG9PvO;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AB1A24E411E0;
	Mon, 20 Oct 2025 07:27:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 82087606D5;
	Mon, 20 Oct 2025 07:27:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 13CE5102F239C;
	Mon, 20 Oct 2025 09:27:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760945263; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=PD9RVtHEoEAo3DVLudidpvmcasHWy6K6dkvt4XKsoxg=;
	b=1sgG9PvOfVObCKvOjxzHleFEUZadYvxLTZ64ZtbdiLNam72VI+FjY0Fyx59klGzl0Yw3FR
	O7eRcdhT5nSxDalWUE6ttI+H7G7U+BV8YshZcw7OhQFSXl4COfeeHmLjRpeWTnGcWKtNd4
	mg+OwW4v5uD55pitY0ctmDPQ2IFsxEdBx94sZWU3nw59craoVEatG/a+lt1fLE5XwX2hYJ
	WvRXA6kqdvfjYz7UCdRvuEJASdOE6q8Tx0lTJQN6XYM+X/59W8TsHfinWI9HHIegxPCfgM
	vx/WrT09sNJCm1grDDivaIe6cH2VApFRAWMhLNW0o9xwUMfbSrRAK+95dK+yPg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Oct 2025 09:27:41 +0200
Message-Id: <DDMYZXEJL0UA.3PJ3RJE1KHGTN@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Oct 2025 07:27:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7750

The following changes since commit 6cd7492bf83232744390f34e496367e94b63e701=
:

  vulnerabilities: update nvdcve file name (2025-10-13 09:13:32 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to 390926c57acb74ea3350d1d8fe26200c81ce54b4:

  ref-manual/classes.rst: uboot-config: improve documentation (2025-10-20 0=
8:58:36 +0200)

----------------------------------------------------------------
Antonin Godard (3):
      ref-manual/variables.rst: document UNINATIVE_URL/CHECKSUM
      ref-manual/classes.rst: extend the uninative class documentation
      ref-manual/classes.rst: uboot-config: improve documentation

 documentation/ref-manual/classes.rst   | 103 +++++++++++++++++++++++++++--=
----
 documentation/ref-manual/variables.rst |  16 +++++
 2 files changed, 100 insertions(+), 19 deletions(-)

