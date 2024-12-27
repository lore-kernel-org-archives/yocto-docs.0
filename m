Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EC8BE77192
	for <webhook@archiver.kernel.org>; Fri, 27 Dec 2024 14:03:01 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.12892.1735308176767501639
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Dec 2024 06:02:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SDWhzQ2g;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1569F1BF206;
	Fri, 27 Dec 2024 14:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735308174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wn1JqmhHY7hWWmK5rEI9rHBZ2B2t9QFLu+tUnZ2Yg4g=;
	b=SDWhzQ2gRvBOQ8TjkfmSM5LL8KhV/MnvpBEmAdq/vWcEI7O/h8r7roRqn8iqX37KPbBzhS
	W9yTEb2aWz2ptOoXAyg16XIRidD/2z8O+O6dc6gtkf+R1e6UA1BOq9nFnysm5nfQahADSn
	KgyTLAeyAcVvKCXPPJiwSx1QXWtmQsrOUndMo+6ZmMXcFjVm0NsbQSTkgdaCpoOql43ldC
	w7Dy6ZEVLncX7HwYAprgF8helKhWXcf+4tPegJJ0D7/gqDvqJtRDBL3iEPkizznrOH/Zjs
	3mWpm53yaYy8QS+VSDlRCFg5BZeEKfCCgfUv8oJFUpc7bFF6EqQ3MVOloeNRRA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Dec 2024 15:02:53 +0100
Message-Id: <D6MJEPPVCUUG.YY7J8WLDWDK4@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 Dec 2024 14:03:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6049

The following changes since commit a1e4f18af6b0b10cece83c53ebb14052a0b94314=
:

  dev-manual/bmaptool.rst: simplify and fix instructions (2024-12-20 09:27:=
12 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to 6430ed0572ca5a6e10629aa27a05d4b262e87548:

  reproducible-builds.rst: show how to build a single package (2024-12-27 1=
4:22:35 +0100)

----------------------------------------------------------------
Trevor Gamblin (1):
      reproducible-builds.rst: show how to build a single package

 documentation/test-manual/reproducible-builds.rst | 22 +++++++++++++++----=
---
 1 file changed, 15 insertions(+), 7 deletions(-)

