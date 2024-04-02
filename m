Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 977F3CD1284
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 13:22:40 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.12187.1712064158394461637
 for <docs@lists.yoctoproject.org>;
 Tue, 02 Apr 2024 06:22:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XQuLuIZE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3FD83E0006;
	Tue,  2 Apr 2024 13:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712064156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LEdGjqiRnA59Swa1Yyyt/nKZ1uJ1zf8drXCtBVMZY1Y=;
	b=XQuLuIZErUXPISNCHtPZn2rSQaMR5i64rgJnHb6POLmaD+1ixR16I5VXiFUdLYEWfluVaQ
	zF3TwfaUqT1Yf5U95AVVAv22V0VlkKet6bf4I7dIB1gigwDc+IzYH0hzAeNjH7mieLyPgu
	QTz2/HDr53+lEqI4/p0lnnJZB7EQQ2ye7ZcUM7R/84lTNrhRBCzwdS/ZZGZ+WTtPkdA6aF
	XWNpovpX/PrI5OHV93S+BuQAKNEynD78sn88w0OQSveCfzxpJZU09kQux+ZmWp9Plxld7u
	gP1bpySvozC2SXvt0wEOqbaiURUog4CIAt+eR3rUa2exQ0BSi4FbFLJtwUDP9w==
Message-ID: <0d593094-f76a-4760-aeca-01098a61e979@bootlin.com>
Date: Tue, 2 Apr 2024 15:22:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] manuals: add initial sphinx-lint support
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20240330163609.1735506-1-michael.opdenacker@bootlin.com>
 <803f3abd-3c31-4b5f-a47a-63336f7bcd9c@theobroma-systems.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <803f3abd-3c31-4b5f-a47a-63336f7bcd9c@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 02 Apr 2024 13:22:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5045

Hi Quentin

On 4/2/24 at 11:59, Quentin Schulz wrote:
> Hi Michael,
>
> On 3/30/24 17:36, Michael Opdenacker via lists.yoctoproject.org wrote:
>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>> Makes it possible to catch errors not reported by sphinx,
>> such as idle spaces. After customization, this should be used
>> to enforce our syntax conventions, such as two spaces after a "-"
>> character to introduce a list item.
>>
>> Just run "make sphinx-lint".
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> ---
>>   documentation/Makefile |  3 +++
>>   documentation/README   | 14 ++++++++++++++
>>   2 files changed, 17 insertions(+)
>>
>> diff --git a/documentation/Makefile b/documentation/Makefile
>> index f3b775b3ec..cacb51c036 100644
>> --- a/documentation/Makefile
>> +++ b/documentation/Makefile
>> @@ -53,6 +53,9 @@ stylecheck:
>>       vale sync
>>       vale $(VALEOPTS) $(VALEDOCS)
>>   +sphinx-lint:
>> +    sphinx-lint
>> +
>
> I would pass $(SOURCEDIR) as argument as well.

Good idea!
I modified my branch.
Thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


