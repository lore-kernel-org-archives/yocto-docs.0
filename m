Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF96C4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 15:22:24 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.4065.1670599335505611714
 for <docs@lists.yoctoproject.org>;
 Fri, 09 Dec 2022 07:22:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=B79p0SFl;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 359231BF20C;
	Fri,  9 Dec 2022 15:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670599333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dq1U0lC7gHWTkE8qvkalpkbq2z6G2Nw5ICnM3pp9U24=;
	b=B79p0SFl5jgmCSgyQgPbRe0pMAI9i0gC7uMp9Ywit7ssbUq8LNwSp7ez5tIjPOKdUzth5W
	uILY1Z/dGL9TtuHcExyBUAJx8vuwNwzBhkCdQROQMqrjAW3B1wFoFMYZZe/mS9ctLLfYqb
	HcMaH0UJ9cDoxG7q7WNbNko+RB2GoI91Rl8MSDOO//k8C0NsFHHxA4YjXT+1j9cSS+v/13
	mETKPqZO0EOITZueWeFZSgzZVK78R4meafs6n4lbKQNsy478jmkrZNlXTBOACc33Cph+9Y
	hXbOkjawPLmxtxT8yRHcehdChwiOjpcIIc0gjLQ2zmqC9L2PTGkdjtBsDijX/A==
Message-ID: <f1540530-9eeb-fa58-a60c-93e1ef8e8d40@bootlin.com>
Date: Fri, 9 Dec 2022 16:22:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: update references to release notes
Content-Language: en-US
To: quentin.schulz@theobroma-systems.com
References: <20221208151610.20370-1-michael.opdenacker@bootlin.com>
 <0238be8d-2341-45d5-dd5d-ebfd1ea1ccf1@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <0238be8d-2341-45d5-dd5d-ebfd1ea1ccf1@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 09 Dec 2022 15:22:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3539

Hi Quentin,

Thanks for the review.

Am 09.12.22 um 11:05 schrieb Quentin Schulz via lists.yoctoproject.org:
> Hi Michael,
>
> On 12/8/22 16:16, Michael Opdenacker via lists.yoctoproject.org wrote:
>>
>> +         components might cause build problems. See
>> +         :yocto_docs:`Release Information </migration-guides/>` for 
>> your
>> +         version of the Yocto Project, to find the specific 
>> components with
>> +         which the toolchain must be compatible.
>
> Where is this info located exactly?

Well, information is scarce. In the release notes, you have at least the 
glibc version which is supported, and sometimes but not systematically 
the supported gcc and binutils versions.

Shall I say "where you may find the specific components..."?
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


