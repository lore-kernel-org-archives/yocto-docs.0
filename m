Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E7EAC87FDA
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 10:12:57 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.84197.1754043170369952850
 for <docs@lists.yoctoproject.org>;
 Fri, 01 Aug 2025 03:12:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SulWYfcA;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4BB6A4328E;
	Fri,  1 Aug 2025 10:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754043167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iQ15EjNKLkI6nEgf9Vu8SmLsNoF3/pAUNMVcIdTbvMY=;
	b=SulWYfcA6MpPUSYVHIOJ2TBkJhMU6kUuJXvofttuuLmq+ee7eMk5eweCqU0xuQN0WhdNk2
	4xAJD8rWiIYEYMYd9+eAK6wlT0xhWxTPkffL7B4Gnt1OoKYzvNVuC6goX+D9ML2ucONEuL
	T1hFYlsrHams3/S4TI2Zc9EwNIniXswva5BBSPA5ssHuLeAN05PvVI2bkGPCJfMqP5AGQ8
	yDYk4FCeLbLoUYWk9fHYIywkD2ElV51gxcxumeCCS8r4FyVlfbuQ1PSKxlcBQpJIOUFOfy
	GKiqSnJr5RPyx+3LeeyZSGZQafWoQYP5vVkYwxA8IZP4wlOATO8ikOkMnFmq+Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 01 Aug 2025 12:12:47 +0200
Message-Id: <DBR0EQSKZ7SE.379AOVQGB7QP0@bootlin.com>
Subject: [walnascar] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutdefgedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeejleeutdfhffdtkeevfeevffdtvefffeeuudeuveevhfeuudfhudelgfetveeunecukfhppedvrgdtvdemkeegvdelmeekudejrgemgedttddumegttdgsvgemugehkegrmeegvdeltdemlegvrgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvleemkedujegrmeegtddtudemtgdtsggvmeguheekrgemgedvledtmeelvggrjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 01 Aug 2025 10:12:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7422

The following changes since commit 98e71db7177257b340f5841bb9d7f8d83296c546=
:

  dev-manual/start.rst: remove shared PERSISTENT_DIR mentions (2025-07-15 1=
2:25:01 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs walnascar-next

for you to fetch changes up to 698253a6c95beb1219b7fed8a90d02fb6ddc5111:

  ref-manual/classes.rst: drop obsolete QA errors (2025-08-01 12:06:33 +020=
0)

----------------------------------------------------------------
Antonin Godard (3):
      dev-manual/start.rst: remove basic setup for hash equivalence
      ref-manual/classes.rst: insane: drop cve_status_not_in_db
      ref-manual/classes.rst: drop obsolete QA errors

Lee Chee Yang (2):
      migration-guides: add release notes for 5.2.2
      migration-guides: add release notes for 5.0.11

Marco Cavallini (1):
      dev-manual/start.rst: added missing command in Optimize your VHDX fil=
e using DiskPart

Robert P. J. Day (1):
      variables.rst: remove references to obsolete tar packaging

 documentation/dev-manual/start.rst                 |   8 +-
 documentation/migration-guides/migration-3.2.rst   |   2 +-
 documentation/migration-guides/release-5.0.rst     |   1 +
 documentation/migration-guides/release-5.2.rst     |   2 +
 .../migration-guides/release-notes-5.0.11.rst      | 219 +++++++++++++++++=
+
 .../migration-guides/release-notes-5.2.2.rst       | 249 +++++++++++++++++=
++++
 documentation/ref-manual/classes.rst               |  18 --
 documentation/ref-manual/variables.rst             |  14 +-
 8 files changed, 478 insertions(+), 35 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-5.0.11.rst
 create mode 100644 documentation/migration-guides/release-notes-5.2.2.rst

