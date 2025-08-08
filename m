Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F43ACA0EC0
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 16:43:40 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.27050.1754671414068070472
 for <docs@lists.yoctoproject.org>;
 Fri, 08 Aug 2025 09:43:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TFFht+Fl;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8FA8D1F434;
	Fri,  8 Aug 2025 16:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754671411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PL0e4Fw/lr19yiZihdUZ+yHwppHxIWOR5KsHA4Fj1hE=;
	b=TFFht+Flkjk1wYpfr/sh4BpRCQup2A+ge6adUqEaMCvdah4g/AtGZS+RLMJ02VrtIrIzOk
	i7KArenUdcdWxglgqHeTmMABLz7htgXgsSH+IRRmcI3oapSivX67RCJFp21Z3+jWI9ZMID
	Ro6tFOQ2cbNf3bnGcS8T+8nWidc7xwhkohXkVMpWcafVJDxXDrDOITTa1iJ5GKVHNzQNod
	kfYANVRbkR2ZLPfguheYmkS2ULoPPhcVh2l4thAv4HWOqa7nqJcwQSMuhxNY3skJzYVQGx
	TXICJmH2DBjvQtOTfe/q3JsIjzB3XINR1K+iQlJm++FxqvgCLBzJWFn9zYlvOg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 08 Aug 2025 18:43:31 +0200
Message-Id: <DBX73Q3O7D89.IP8MNHLO79A1@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdegfedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkhffvufevsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfetgeeuleektdfgvdffgfegleefleevtdduueegfeehhfdvkedtvddvueeigeejnecukfhppedvrgdtvdemkeegvdelmeekudejrgemgedttddumegttdgsvgemugehkegrmeegvdeltdemlegvrgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvleemkedujegrmeegtddtudemtgdtsggvmeguheekrgemgedvledtmeelvggrjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 08 Aug 2025 16:43:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7444

The following changes since commit 0c154c1f431be918c4c9ce3047c12099925a9c53=
:

  variables.rst: remove references to obsolete tar packaging (2025-08-01 12=
:05:31 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to dd665216fa578a1f2f268790d708c6a5d2912ecf:

  ref-manual/classes.rst: document the testexport class (2025-08-08 14:25:4=
0 +0200)

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
 documentation/ref-manual/system-requirements.rst | 53 ++++++++++++++------=
----
 documentation/ref-manual/variables.rst           |  9 ++++
 4 files changed, 59 insertions(+), 24 deletions(-)

