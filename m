Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 375C5C43602
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 11:54:01 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.67736.1782993232174522279
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Jul 2026 04:53:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=zCEbIy2A;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BF8AA4E40C24
	for <docs@lists.yoctoproject.org>; Thu,  2 Jul 2026 11:53:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8020A5FF03;
	Thu,  2 Jul 2026 11:53:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 40E9B104C951E;
	Thu,  2 Jul 2026 13:53:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782993229; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rX3YE7S59zxpoZO1siolOI2A8jyrKi0kvRGxpCVm/cw=;
	b=zCEbIy2A7ADrB7DCGwo9Unzw2TTqdqc6HcUhqhz4FIsdqlSXZRZxxPm8jqY+YUz5VKPBdZ
	/LXM4TSR9B/TJ41gbV0c9QIgKQOcJhRSEwg1tL6UPJx5Usj+ZcgN6Z9Tjlmi9140zswssA
	HDcOsKDV32VvXxBE3JdKwjnPuSZDs2daMst/BSLBNnUvodRVqK9OMAMUskYlB0fhuSFyDo
	MB2zUY9o6pmdC2KO+Gl0Sj6RjiFD2M3FNje9Q/wIrANa1RHCBJ/bvlGNgl37YG3JOmm1Bc
	fVg16WIVfeSk/g9gHXlH5QgoTkLD2+M5oZNK4CNzjifIv0zjEhQxJQi3Sa4FKA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Jul 2026 13:53:46 +0200
Message-Id: <DJO2CKOGPYNE.36ZJ8BBX7LXTZ@bootlin.com>
Cc: "YP docs mailing list" <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: [docs] [PATCH] ref_manual: add "fragments" and "templates"
 directories to structure
References: <21c2164f-ac8d-256d-f8ef-c15336fbba3e@crashcourse.ca>
 <DJHZHPQ4OTHU.G3OFW0N2RNNB@bootlin.com>
 <DJNWW8OYSBHM.O3F4TCBX4XW1@bootlin.com>
 <ec23fe13-95b2-fe47-9c94-8915341232e4@crashcourse.ca>
In-Reply-To: <ec23fe13-95b2-fe47-9c94-8915341232e4@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Jul 2026 11:54:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9999

On Thu Jul 2, 2026 at 10:40 AM CEST, Robert P. J. Day wrote:
> On Thu, 2 Jul 2026, Antonin Godard wrote:
>
>> Hi,
>>
>>
>> On Thu Jun 25, 2026 at 10:23 AM CEST, Antonin Godard wrote:
>> > Hi,
>> >
>> > On Tue Jun 23, 2026 at 7:43 PM CEST, Robert P. J. Day wrote:
>> >>
>> >> Add two new entries for the meta/conf/{fragments,templates}
>> >> directories to the structure of OE-Core metadata.
>>
>> Will you follow-up on this patch?
>
>   sorry, was there a request for a fix? not sure what you're asking
> for here.

I made comments on this patch, maybe you didn't see them:
https://lore.kernel.org/r/DJHZHPQ4OTHU.G3OFW0N2RNNB@bootlin.com

Antonin

