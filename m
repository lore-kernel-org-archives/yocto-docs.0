Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC328C48BF6
	for <webhook@archiver.kernel.org>; Sat, 24 Feb 2024 16:02:03 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.21675.1708790515486730727
 for <docs@lists.yoctoproject.org>;
 Sat, 24 Feb 2024 08:01:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WfgRu0gE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E85B360008;
	Sat, 24 Feb 2024 16:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708790513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zYnh/cIOu9T6H6yBpsXgHBCJv803nhN0vTuqBF2VwhA=;
	b=WfgRu0gE/qG5jkolrqjcx2FllcaOrO0BpWXZ5YrOFfg0pDnbJ1k7W1CltWJbN+b2fZyoPK
	Rvnk7f6rHUB8rdtVdfXUJp2EA1aa/IyDDmDbegfQurtpwYExKT3tEiXAH/WEUHecqnXfIK
	CZbkEL5BVqIgyfq27zUjsUfjcI7O+inRgAqfWwgrLEK+AavBmUm9cG2Jc5nrVlRCpkDWTl
	D59BNpabi1pP+G+2DnuZQ67LwyKA60q7XzuW/5Gag2Hp+FTsUdoleISNW615ZZBuZuuASP
	qGFjs1H0qiG7/3YdKI0/OKty+j+R8NnXUd60MO3sRKRvPCDRzvMbjcskvS9GuA==
Message-ID: <8c42d162-0787-49d0-b185-e152ddb38690@bootlin.com>
Date: Sat, 24 Feb 2024 17:01:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 YP docs mailing list <docs@lists.yoctoproject.org>,
 Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: Re: [docs] [master] Pull request
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <b381569f-6a73-4efa-9eed-19119070c467@bootlin.com>
 <CADkTA4Mpr_jgh7MUYFo1vMC6amMFdOTz3yA1Bh3CJz24KYgmYw@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CADkTA4Mpr_jgh7MUYFo1vMC6amMFdOTz3yA1Bh3CJz24KYgmYw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 24 Feb 2024 16:02:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4870

Hi Bruce,

On 2/24/24 at 04:35, Bruce Ashfield wrote:
> On Fri, Feb 23, 2024 at 1:47 PM Michael Opdenacker via
> lists.yoctoproject.org
> <michael.opdenacker=bootlin.com@lists.yoctoproject.org> wrote:
>> Hi Richard,
>>
>> The following changes since commit 79530aeb97976b9a63bf04ed247f98061fc9d737:
>>
>>     release-notes-4.3: fix spacing (2024-02-05 15:22:33 +0100)
>>
>> are available in the Git repository at:
>>
>>     git://git.yoctoproject.org/yocto-docs master-next
>>
>> for you to fetch changes up to b63e6a5ac71b347961037b7ee496c2e958ad22c5:
>>
>>     dev-manual: packages: need enough free space (2024-02-23 09:50:37 +0100)
>>
>> ----------------------------------------------------------------
>> Adrian Freihofer (1):
>>         sdk-manual: extensible.rst: cover devtool ide-sdk
>>
>> Khem Raj (1):
>>         ref-manual: variables: remove PYTHON_PN
>>
>> Lee Chee Yang (1):
>>         migration-guide: add release notes for 4.3.3
>>
>> Michael Opdenacker (5):
>>         ref-manual: system-requirements: update packages to build docs
>>         ref-manual: release-process: grammar fix
>>         manuals: suppress excess use of "following" word
>>         dev-manual: packages: clarify shared PR service constraint
>>         dev-manual: packages: need enough free space
>>
>> Simone Weiß (1):
>>         dev-manual: Rephrase spdx creation
>>
>> Vyacheslav Yurkov (1):
>>         manuals: kernel-dev: Fix BSP in recipe space
> As I commented on the patch itself, the above documentation tweak
> isn't correct and should be dropped.


Oops, thanks for highlighting this.
I removed this commit from my branch.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


