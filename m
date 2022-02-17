Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82B9EC433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 15:18:31 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web08.1105.1645111110416430380
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Feb 2022 07:18:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XxXODd+P;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3C8FF200002;
	Thu, 17 Feb 2022 15:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1645111108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V09OsblvovqKNZUAN7705hwFGbfrDchAwGVA4FNcWeo=;
	b=XxXODd+PSMv9kx594XxNJ+JyUYfRrsu0M3srm7ShXQ0/APVi03grvB64ogC77fIds4E1wJ
	Qo90zbPODN/FWX3ECe/E01ha/L+siCneTr02nNQsMot4d0DRtP4yQJ8r8ljszDNLM5lXwu
	e1zKnyPQJ/Ud9Q5mkuY7Yxs/7FKHoUQPK4z0qymVXfUhHuvlM9Ir8TE/v6s8j9wDjDO2RC
	qIVQTBJgCp0txbyVFaxtCQyi1pCY8oopM2MYuOr/I4BzXgGZvV0q82eB8vTwtCVL2jAm5P
	5p8u5HG/UumU+LCbtGPaTLgU7+NwssIXt1kMXcspGb6m5tZXLKkmzpBp3at1Ug==
Message-ID: <49610148-8225-6927-4a42-1a0f605c296e@bootlin.com>
Date: Thu, 17 Feb 2022 16:18:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Cc: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
Subject: Re: [docs] [yocto-docs][dunfell 1/1] documentation: update for 3.1.14
 release
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>
References: <cover.1642715781.git.steve@sakoman.com>
 <e94c4c7d7103b8af5a332e53afb1e0c5d848695b.1642715781.git.steve@sakoman.com>
 <940d6bfc-7f86-4bf6-550d-af095673c289@bootlin.com>
 <CAOSpxdaSoceJ1Fr8Yb2rML8wqMqbNJEk-E=cs75nW-sOtqrQMg@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: 
 <CAOSpxdaSoceJ1Fr8Yb2rML8wqMqbNJEk-E=cs75nW-sOtqrQMg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 17 Feb 2022 15:18:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2473


On 2/17/22 16:09, Steve Sakoman wrote:
> On Fri, Jan 21, 2022 at 12:06 AM Michael Opdenacker
> <michael.opdenacker@bootlin.com> wrote:
>>
>> On 1/20/22 10:57 PM, Steve Sakoman wrote:
>>> Signed-off-by: Steve Sakoman <steve@sakoman.com>
>>> ---
>>>  documentation/conf.py                    | 2 +-
>>>  documentation/poky.yaml                  | 8 ++++----
>>>  documentation/releases.rst               | 1 +
>>>  documentation/sphinx-static/switchers.js | 2 +-
>>>  4 files changed, 7 insertions(+), 6 deletions(-)
>> Thanks Steve.
>> I'll apply the patch when the release is out.
> Just a reminder, release is out now!


Perfect timing, I was taking care of your patch at the same time :-)
Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


