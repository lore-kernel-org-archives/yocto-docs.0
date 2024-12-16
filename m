Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39004E77180
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 08:25:08 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.52130.1734337499749146848
 for <docs@lists.yoctoproject.org>;
 Mon, 16 Dec 2024 00:25:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PyIWK1TK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A9F6024000A;
	Mon, 16 Dec 2024 08:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734337497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=k84lYrszu4Gl3/AoKnL/veV+cZiMuHHmzbfScABmWDg=;
	b=PyIWK1TK580AedOn1h9TK5z6hzJZV6C8iglzBgZpicayji+rY2toDkwKfG2C5gxj19wT/R
	A5xznE8pMNC4/4EMEjyc+oWci1CV7VIVX9G5QIiX72wfzV3SXNv8mo7w3ivYtSHR/lDdN2
	h7CSQX5Bf8xSIKSHTMf9gc0a4cp4n2W40Zu39I9RA4g6A0HT0/vaGFVNDkKCghr96qzXi/
	m2XQa2y9tGwlHs+/+8oSgZr3ZuDD09MaBw4iKFNeggFsghYVmkFjp0UgpEhupz7iuRWYMG
	13b/r4OwnV/nQLvNMotJiSR2/ma+Q7902OMvsajGa3JUBrWjsucrG3QnAAwKpg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Dec 2024 09:24:57 +0100
Message-Id: <D6CZBZ6A8F3U.2TC00S0KKZ47W@bootlin.com>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 16 Dec 2024 08:25:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5931

The following changes since commit 12d0ba4f496b2b28a188d34fc36e36895f397079=
:

  migration-guides: add release notes for 4.0.23 (2024-11-29 09:03:30 +0100=
)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to 804240fa86fee63d0d2dd029d941cf14b23bd730:

  system-requirements.rst: add dependencies for pdf builds (2024-12-16 09:1=
5:37 +0100)

----------------------------------------------------------------
Antonin Godard (6):
      Gather dependencies in poky.yaml.in
      poky.yaml.in: add missing locales dependency
      poky.yaml.in: replace inkscape dependency by librsvg2-bin
      system-requirements: add fedora 39 to supported distros
      system-requirements: update list of supported distros
      system-requirements.rst: add dependencies for pdf builds

Gu=C3=A9na=C3=ABl Muller (1):
      ref-manual: use standardized method accross both ubuntu and debian fo=
r locale install

 documentation/brief-yoctoprojectqs/index.rst     |   2 +-
 documentation/poky.yaml.in                       | 264 +++++++++++++++++++=
+---
 documentation/ref-manual/system-requirements.rst |  70 +++++-
 3 files changed, 300 insertions(+), 36 deletions(-)

