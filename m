Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91C3CCA0EC1
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 16:43:40 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.27049.1754671414063059218
 for <docs@lists.yoctoproject.org>;
 Fri, 08 Aug 2025 09:43:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YeSH65Qf;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EE51244380;
	Fri,  8 Aug 2025 16:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754671412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=elJuhKtk07ePDC+079reSra5zsHzH2hSiNq1RR4B8N4=;
	b=YeSH65QfEgaF4KnXqRz287viAXysgLQPIwTFrSSVDMsW2bGKRmIHsUymwNJ/gyqPNLo288
	yscJq96gAeO0HWzZsHpYrzVBPSkJSp5M8/kgBYbFz5vAyeyhYbI/oabciKWgL4AEnRosyp
	N1ZF9w22YjyxKPd3fuoDY7dzI1Z3i5Dm9PRmlCWqPOYSg5oRLonL+jW7Il4C1XQ3oIjqgn
	JYheqVX3fzK82ekFh4QAMoouKhGHr7bn7VdsHpWiqBdnjj/oVeuXSmg98KZ3aV/UO+KUVd
	HnerruQCPE4t7swlyl4Y1hfNKlc4885+7JVnspDqfyDrMRsGAPCqSSxGubgNOg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 08 Aug 2025 18:43:31 +0200
Message-Id: <DBX73Q9N1ZRD.3G4ROHDNWECPO@bootlin.com>
Subject: [walnascar] Pull request
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7443

The following changes since commit 698253a6c95beb1219b7fed8a90d02fb6ddc5111=
:

  ref-manual/classes.rst: drop obsolete QA errors (2025-08-01 12:06:33 +020=
0)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs walnascar-next

for you to fetch changes up to e664a70adb5bc19041b3b5f553fb90dcddff99d0:

  ref-manual/classes.rst: document the testexport class (2025-08-08 14:27:0=
4 +0200)

----------------------------------------------------------------
Antonin Godard (4):
      ref-manual/system-requirements.rst: update supported distributions
      ref-manual/variables.rst: document the FIT_CONF_PREFIX variable
      ref-manual/variables.rst: document SPL_DTB_BINARY
      ref-manual/classes.rst: document the testexport class

Erik Lindsten (1):
      overview-manual/yp-intro.rst: fix broken link to article

 documentation/overview-manual/yp-intro.rst       |  2 +-
 documentation/ref-manual/classes.rst             | 19 +++++++++
 documentation/ref-manual/system-requirements.rst | 54 ++++++++++++--------=
----
 documentation/ref-manual/variables.rst           |  9 ++++
 4 files changed, 56 insertions(+), 28 deletions(-)

