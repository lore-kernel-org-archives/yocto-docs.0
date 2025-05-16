Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFC2DC54754
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 14:04:55 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.13934.1747404291762058591
 for <docs@lists.yoctoproject.org>;
 Fri, 16 May 2025 07:04:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IfS25VTA;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4B9DD439A2;
	Fri, 16 May 2025 14:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747404289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bjWQSwaS0a6yrfw0pOfaUdZZZwlvLsQmblLp8Ut6G+Q=;
	b=IfS25VTA7+HNbpI45wpOzI3FDRxeio2tZ4eO+K8D1AP0ViTd9Bf85BtyuUIccGzDtjqE2m
	t630M4Rq62rnzc2ajKsXb2YSDQfUNF+Efph3oAXPM7pPAL4QebiHRnuv1+AppjaVqxJn+i
	KcQSnSGuXmfzJaUqd9JA+DjxL1lSGicjFxp8jQ2FSeOWxwN78hEo1qA6zv3vSOwijnfWrU
	OgDGe9mcuM5hb0/XPvJpo/3wqslVb1IR401pMdrMtp9vdmhERCv86SZFF/SfxyYUF08S8A
	GkY53tRW6EASJlSYb49pTRer4QZUj7uAocrnmYrY95AWqle+7krzbxqytsMwvA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 May 2025 16:04:48 +0200
Message-Id: <D9XN4G9AK9AO.1IDNY5B03MOU4@bootlin.com>
Subject: [scarthgap] Pull request
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6831

The following changes since commit d1f3616b373334a5aa75ad7874f05ee4b0e6591f=
:

  Fix dead links that use the DISTRO macro (2025-04-10 10:16:01 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to 38706f0e743447da9a39a6369620fa039ab6df3b:

  ref-manual/variables.rst: document WIC_CREATE_EXTRA_ARGS (2025-05-16 15:3=
0:43 +0200)

----------------------------------------------------------------
Adrian Freihofer (1):
      ref-manual: kernel-fitimage.bbclass does not use SPL_SIGN_KEYNAME

Antonin Godard (3):
      dev-manual/sbom.rst: fix wrong build outputs
      test-manual/intro: remove Buildbot version used
      ref-manual/release-process: update releases.svg

Enrico J=C3=B6rns (1):
      ref-manual/variables.rst: update ROOT_HOME documentation

Lee Chee Yang (2):
      migration-guides: add release notes for 4.0.26
      migration-guides: add release notes for 5.0.9

Trevor Woerner (2):
      contributor-guide/submit-changes: encourage patch version changelogs
      ref-manual/variables.rst: document WIC_CREATE_EXTRA_ARGS

 documentation/contributor-guide/submit-changes.rst |  32 ++
 documentation/dev-manual/sbom.rst                  |  15 +-
 documentation/migration-guides/release-4.0.rst     |   1 +
 documentation/migration-guides/release-5.0.rst     |   1 +
 .../migration-guides/release-notes-4.0.26.rst      | 263 +++++++++++
 .../migration-guides/release-notes-5.0.9.rst       | 206 ++++++++
 documentation/ref-manual/svg/releases.svg          | 518 +++++++++++++++++=
----
 documentation/ref-manual/variables.rst             |  27 +-
 documentation/test-manual/intro.rst                |  12 +-
 9 files changed, 962 insertions(+), 113 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.26.rst
 create mode 100644 documentation/migration-guides/release-notes-5.0.9.rst

