Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1797C4332F
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 18:54:40 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web08.663.1666205676291423160
 for <docs@lists.yoctoproject.org>;
 Wed, 19 Oct 2022 11:54:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=c4l6RSPD;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1B71220005;
	Wed, 19 Oct 2022 18:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666205673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L889VY06lDq+XeijTEVvPWTILACwZZtqbyzIrLnUVGI=;
	b=c4l6RSPDDprgXkkynweDdOIxmHBjHuop5U1EqKVdavY9Q5+M7VvK0OD7qlMjUHH80Kp8Hi
	aC6YYLkp324x1I/L60ptH51Bz8YOMwSuP9QBFilHHUC3Y+o3L89e9/mrNEQJ0udUzXx4yp
	SLhpiams+6S3GdbIRrAs4HMejkP0ACikPmhggY7NWAwyh2sSHPp/C3/SW7Wuim7+ChHGnm
	4raJIYtTj3w8i9/ITfbH5Eim+sw7t9NUYIl/vJTrQY/3RMomxKT/tG0gM7fjPy86NKZWhQ
	6tlW3BdUKxO0udX+FJR0ctaC84c/mNuD6KLH6YDlCoLtnAROUbIZrzNSXmHbBw==
Message-ID: <7454f332-f624-cffe-1b7f-deed437bc7e7@bootlin.com>
Date: Wed, 19 Oct 2022 20:54:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs][PATCH v2] migration-guides/release-notes-4.1.rst: remove
 bitbake-layers subcommand argument
Content-Language: en-US
To: "ito@lineo.co.jp" <ito@lineo.co.jp>
References: <1ea1ac6e-315c-45d2-61c9-05197154f720@lineo.co.jp>
 <d9e810d9-d51b-51fe-e7b0-08d302dd58ec@bootlin.com>
 <fc574ad0-ee8d-1e51-6b14-068d5249142a@lineo.co.jp>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <fc574ad0-ee8d-1e51-6b14-068d5249142a@lineo.co.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 19 Oct 2022 18:54:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3379

Hi

On 10/19/22 19:14, ito@lineo.co.jp wrote:
> Hi Michael
>
> On 2022/10/20 1:26, Michael Opdenacker wrote:
>> Hi,
>>
>> On 10/19/22 18:17, ito@lineo.co.jp wrote:
>>> Hi all
>>>
>>> - remove bitbake-layers subcommand argument
>>> ---
>>>  documentation/migration-guides/release-notes-4.1.rst | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>>
>> Thank you very much for the patch!
>> However, you're missing a "Signed-off-by" field in your patch. Make 
>> sure you produce your commit with "git commit -s".
>>
>> You should also try to run the following command to get your full 
>> name as commit author when I accept your patch:
>> git config --global sendemail.from "ito@lineo.co.jp"
>>
>> Could you send a new version after doing this, please?
>> Thanks again
>> Cheers
>> Michael.
>>
>
>
> I forgot to specify the "-s" option.


That's still not enough.
Could you also run the below command before sending the patch with "git 
send-email"?

git config --global sendemail.from "ito@lineo.co.jp"

See 
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Sending_using_git-send-email

Thanks in advance
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


