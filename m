Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D71AC87FD2
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 10:12:57 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.84195.1754043168927494120
 for <docs@lists.yoctoproject.org>;
 Fri, 01 Aug 2025 03:12:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Me7D/eeS;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AE5F643393;
	Fri,  1 Aug 2025 10:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754043167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5urLSTATmR4CqwTAsaKI8jVcB6leBnb3YWm4gPDMnds=;
	b=Me7D/eeStXn30n+ab5oeecQ1rCprjqpJiDvQ9m5srOZcTgFH0gO7kz+m5tDJlF7+PO+OoR
	MiCY7gv1bkqBbei0V7awuQ5Aq3sZqJrg0nmEQznCav0RXk7LJffbW8n79GyyK3bRALn2Rw
	2UDIqHqHEk0m1py2i3vXU1LhO+p/ELuznGpDgzylbvl0P3dKCemEuoQdYni2KCQ5Yh6BQN
	1qFaHQMJDLV77tG4PxsQMmo1WOJZ5esQ9EoIBRpw+c2F+5SuSce525LwZ4j/HQ0cXvvYeN
	NNc2nFshJgB52x3L/Pbgpqxorue6dlWVKLHUQxbiStafi8uOV9cx/RL5KY7Yaw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 01 Aug 2025 12:12:46 +0200
Message-Id: <DBR0EQHWJ52H.3U4DUV75N8QEY@bootlin.com>
Subject: [master] Pull request
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7420

The following changes since commit f9f1c87424d307d2df60024bc448bd6778605cf8=
:

  dev-manual/start.rst: remove shared PERSISTENT_DIR mentions (2025-07-15 1=
2:24:48 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs master-next

for you to fetch changes up to dc984e5f54c38748603243053fde8b4d078ba586:

  ref-manual: gather all QA checks in qa-checks.rst (2025-07-29 11:10:30 +0=
200)

----------------------------------------------------------------
Antonin Godard (5):
      dev-manual/start.rst: remove basic setup for hash equivalence
      ref-manual: document new toolchain classes and variables
      ref-manual/classes.rst: insane: drop cve_status_not_in_db
      ref-manual/classes.rst: drop obsolete QA errors
      ref-manual: gather all QA checks in qa-checks.rst

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
 .../migration-guides/release-notes-5.0.11.rst      | 219 +++++
 .../migration-guides/release-notes-5.2.2.rst       | 249 ++++++
 documentation/ref-manual/classes.rst               | 415 ++-------
 documentation/ref-manual/qa-checks.rst             | 933 +++++++++++------=
----
 documentation/ref-manual/variables.rst             |  92 +-
 9 files changed, 1123 insertions(+), 798 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-5.0.11.rst
 create mode 100644 documentation/migration-guides/release-notes-5.2.2.rst

