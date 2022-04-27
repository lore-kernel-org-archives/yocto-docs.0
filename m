Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BBCFC433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 07:52:36 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web08.5627.1651045946439151160
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 00:52:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VxMrMlgS;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4BF4D1BF206;
	Wed, 27 Apr 2022 07:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1651045944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J7Td20kXqJKsugU9JLSNpT38qgxy+AwpUvcx7bnhB3A=;
	b=VxMrMlgSPoUvaHZ02TC5SpWnyro/KybpB58Rv4YmEnnrWAwK08YKoRnHPDipSG06RWy4Rn
	aSeMOcDDa5ydBPAD1kurie27gM7/6KrrhKTxq7DsEa2bSU5zYagHoqnLX0AAgz3MRBkTo+
	daE8ssER+z9LXW1Dw4qNV39bgSY+gbzKGv1Ss+h4hfCUB25iG2X8zNh0KVl2h5vu92SQAQ
	I/nvqfMSsir/63KJ2n81Bqyxy1Twoi0vZHJb9ShG6WPVzIRVAQep+VfjZdINKUwfsJ9JU5
	ygKP/99glhC86reLgKlpDw/vXeb8X3TgnbUTo3rH6Z142zFaxwMAhLx4Mu3zLQ==
Message-ID: <e9fa06f7-e9a0-3357-dfc4-e8b9611a88a7@bootlin.com>
Date: Wed, 27 Apr 2022 09:52:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [yocto] [ANNOUNCEMENT] Yocto Project 4.0 is Released
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Lee Chee Yang <chee.yang.lee@intel.com>
References: 
 <DM5PR1101MB236176E376BD554365050E72B9FA9@DM5PR1101MB2361.namprd11.prod.outlook.com>
 <9d339a31-a732-3de3-53ee-45a1054d5c92@bootlin.com>
 <02ba4e468b4f2438a8ed6d59e824a0ffcc8ab619.camel@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: 
 <02ba4e468b4f2438a8ed6d59e824a0ffcc8ab619.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Apr 2022 07:52:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2875


On 4/27/22 09:51, Richard Purdie wrote:
> On Wed, 2022-04-27 at 09:41 +0200, Michael Opdenacker via lists.yoctoproject.org
> wrote:
>> Thanks for the great news!
>> Shouldn't we highlight in the documentation
>> (https://docs.yoctoproject.org/migration-guides/migration-4.0.html#release-notes-for-4-0-kirkstone)
>> that this is our new Long Term Support release?
>>
>> This would help to spread the news.
> Please. Perhaps you could help us there? :)


Sure, I'll post a patch :)
Thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


