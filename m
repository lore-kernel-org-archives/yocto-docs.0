Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD470C54756
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 14:04:55 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.14047.1747404292459620474
 for <docs@lists.yoctoproject.org>;
 Fri, 16 May 2025 07:04:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CU6RKPMS;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1583C43A51;
	Fri, 16 May 2025 14:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747404291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HIWdErjUCEljFLplYDn+x/APcquNHx/Y7jvJEs/Y47w=;
	b=CU6RKPMSiIDbiljmNKn6xMq8FZcgRp3i+cZNUU3ig5L1NUH+ADEJn+0PxYEDX9ZoNupfZg
	3YsPz+/iCWaQ5mKo1UxiB7QXG5z+kTDa4fUA3op+HprazoEem5qgI6mcF+dakATUC8E/XU
	ODbqUMv6sMJYZbj6qcopw7CTx2GqaZQHHKMXKjHLUoxVDeojGyiicbf0WEapTMlKPLYsDH
	NvOItH9Ark3AzHwwPAAJ4lTl0dA82X0dhsSMs7rEUqfSt8TFeRxSXM65er3umzCBwMqHD8
	04KU5pfShBUCzWRNLbsYSjj+F3VG6JFu/fJB+l/Z+3PQyt64AJ+c4EQWGb+2/g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 May 2025 16:04:50 +0200
Message-Id: <D9XN4H6KKJX0.2LPJ53Z1T1MA@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [kirkstone] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefuddvleegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvffuvefhsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgefggeejtdetieeuteeijedvieejgfdufedtvefhffeludethedthfdvteefleegnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 16 May 2025 14:04:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6832

The following changes since commit 0d51e553d5f83eea6634e03ddc9c7740bf72fcea=
:

  Fix dead links that use the DISTRO macro (2025-04-10 10:23:32 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs kirkstone-next

for you to fetch changes up to 8e893cc8cabba4b4f21556561d1ca9656ca1ff9f:

  ref-manual/variables.rst: document WIC_CREATE_EXTRA_ARGS (2025-05-16 15:3=
2:51 +0200)

----------------------------------------------------------------
Adrian Freihofer (1):
      ref-manual: kernel-fitimage.bbclass does not use SPL_SIGN_KEYNAME

Antonin Godard (3):
      dev-manual/sbom.rst: fix wrong build outputs
      test-manual/intro: remove Buildbot version used
      ref-manual/release-process: update releases.svg

Lee Chee Yang (1):
      migration-guides: add release notes for 4.0.26

Trevor Woerner (2):
      contributor-guide/submit-changes: encourage patch version changelogs
      ref-manual/variables.rst: document WIC_CREATE_EXTRA_ARGS

 documentation/contributor-guide/submit-changes.rst |  32 ++
 documentation/dev-manual/sbom.rst                  |  15 +-
 documentation/migration-guides/release-4.0.rst     |   1 +
 .../migration-guides/release-notes-4.0.26.rst      | 263 +++++++++++
 documentation/ref-manual/svg/releases.svg          | 518 +++++++++++++++++=
----
 documentation/ref-manual/variables.rst             |  16 +-
 documentation/test-manual/intro.rst                |  12 +-
 7 files changed, 752 insertions(+), 105 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.26.rst

