Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 022BBD3C55F
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 07:34:07 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.16952.1729236840033017035
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Oct 2024 00:34:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=F7uRJcTo;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E2953E0005;
	Fri, 18 Oct 2024 07:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729236838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=hfhHEcJL11cmKXnivMtTE9NiA/iahqb7fiIqgY2MhYo=;
	b=F7uRJcToNzPfwx2kijMujKudLcRfrzV0qLGU7gwsC05eYSDYhjz1QGywGJW4HHGDXbqiTW
	ilhcDPJBKvMb+4CXpoGazyjMJIoL+OXwnPz3derGNdROLvNbMHas3hTxwiZiGqUmz0AvQN
	9NHnR6LFZNosM6pQJpufR21E+jDzR8IG5NG18980ThAla/ndJyjlYONNkfAUErYc4QFTGL
	GI6ZtieVMq+OkqmAcpsZ+9cpZlurur6S4xata9aLn0r6p4lD1OEyl+OOAM1UcRdX6QigCa
	K+6CIq1TN6UnzlfNu76EDBbijd/G4I7xY/JfSwz+I28RX8UBRWIZVXHPK/Ukxg==
Date: Fri, 18 Oct 2024 09:33:57 +0200
From: Antonin Godard <antonin.godard@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: docs@lists.yoctoproject.org
Subject: [kirkstone] Pull request
Message-ID: <cbombpwhd24gktat6dleiaq6ofepdej76ugmjw44xaxhlpbyjm@oucz53lkswz3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Oct 2024 07:34:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5533

The following changes since commit 2169a52a24ebd1906039c42632bae6c4285a3aca:

  migration-guide: add release notes for 4.0.21 (2024-09-25 17:24:14 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs kirkstone-next

for you to fetch changes up to 259fce03ffab9fb588676c1e150d999d54cf6d85:

  ref-manual: structure.rst: document missing tmp/ dirs (2024-10-17 12:02:40 +0200)

----------------------------------------------------------------
Aleksandar Nikolic (1):
      ref-manual: introduce CVE_CHECK_REPORT_PATCHED variable

Antonin Godard (4):
      ref-manual: add missing CVE_CHECK manifest variables
      ref-manual: add missing EXTERNAL_KERNEL_DEVICETREE variable
      ref-manual: add missing OPKGBUILDCMD variable
      ref-manual: structure.rst: document missing tmp/ dirs

 documentation/ref-manual/structure.rst | 35 +++++++++++++++++++++++++++--
 documentation/ref-manual/variables.rst | 40 ++++++++++++++++++++++++++++++----
 2 files changed, 69 insertions(+), 6 deletions(-)

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

