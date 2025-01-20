Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17E9FC02188
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 08:39:32 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.32988.1737362366793261885
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Jan 2025 00:39:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RcKBlvKG;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A7C83240008;
	Mon, 20 Jan 2025 08:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737362364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=45COpwvoPzHJVUwRs0rY0Mm0uRVW+NJmsw2IkqZEUdQ=;
	b=RcKBlvKGta4rYPgH73uoyxd95/dRm8OgsKn52aTUyumSkN7T5AuiwLqrupc54FHwSynRS1
	AZnznl51a5mATDWaAUAU/WRVo3JGt/skMM7zWwdkwGp0tFUX51q8IdnQYgR5L2CakA8rLn
	l4S7I0wA6UtzSs6VV9jLAjxl6adIEp9bRwMIcrfu6hUliSpi1t1qFqQHYxmDLGn1NiH0Bc
	E+9OmBGz4lkxIYbaAaaBO1fWtAetZ7dzFVsNZxd0DCJ0TJHBA1vCvh9AoGl3y3ySLvQv7X
	LeIlP1E8fBaKu2nFNOC1rxxQmsklLb7RblCHba3Tp5GlnHQsbQNbmf9VIoKhqg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Jan 2025 09:39:24 +0100
Message-Id: <D76RK3WKRGJA.1PIHUYOAZ1H6G@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [styhead] Pull request
Cc: <docs@lists.yoctoproject.org>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Jan 2025 08:39:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6149

The following changes since commit 8ac3e2eb1dd4149b24af03666813dc6d94df466d=
:

  ref-manual: move runtime-testing section to the test-manual (2025-01-08 1=
1:42:20 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs styhead-next

for you to fetch changes up to 7513b4485c08cf5e9b0c0299599e944ce1139313:

  test-manual/reproducible-builds: fix reproducible links (2025-01-20 09:33=
:34 +0100)

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

