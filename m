Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7643C38A02
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 13:22:06 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web09.6177.1666963314916324693
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Oct 2022 06:21:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=aPqpsUuf;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 56DA81C000B;
	Fri, 28 Oct 2022 13:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666963312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6/dUwapc0zB/UQZJNDU5LKygEa89VSCCgWhELOkNfIY=;
	b=aPqpsUufvULubH9Q7cdFtB3oz9iiXDgaQWsn4nuNTwL22KW7+pIKIajExK0fx4EZGiTtqn
	GEb8M2LacKaY2dFN4WG6Z/5Q/wk19JhkBRzqTX6QJGsK39oEQVwGF7FaXDjIxagblgHDDG
	9VsYn4rn4T8Cv8owjh6Ohz45Rw3+AJMStEbUucNO7wCF9rHCbcgJ/6MtE+HJou5soJmXKZ
	/Ao15DqkJwtNX48rUzQYEge+YGNOjyJtZmS78tqgKtdeG8ozJ4m3mJKZXinUXHkBmfSXOR
	6KehPKlIK08D0xn6HpFHIQHpzdtPlTMXFTc65eb+Ws/7Wf2TKk4V2B51BV/y9w==
Message-ID: <b7f76588-e798-3594-8be9-0f7641af0b09@bootlin.com>
Date: Fri, 28 Oct 2022 15:21:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 4/5] ref-manual: classes.rst: expand documentation
 of create-spdx class
Content-Language: en-US
To: Joshua Watt <JPEWhacker@gmail.com>
References: <20221028101939.93195-1-michael.opdenacker@bootlin.com>
 <20221028101939.93195-5-michael.opdenacker@bootlin.com>
 <CAJdd5GZu3t8JFmg8U5HUHbxfh83mV_73gyTqoMKdsEdxYWgVTA@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CAJdd5GZu3t8JFmg8U5HUHbxfh83mV_73gyTqoMKdsEdxYWgVTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Oct 2022 13:22:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3439

Hi Joshua

On 10/28/22 15:19, Joshua Watt wrote:
> On Fri, Oct 28, 2022 at 5:19 AM Michael Opdenacker via
> lists.yoctoproject.org
> <michael.opdenacker=bootlin.com@lists.yoctoproject.org> wrote:
>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> ---
>>   documentation/ref-manual/classes.rst | 20 ++++++++++++++++++--
>>   1 file changed, 18 insertions(+), 2 deletions(-)
>>
>> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
>> index cce0269b9a..621cf9c8b6 100644
>> --- a/documentation/ref-manual/classes.rst
>> +++ b/documentation/ref-manual/classes.rst
>> @@ -373,8 +373,24 @@ support.
>>   ``create-spdx.bbclass``
>>   =======================
>>
>> -The :ref:`create-spdx <ref-classes-create-spdx>` class provides support for automatically creating
>> -SPDX SBoM documents based upon image and SDK contents.
>> +The :ref:`create-spdx <ref-classes-create-spdx>` class provides support for
>> +automatically creating :term:`SPDX` :term:`SBOM` documents based upon image
>> +and SDK contents.
>> +
>> +This class is meant to be inherited globally from a configuration file::
>> +
>> +   INHERIT += "create-spdx"
>> +
>> +The output files are generated in ``tmp/deploy/spdx`` under the
>> +:term:`Build Directory`.
> Probably should mention the per-image output file here also


Ooops, of course. I forgot to change this part. Thanks!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


