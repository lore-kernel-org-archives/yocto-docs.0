Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6AF8C001DE
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 18:52:44 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.43346.1691434360019137037
 for <docs@lists.yoctoproject.org>;
 Mon, 07 Aug 2023 11:52:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Xs+9/HI6;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4BD98240004;
	Mon,  7 Aug 2023 18:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691434357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I8KHlDRSM+XiitDjqYJ8UsqtqyHmdEwcGvONjcsPmLg=;
	b=Xs+9/HI6+ESw3wuPoBa4FCRAgMJ28DByzjkGhI7PAelTpEV/aFRYkxXU8LBg67DZioF934
	Wb8GvuxXEcP/0elecQyOzaGZsTSxjidXYNEmSUUvr6ldwyrHVcfjrpFpxZ75+usgXsE5m/
	cFWq8Kvnl27LGNc5sh4w0GZGuTvLuH1DWg0aPmqYO4XOURasnRs6qmH+60AYIPcRXjYjF3
	E4S/cuuzz9FUFkD+/33y98W6VMLKLTPzDi0jSkTvks/6YXwEX9AqiHAUjuxgU9mL8bxdxY
	N9Qo9yG2dzrucOOxRvW5vC8xyAy4SQvayq1UlT/CMeIlltov0HcM6IEbgxc48A==
Message-ID: <f4b8e4f5-de52-b1d6-82ae-8d32a47b5034@bootlin.com>
Date: Mon, 7 Aug 2023 20:52:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: Steve Sakoman <steve@sakoman.com>, Ross Burton <ross.burton@arm.com>,
 "Mittal, Anuj" <anuj.mittal@intel.com>
Subject: Re: [docs] [PATCH] [kirkstone] ref-manual: system-requirements:
 update supported distros
Content-Language: en-US
To: docs@lists.yoctoproject.org
References: <17792E4B854FC0AA.10230@lists.yoctoproject.org>
 <17792E82FCA10007.10230@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <17792E82FCA10007.10230@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 07 Aug 2023 18:52:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4110

Hello,

On 07.08.23 at 20:51, Michael Opdenacker via lists.yoctoproject.org wrote:
> Greetings,
>
> On 07.08.23 at 20:47, Michael Opdenacker via lists.yoctoproject.org 
> wrote:
>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>> - Update according to changes in SANITY_TESTED_DISTROS
>>    (meta-poky/conf/distro/poky.conf)
>>
>> - No longer declare as "Supported" the distributions versions
>>    which are End of Life for their vendors, as some of them
>>    (Ubuntu for example) ship updates to subscribers only,
>>    which the Yocto Project has no access to.
>>
>> - List distribution versions which were previously tested
>>    for the branch of the Yocto Project being considered
>>    (should be an empty list on master, until the next
>>    release is made).
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> ---
>>   .../ref-manual/system-requirements.rst        | 29 +++++++++++++++----
>>   1 file changed, 23 insertions(+), 6 deletions(-)
>>
>> diff --git a/documentation/ref-manual/system-requirements.rst 
>> b/documentation/ref-manual/system-requirements.rst
>> index 060a5dde02..1a05965576 100644
>> --- a/documentation/ref-manual/system-requirements.rst
>> +++ b/documentation/ref-manual/system-requirements.rst
>> @@ -34,15 +34,27 @@ and conceptual information in the 
>> :doc:`/overview-manual/index`.
>>   Supported Linux Distributions
>>   =============================
>>   -Currently, the Yocto Project is supported on the following
>> -distributions:
>> -
>> --  Ubuntu 18.04 (LTS)
>> +Currently, the &DISTRO; release ("&DISTRO_NAME;") of the Yocto 
>> Project is
>> +supported on the following distributions:
>>     -  Ubuntu 20.04 (LTS)
>>     -  Ubuntu 22.04 (LTS)
>>   +-  Debian GNU/Linux 11.x (Bullseye)
>> +
>> +-  OpenSUSE Leap 15.3
>> +
>> +The following distribution versions are still tested (being listed
>> +in :term:`SANITY_TESTED_DISTROS`), even though the organizations
>> +publishing them no longer make updates publicly available:
>> +
>> +-  Ubuntu 16.04 (LTS)
>> +
>> +-  Ubuntu 18.04 (LTS)
>> +
>> +-  Ubuntu 21.10
>> +
>>   -  Fedora 34
>>     -  Fedora 35
>> @@ -61,9 +73,14 @@ distributions:
>>     -  Debian GNU/Linux 10.x (Buster)
>>   --  Debian GNU/Linux 11.x (Bullseye)
>> +Note that the Yocto Project doesn't have access to private updates
>> +that some of these versions may have. Therefore, our testing has
>> +limited value if you have access to such updates.
>>   --  OpenSUSE Leap 15.3
>> +Finally, here are the distribution versions which were previously
>> +tested by the &DISTRO; release ("&DISTRO_NAME;"), but no longer are:
>> +
>> +*This list is currently empty*
>>     .. note::
>
>
> Are we sure SANITY_TESTED_DISTROS is up to date for Kirkstone? The 
> current list leaves us with our LTS only supported on:
>
>  *
>
>    Ubuntu 20.04 (LTS)
>
>  *
>
>    Ubuntu 22.04 (LTS)
>
>  *
>
>    Debian GNU/Linux 11.x (Bullseye)
>
>  *
>
>    OpenSUSE Leap 15.3
>
> What about these ones which are tested on master?
>
>  * Debian 12
>  * OpenSUSE Leap 15.4
>  * Fedora 37


Apologies for the ugly formatting. Shouldn't have copy/pasted from HTML.
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


