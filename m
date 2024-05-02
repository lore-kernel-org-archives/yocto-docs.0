Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED301C25B10
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 06:57:33 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.7638.1714633044397325173
 for <docs@lists.yoctoproject.org>;
 Wed, 01 May 2024 23:57:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KJLdJWPQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 081D1FF80A;
	Thu,  2 May 2024 06:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714633043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WxoFLC7CAFnE2am4cLj8FczNbx4Hpmh73sHf7HOGGdM=;
	b=KJLdJWPQKrGd175jcfivt4CHMJT2jbyFSY4qVmpZvg4aWX9S/NwkgYE4e3ozW1zRwcxIN1
	96AclJ0/U11tOaGyOfDU7u1ufz5fqw4FKlMYuEHDLk24ZcGHSZ5SzVvvyORE6mh1ZchLqq
	GsGL4vPsPRr6pAsBLu6LQa/u8kEaPMhYfycsqdT4fj/DTsE1U9anLt+0rJiW0O+gfgK6lZ
	34EghOOBW6E72ceBkaQ/SLkOSAEuVcXxCGdI+/DI/4IXsNo25Mvp6ixJgjvrhhioSJwf6N
	qalORnwYC5tAoj8NfIk2BuziNOBedTu9hf5xy7/sYkgz1YusMhpbtJ3vHC775A==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 0/6] documentation backports
Date: Thu,  2 May 2024 08:57:15 +0200
Message-Id: <20240502065721.22607-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 May 2024 06:57:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5192

From: Michael Opdenacker <michael.opdenacker@bootlin.com>


Alexander Kanavin (1):
  documentation/poky.yaml.in: drop mesa/sdl from essential host packages

Geoff Parker (1):
  ref-manual: variables: Update default INHERIT_DISTRO value

Lee Chee Yang (1):
  migration-notes: add release notes for 4.0.18

Michael Opdenacker (2):
  documentation: standards.md: align with master branch
  ref-manual: update releases.svg

Paul Eggleton (1):
  dev-manual: update custom distribution section

 .../dev-manual/custom-distribution.rst        |  34 +++-
 .../migration-guides/release-4.0.rst          |   1 +
 .../migration-guides/release-notes-4.0.18.rst | 191 ++++++++++++++++++
 documentation/poky.yaml.in                    |  16 +-
 documentation/ref-manual/svg/releases.svg     |  99 +++++----
 documentation/ref-manual/variables.rst        |   2 +-
 documentation/standards.md                    |  97 ++++++++-
 7 files changed, 386 insertions(+), 54 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.18.rst

-- 
2.34.1


