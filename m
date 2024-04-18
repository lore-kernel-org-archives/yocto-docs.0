Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0B7AC05023
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 18:28:03 +0000 (UTC)
Received: from mail2.g23.pair.com (mail2.g23.pair.com [66.39.132.40])
 by mx.groups.io with SMTP id smtpd.web11.1503.1713464881792867807
 for <docs@lists.yoctoproject.org>;
 Thu, 18 Apr 2024 11:28:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 66.39.132.40, mailfrom: bluelightning@bluelightning.org)
Received: from mail2.g23.pair.com (localhost [127.0.0.1])
	by mail2.g23.pair.com (Postfix) with ESMTP id 81CDB11FBA;
	Thu, 18 Apr 2024 14:28:00 -0400 (EDT)
Received: from localhost.localdomain (unknown [24.75.208.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.g23.pair.com (Postfix) with ESMTPSA id CCF9C12191;
	Thu, 18 Apr 2024 14:27:59 -0400 (EDT)
From: Paul Eggleton <bluelightning@bluelightning.org>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 0/2] Add a few missed new features for 5.0
Date: Thu, 18 Apr 2024 11:27:53 -0700
Message-Id: <cover.1713464653.git.bluelightning@bluelightning.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Scanned-By: mailmunge 3.10 on 66.39.132.40
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 18 Apr 2024 18:28:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5166

Add a few new features in 5.0 that I missed in the previous patchset.
Apologies for being last-minute!


The following changes since commit 0cdc0afd3332459d30cfc8f4c2e62bdcc23f5e=
d5:

  release-notes: additional features and one known issue for 5.0 (2024-04=
-15 17:39:29 +0200)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib paule/5.0-extras
  https://git.yoctoproject.org/poky-contrib/log/?h=3Dpaule/5.0-extras

Paul Eggleton (2):
  variables: add USERADD_DEPENDS
  release-notes: add a few more new features

 .../migration-guides/release-notes-5.0.rst    | 32 +++++++++++++++++--
 documentation/ref-manual/variables.rst        |  6 ++++
 2 files changed, 36 insertions(+), 2 deletions(-)

--=20
2.25.1


