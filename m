Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73982EDEC05
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 13:25:33 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43860.1772717131045320704
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 05:25:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=u6A9M93h;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 28A324E42567
	for <docs@lists.yoctoproject.org>; Thu,  5 Mar 2026 13:25:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EBC025FDEB;
	Thu,  5 Mar 2026 13:25:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6EA86103698C4;
	Thu,  5 Mar 2026 14:25:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772717128; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EWBhpbinz+z3emkay0Sy/sTeg08sSRQK9iuH8oqHTxY=;
	b=u6A9M93h2VsR8d1qMBha46wFtX+PRB9Fhkty1k7qUEvhgtaW8mW5UV6gYMSoG+cfsFLIRi
	Ykm6voXeLWL/WGp/iVRaCf/wNse75e6faUYRKqU9nST9X7xD5aHwNxaPp3EWyl5SXRyLn5
	1gKoEb6vM/Xyoaf9aQPBLnpCBNt9dxYm1LcUqhNasXCtPnStP29GVF4GM6h43+UTyqxRE6
	ib9+UlYZc7FBzmc4NAHVfLHleeyYiQlqVlvRJF7psny7O/0vqKZtBJSiQIa1ePflJROeDA
	i3Bcd/r+HkMD09c1A0XfSywCPM9q2tkzGcXjcLUfe8InapRsE4DeSpODG1lhvg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 14:25:27 +0100
Message-Id: <DGUVRXLP0P0X.127C99PK1G2EA@bootlin.com>
Subject: Re: [docs] [PATCH 0/2] ref-manual/system-requirements: update
 supported and EoL lists of distros
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, "Quentin Schulz" <foss+yocto@0leil.net>,
 <docs@lists.yoctoproject.org>
References: <20260305-f43-v1-0-5dbf939b079b@cherry.de>
 <0cfaf63a-f45f-45be-9133-cc78f3d36bf5@cherry.de>
In-Reply-To: <0cfaf63a-f45f-45be-9133-cc78f3d36bf5@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Mar 2026 13:25:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9070

Hi,

On Thu Mar 5, 2026 at 2:23 PM CET, Quentin Schulz via lists.yoctoproject.or=
g wrote:
> Hi all,
>
> Please discard this series, it's a duplicate of=20
> https://lore.kernel.org/yocto-docs/20260302110446.132075-1-antonin.godard=
@bootlin.com/

I still took your patches over mine (for master), they had more details in =
their
commit messages. No lost work ;)

Antonin

