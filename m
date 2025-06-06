Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF9BC61DB8
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 17:15:24 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.635.1749230123445788356
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Jun 2025 10:15:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=l3zWSSW7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9054D1F433;
	Fri,  6 Jun 2025 17:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749230121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Cg7uLcKLdPma7xqge9tR4VmNvEPtLMJ5SoOXg+xA0u8=;
	b=l3zWSSW7HxMitN0MGMbQoMhgSOv0DzG0Ll1o3A95o2YrWy5BWeZVV0g42/d4k1hEnt+cxk
	nW3u+LGIr3mxkcxmR+kOx+QXG7+l+KRcjV+J2Dg+COu93bRM4OitQAzH4hKBf9Brw31HYe
	jtSBLsd+qRkm9kLItqOFHMAGY86D5VeJT3YkPA7vcVRw6H9RiBdFXzgFA4yIulHBlsmKwh
	YIcAlqtylHY4RFNgOUKCnPkb4j2vCpuwBbXbykoG3b9XKPg/3PAFS3gt+1+uAhS0GzHQa2
	n734Nd5ygBptrVFEgiQFh+pmA7Y19NljAAJE2iynnA3Ionpq50S4+ch+A0LXlQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Jun 2025 19:15:21 +0200
Message-Id: <DAFMBS32VARN.3524INS2ERJ0O@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdehfeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkhffvufevsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfetgeeuleektdfgvdffgfegleefleevtdduueegfeehhfdvkedtvddvueeigeejnecukfhppedvrgdtvdemkeegvdelmeekudejrgemgedttddumegttdgsvgemugehkegrmeegvdeltdemlegvrgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvleemkedujegrmeegtddtudemtgdtsggvmeguheekrgemgedvledtmeelvggrjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 06 Jun 2025 17:15:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7030

The following changes since commit 3996388e337377bedc113d072a51fe9d68dd40c6=
:

  ref-manual/variables.rst: document INHIBIT_UPDATERCD_BBCLASS (2025-05-26 =
09:46:38 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to 6f424ed4ce749a135be3145a2e9d04030fdbda39:

  docs: conf.py: silence SyntaxWarning on js_splitter_code (2025-06-06 19:0=
9:28 +0200)

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

