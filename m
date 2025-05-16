Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B268CC3ABD8
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 14:04:55 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.14044.1747404288542526527
 for <docs@lists.yoctoproject.org>;
 Fri, 16 May 2025 07:04:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JTUcO3BT;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3A19B43A51;
	Fri, 16 May 2025 14:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747404287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Hb5X7lXnuU/5Bdz1fRVC1TXUY4bqcPwA8gd7Skiokr4=;
	b=JTUcO3BTDXBuaoet1spq+cGshu1UHJwSitUvwd82CGaYIRE1zyBkLDZRyw8n/25n06DtY8
	B1Xgm9AHgczPM60DDfvmSD+O8yhv/WSYqOrQCFd2l8cIkbv47EL4gMD48aiUPw+TudIoV/
	99pevl6aUBYPQfF7h9t8jMVPsSvlI4zfV7pyMYsAtUgsGQi8s/HTOi5VJWntTfMcpTnNOj
	MolbAB2K7ZqKhPOoAhRx/uLXD4BfvJSNWkegwyw4JvtS3phRGKeO03syhfIoEXgDPhTCgZ
	9AM8MUOG6d9yb56igykep8kQL8dbjJOAbUYZvYLm2GoDCp3Hf9h/QWSFCKkJaw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 May 2025 16:04:47 +0200
Message-Id: <D9XN4FETJ9J5.2KYGPFKHXP8AG@bootlin.com>
Subject: [walnascar] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefuddvleegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeejleeutdfhffdtkeevfeevffdtvefffeeuudeuveevhfeuudfhudelgfetveeunecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 16 May 2025 14:04:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6830

The following changes since commit b8d9cf79d299b2e553e6bc962527d835206022ec=
:

  migration-guides/release-notes-5.2.rst: add missing cves (2025-04-23 15:3=
7:39 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs walnascar-next

for you to fetch changes up to 6b7019c13054bf11fb16657a3fac85831352cea9:

  ref-manual/variables.rst: document WIC_CREATE_EXTRA_ARGS (2025-05-16 15:2=
9:37 +0200)

----------------------------------------------------------------
Adrian Freihofer (1):
      ref-manual: kernel-fitimage.bbclass does not use SPL_SIGN_KEYNAME

Antonin Godard (2):
      test-manual/intro: remove Buildbot version used
      ref-manual/release-process: update releases.svg

Enrico J=C3=B6rns (1):
      ref-manual/variables.rst: update ROOT_HOME documentation

Lee Chee Yang (2):
      migration-guides: add release notes for 4.0.26
      migration-guides: add release notes for 5.0.9

Leonard Anderweit (1):
      ref-manual: classes: uki: Fix git links

Mikko Rapeli (1):
      sbom.rst: how to disable SPDX generation

Trevor Woerner (3):
      contributor-guide/submit-changes: encourage patch version changelogs
      sphinx-lint: various fixes
      ref-manual/variables.rst: document WIC_CREATE_EXTRA_ARGS

 documentation/contributor-guide/submit-changes.rst |  32 ++
 documentation/dev-manual/devtool.rst               |   2 +-
 documentation/dev-manual/sbom.rst                  |  14 +-
 documentation/dev-manual/start.rst                 |   4 +-
 documentation/migration-guides/migration-5.2.rst   |   2 +-
 documentation/migration-guides/release-4.0.rst     |   1 +
 documentation/migration-guides/release-5.0.rst     |   1 +
 .../migration-guides/release-notes-4.0.26.rst      | 263 +++++++++++
 .../migration-guides/release-notes-5.0.9.rst       | 206 ++++++++
 .../migration-guides/release-notes-5.2.rst         |   4 +-
 documentation/ref-manual/classes.rst               |   8 +-
 documentation/ref-manual/svg/releases.svg          | 518 +++++++++++++++++=
----
 documentation/ref-manual/variables.rst             |  31 +-
 documentation/test-manual/intro.rst                |  12 +-
 14 files changed, 981 insertions(+), 117 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.26.rst
 create mode 100644 documentation/migration-guides/release-notes-5.0.9.rst

