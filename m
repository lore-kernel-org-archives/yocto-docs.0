Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AD02CD98DA
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 13:05:58 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.153970.1781615149354926725
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jun 2026 06:05:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=bs8yPXjg;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 266AA1A395B;
	Tue, 16 Jun 2026 13:05:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E7CBE601A9;
	Tue, 16 Jun 2026 13:05:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 31293106C9AB4;
	Tue, 16 Jun 2026 15:05:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781615146; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nRvZgXlrrzKF/V3oS2WNt7YISzokwKNWm+dYUWkTVx4=;
	b=bs8yPXjg/3wMXVx3u7XqawCumkHQRK69/vKNFfCU6prnvuE96F5lYTtH/cjSKvRKDnMn81
	Vtw6ORZ+V4YNbRw/zbjoP/PnqUQmoQ8OPAbI/Hl7hPlARsBuk3KwZJk+zoiwwAiTo6ky6J
	LalPPuX/bai9IMQlTdRCr5ur33hsFIc6m7zfFQFq75sweMiRoispzZ360hch6MDSJ5++oe
	+PF25NaVWId3I2ylvBysBkJ04tfvL8kyEPAl/5DNvxDxxQWfRPfj2jBHY3f4tu3ST2V09z
	2WmrRVsav2NHbnCxiTFSyjx1xugBCjungTqFTb4KkSdjVGTZhgYaYXJsXsE22A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 15:05:45 +0200
Message-Id: <DJAHUYYOI4QJ.22BHB42KLA8DK@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: document "RM_WORK_EXCLUDE_ITEMS" for
 rm_work.bbclass
References: <eb6dc48a-f434-3167-ad28-d348ff1f4e77@crashcourse.ca>
 <DJAHTWUYT6NC.E9JJRMXM8L6A@bootlin.com>
In-Reply-To: <DJAHTWUYT6NC.E9JJRMXM8L6A@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Jun 2026 13:05:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9735

Hi,

On Tue Jun 16, 2026 at 3:04 PM CEST, Antonin Godard wrote:
> Hi,
>
> On Thu Jun 11, 2026 at 12:34 PM CEST, Robert P. J. Day wrote:
>>
>> Add an explanation of RM_WORK_EXCLUDE_ITEMS for rm_work.bbclass.

This variable seems to be undocumented, if you want to complete this patch,=
 you
could add it to the variable glossary.

Antonin

