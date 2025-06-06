Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF46BC61CE7
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 17:15:34 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.653.1749230124992483381
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Jun 2025 10:15:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CuKB3NPo;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8F66E43218;
	Fri,  6 Jun 2025 17:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749230123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BvYZU6B/3xWhLEloPZOUA9q5CMoLams2kAlp+I/stmw=;
	b=CuKB3NPoo8l9J2nUkcrJRcAhqdqC4Cn6d1xqsrWmKCIJADmu0boz8Xk4yulETPYxNqyrEq
	i3r7g1T8yaaa4iPaCKwEj6s5657Gc1/RieIBRskKxAoXc9OFEvoMuoQ1dN8ovc/1vz9jRp
	LY6V0CtToMQlbkhJHx2X8tofaR3UWIdo40+7UmvLzIdur8sybE9+8NM3LJ/J5ag5JXe18T
	geHKAEXsgFcEtq04QiMiSLseK71Hc6H+w2xpjROnyA2VFxXp3r1VvBEGMG5BL52OryUUGn
	d4dnt7XgmSrP+N0QGcx4PruwdNz3MSiJke+BDQ9b6qgpHCWKF0wXJcruG/W+7A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Jun 2025 19:15:23 +0200
Message-Id: <DAFMBT128H1H.7552T07T40K4@bootlin.com>
Subject: [kirkstone] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdehfeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeejleeutdfhffdtkeevfeevffdtvefffeeuudeuveevhfeuudfhudelgfetveeunecukfhppedvrgdtvdemkeegvdelmeekudejrgemgedttddumegttdgsvgemugehkegrmeegvdeltdemlegvrgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvleemkedujegrmeegtddtudemtgdtsggvmeguheekrgemgedvledtmeelvggrjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 06 Jun 2025 17:15:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7031

The following changes since commit 76a4dd5ce041b38f4cab714017a38b035d9530a3=
:

  ref-manual/variables.rst: document INHIBIT_UPDATERCD_BBCLASS (2025-05-26 =
09:48:14 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs kirkstone-next

for you to fetch changes up to 92bc958301d0aeab0a19e75b8604f01770358195:

  docs: conf.py: silence SyntaxWarning on js_splitter_code (2025-06-06 19:0=
9:30 +0200)

----------------------------------------------------------------
Carlos S=C3=A1nchez de La Lama (1):
      ref-manual: clarify KCONFIG_MODE default behaviour

Lee Chee Yang (1):
      migration-guides: add release notes for 4.0.27

Quentin Schulz (3):
      docs: README: specify how to contribute instead of pointing at anothe=
r file
      deduplicate README
      docs: conf.py: silence SyntaxWarning on js_splitter_code

Richard Purdie (1):
      brief-yoctoprojectqs/ref-manual: Switch to new CDN

Robert P. J. Day (1):
      Clean up explanation of minimum required version numbers

 README                                             |  32 +----
 documentation/README                               |  21 ++-
 documentation/brief-yoctoprojectqs/index.rst       |   6 +-
 documentation/conf.py                              |   2 +-
 documentation/migration-guides/release-4.0.rst     |   1 +
 .../migration-guides/release-notes-4.0.27.rst      | 153 +++++++++++++++++=
++++
 documentation/ref-manual/variables.rst             |  13 +-
 7 files changed, 181 insertions(+), 47 deletions(-)
 mode change 100644 =3D> 120000 README
 create mode 100644 documentation/migration-guides/release-notes-4.0.27.rst

