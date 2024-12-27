Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41304E7718F
	for <webhook@archiver.kernel.org>; Fri, 27 Dec 2024 14:03:01 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.13009.1735308175958079337
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Dec 2024 06:02:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FWUdQtMe;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1FE85E0007;
	Fri, 27 Dec 2024 14:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735308174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zOE63u9CPbZuvvU5nrE75xNA5fbvLRPkBf33TVxcoM0=;
	b=FWUdQtMe0RhhavcOocwUJjjI5/3UY3z6A8s2i3Lq/avpDoU+Ft7ioURLhbB4kFMrtAEH0N
	hqvcksxFEY6fngLlMBHwaGmCqwg7sK/YZm9NgMIoY8ZVMEgUCM5VIXuAvxg3E0AhXyke3g
	4x9x2DVHOu/3TzUE65NGZvwM8zZKLVLBeYbHn60Gcow0d5YqBdKi73DSBgAADIdEIPaykR
	SJGtvY8SyIEVlVKMuBqAzJQDW+2DnmxhMZI79/xup+gdnoz9PsqhTkK6XTGABY4xrMcchb
	gG8BFJnyDqN2hTBEubqzrbdg1CL/fPi08pCP4h9+pBRfw8hp1hgFsSAnoueWkw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Dec 2024 15:02:53 +0100
Message-Id: <D6MJEPSKKQHA.2M4XNPHEXN2HD@bootlin.com>
Subject: [kirkstone] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 Dec 2024 14:03:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6047

The following changes since commit 802677ea3ef7b6c1ed43c71f7f33489288c0735a=
:

  system-requirements: update list of supported distros (2024-12-16 09:18:5=
1 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs kirkstone-next

for you to fetch changes up to 6fda76e3a879e72979b3678ce583604783f178bb:

  reproducible-builds.rst: show how to build a single package (2024-12-27 1=
4:27:35 +0100)

----------------------------------------------------------------
Mikko Rapeli (1):
      reproducible-builds.rst: document OEQA_REPRODUCIBLE_TEST_TARGET and O=
EQA_REPRODUCIBLE_TEST_SSTATE_TARGETS

Trevor Gamblin (1):
      reproducible-builds.rst: show how to build a single package

 documentation/test-manual/reproducible-builds.rst | 20 +++++++++++++++----=
-
 1 file changed, 15 insertions(+), 5 deletions(-)

