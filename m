Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90F6FC87FDA
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 16:43:40 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.27048.1754671413641520946
 for <docs@lists.yoctoproject.org>;
 Fri, 08 Aug 2025 09:43:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=S1t7I+sz;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5819444345;
	Fri,  8 Aug 2025 16:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754671411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zX01fGlYxb2W6gp8brEvGf6aWKid0gXcUOHaT7BfFTs=;
	b=S1t7I+szPiBQPFVy+Cyn+rYYnhZD9sTrwv9b5zmKh4X6x7U/5R3qE7skz4jKQfRRR7BP41
	gGJMwuzyrB4JuhzTMcz888dAXOCAGuaYxlGDPQiM45YD0mWi+qQMVSjrJMtc7WujrzQLs6
	RLAjJ5OFt4vyEK2kBfcc8YW9r2/JZRWD6AR4nJeRpTcyJXtF3cfiI1BXrgM36ugdqEfGq3
	w4rXwFgaCSrC40H4JxHyByLiIajUsQULu+Sr+GH/ye3mLWCkOAtL6Xj9w/ReLUbyHuchVe
	0IUFoX/OmPWJXFmrmfdjjzDVblcK8QrZnRwUiVQtw9Uu8NbejljINiHaXPEO2g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 08 Aug 2025 18:43:30 +0200
Message-Id: <DBX73PYYGAFB.1LECQZ9AAMT0S@bootlin.com>
Subject: [kirkstone] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdegfedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeejleeutdfhffdtkeevfeevffdtvefffeeuudeuveevhfeuudfhudelgfetveeunecukfhppedvrgdtvdemkeegvdelmeekudejrgemgedttddumegttdgsvgemugehkegrmeegvdeltdemlegvrgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvleemkedujegrmeegtddtudemtgdtsggvmeguheekrgemgedvledtmeelvggrjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 08 Aug 2025 16:43:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7442

The following changes since commit bf855ecaf4bec4cef9bbfea2e50caa65a8339828=
:

  dev-manual/start.rst: added missing command in Optimize your VHDX file us=
ing DiskPart (2025-08-01 12:04:36 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs kirkstone-next

for you to fetch changes up to 1576091585f8ffdcadd8b8eee525614ab16b6fa0:

  ref-manual/classes.rst: document the testexport class (2025-08-08 14:24:1=
9 +0200)

----------------------------------------------------------------
Antonin Godard (4):
      ref-manual/system-requirements.rst: update supported distributions
      ref-manual/variables.rst: document the FIT_CONF_PREFIX variable
      ref-manual/variables.rst: document SPL_DTB_BINARY
      ref-manual/classes.rst: document the testexport class

Erik Lindsten (1):
      overview-manual/yp-intro.rst: fix broken link to article

 documentation/overview-manual/yp-intro.rst       |  2 +-
 documentation/ref-manual/classes.rst             | 19 +++++++
 documentation/ref-manual/system-requirements.rst | 67 +++++++++++++++++---=
----
 documentation/ref-manual/variables.rst           |  9 ++++
 4 files changed, 77 insertions(+), 20 deletions(-)

