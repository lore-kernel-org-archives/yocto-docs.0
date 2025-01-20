Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D2E1C0218B
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 08:39:32 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.32989.1737362367499453857
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Jan 2025 00:39:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=E3NvXXLi;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 09F586000F;
	Mon, 20 Jan 2025 08:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737362366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uSXS+QBxmZFZU9xRqqpYY75Hmd+WBecUNjUefEQHbrw=;
	b=E3NvXXLif8QRHkz7h9OGGPWa6HAuxMU1wkYZF2+NKrn+vOC+8qNpLfruI1mOx9u4dZy3ew
	TBlI7EtqE8uGvQqLJCWRAUhsRltCPslkE3uqIFCJhRBQK56xGcdre38Hd2xYp+hFg1vYOg
	eSWIV+CKMzH+U3hy8RvMPNpvZyvQ5WtfFZWmzbld6TXLr2c24FbDh7obiZb8NlTcJo/iLO
	WwbIaBdHIdcvJ0zs1Wt8VDJWkh6C2mQ+vKfwck+m6U2bLrHZuh7pCEVVSzSYAyV9U6c6D9
	dpCqZue5kQ8PFYJgNjmRb3tXue1k1mVZrfcVrf/Kkzoo5pQSO85pR1esiqhP3A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Jan 2025 09:39:25 +0100
Message-Id: <D76RK4ILQEH5.WT1C08SLC5A4@bootlin.com>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Jan 2025 08:39:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6150

The following changes since commit 79aa34db34def525a11c41d951365bcb891318c4=
:

  ref-manual: move runtime-testing section to the test-manual (2025-01-08 1=
1:42:43 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to bb9e018adcc10c642f87d0b95432783b5eb8057b:

  test-manual/reproducible-builds: fix reproducible links (2025-01-20 09:33=
:41 +0100)

----------------------------------------------------------------
Antonin Godard (2):
      Update autobuilder URLs to valkyrie
      test-manual/reproducible-builds: fix reproducible links

Lee Chee Yang (1):
      migration-guides: add release notes for 5.0.6

 documentation/migration-guides/release-5.0.rst     |   1 +
 .../migration-guides/release-notes-5.0.6.rst       | 223 +++++++++++++++++=
++++
 documentation/poky.yaml.in                         |   1 -
 documentation/ref-manual/release-process.rst       |   2 +-
 documentation/test-manual/reproducible-builds.rst  |   8 +-
 documentation/test-manual/test-process.rst         |   2 +-
 .../test-manual/understand-autobuilder.rst         |   2 +-
 7 files changed, 229 insertions(+), 10 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-5.0.6.rst

