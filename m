Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18969CDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 16:07:30 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.58410.1697818045077614708
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Oct 2023 09:07:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ld03KXgF;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F3FD36000E;
	Fri, 20 Oct 2023 16:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697818042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q4pBbJYSL43WJeEK5hb1mLK1LJjwRZhSCWd2NSRAH8A=;
	b=ld03KXgFeK/cnrWxWz6U2G1Td+HHowa6tcXQwwCss0/UFm/LWPGrFb7z68FMOaz3tTInKh
	w7D2PXMkJe0nTIN3ywzfQaAS9rTbrARN+OSi82rpZHnyjbNEoz5uHUuchuyoDnHaPyr6Fz
	UEUvvEIFUbApp8FEPgklhqomqOykD5C85lQx2DBGhX8xO84wbcNmuuXdiWbgQntDpxKJLP
	OLdxtQ+YFofPFerOFzA8uCmtaCXWjBV73zGsp5PUZydX+bZ/fvxvdsVO17Ty+wjqmCOrQt
	7/J5bkoYFgCItv7FsluJqlrw+HG1oNDoMKwARphMqXAOyzq+2cKEW5OwyMpq7Q==
Message-ID: <1cdcd3f1-781f-4301-b9d3-233ec2180f88@bootlin.com>
Date: Fri, 20 Oct 2023 18:07:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Marta Rybczynska <marta.rybczynska@syslinbit.com>,
 docs@lists.yoctoproject.org
Subject: Re: [docs] [RFC][PATCH] security-manual: initial version
Content-Language: en-US
To: Marta Rybczynska <rybczynska@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20231019094826.9503-1-rybczynska@gmail.com>
 <CAApg2=S9ConmZUMi9hTYJM1ZBCwQrehky+3NKKqva8fc_n=Qkw@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CAApg2=S9ConmZUMi9hTYJM1ZBCwQrehky+3NKKqva8fc_n=Qkw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Oct 2023 16:07:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4449

Hi Marta

On 19.10.23 at 11:51, Marta Rybczynska wrote:
> On Thu, Oct 19, 2023 at 11:48 AM Marta Rybczynska <rybczynska@gmail.com> wrote:
>> Add the initial version of the Security Manual with a
>> transcription of https://wiki.yoctoproject.org/wiki/Security_private_reporting
>>
> Here is the first version. As a separate manual, so that you can make your mind
> about the best way to follow. This is bringing only the main page we discussed,
> I'm going for more content.


Thanks for this first version.
Indeed, it confirms that it's good to start from a subchapter in the 
development manual (in a separate file anyway) as Richard suggested.

Let me give you feedback on the V2 you've just sent.
Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


