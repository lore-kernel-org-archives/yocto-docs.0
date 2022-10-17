Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66509C433FE
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 09:04:12 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.38787.1665997448843427930
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Oct 2022 02:04:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UgbjhugT;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id AED152000B;
	Mon, 17 Oct 2022 09:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665997447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hwdOMfuZvEm9Fgic16uq5YuR+Znxkn/9gW7BT9Gm8Q8=;
	b=UgbjhugT4n5K5OeY56luSE2Ed15JNBkdFjJT2dlpGls+E5leaV7IV33ZL6qRtFgaTle172
	YTRQFWu4l+A/PzrWQ2NEkDj2tqsM2zjH1kQsL0GyCmDa6DaUPjNZMbodcWRLKev39v4460
	SiER9xMVeIAgHOpWLc/vadj6od59N5iSI2lhCB+l1WRjr+5VBCSnZr8Zxq0lSLv2mWSQ6I
	sPtuuTzeTKsAp1LO17ItSrTnf2ylJyrzeAXUhjZwyA6cdyzTkBvmewryD6+ZPI9oj4vt6K
	ug8k+kNjYM14RIXiHxPi4BGKG1eeOU4Qm/1NZCrOAx3eNq93+AcnTNx8pmTWOA==
Message-ID: <86693f11-af9b-9079-67aa-104cc95da531@bootlin.com>
Date: Mon, 17 Oct 2022 11:04:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 08/34] ref-manual: sync supported distro list with
 code
Content-Language: en-US
To: Paul Eggleton <bluelightning@bluelightning.org>
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
 <4b9ba55459a5f02d5f72aa907b5cee128558f557.1665392835.git.paul.eggleton@linux.microsoft.com>
 <733d013c-5e75-0cf4-d71b-2ae2e56d6fa7@bootlin.com> <2651293.mvXUDI8C0e@linc>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <2651293.mvXUDI8C0e@linc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Oct 2022 09:04:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3368


On 10/16/22 21:16, Paul Eggleton wrote:
> On Tuesday, 11 October 2022 21:20:37 NZDT Michael Opdenacker via
> lists.yoctoproject.org wrote:
>> Hi Paul,
>>
>> On 10/10/22 11:23, Paul Eggleton wrote:
>>> From: Paul Eggleton <paul.eggleton@microsoft.com>
>>>
>>> We were missing Ubuntu 21.10.
>>>
>>> Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
>>> ---
>>>
>>>    documentation/ref-manual/system-requirements.rst | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git a/documentation/ref-manual/system-requirements.rst
>>> b/documentation/ref-manual/system-requirements.rst index acc97c9..014c9a5
>>> 100644
>>> --- a/documentation/ref-manual/system-requirements.rst
>>> +++ b/documentation/ref-manual/system-requirements.rst
>>>
>>> @@ -41,6 +41,8 @@ distributions:
>>>    -  Ubuntu 20.04 (LTS)
>>>
>>> +-  Ubuntu 21.10
>>> +
>>>
>>>    -  Ubuntu 22.04 (LTS)
>> Is the code right though? 21.10 is no longer updated by Canonical and
>> 22.04 is more recent. What about stopping testing it instead?
> Fine by me, I just figured the documentation should match what is in
> SANITY_TESTED_DISTROS; in this case perhaps the latter needs updating.


Done (at least proposed): 
https://lists.yoctoproject.org/g/poky/message/12908
Thanks
Michael

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


