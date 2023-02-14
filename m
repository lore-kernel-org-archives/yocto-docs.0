Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A75FC61DA4
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 11:28:24 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.4419.1676374095111195974
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Feb 2023 03:28:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HWwJKd+A;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 50A0AFF806;
	Tue, 14 Feb 2023 11:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676374092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TN3t1i7JxSbfh4LAHHcw+hrM4oAk97uAXysnsOoFGfs=;
	b=HWwJKd+AvkCEdoV57rhJjTrg7K0q6Byq7oZ9r8pN+iSiLX9Y2/6g8Rtiy64bjZbihV48dS
	1vIle1X2mrBUEzTui72B5iiRSr+8SR2QCbjB/Gpd2jQlvY09JG6II9tUu5/X2K2ZE4s6eQ
	lUdglRK+AjogMJ8sHx5gi85y1QNdImPOO016cxHyv220vsKXTf5rhgQreXjuNEalhGi29r
	5JWFRuxxrhU11vV25Spi4YBafzSdZiUjuZixMhiS2cWtdKyyq03J89Hi5/AojxiKtZOt0S
	zeAsbSFCS7AFGxa01FtPgGcCQeciTxcWyESyx7gZGkF61YNAk0bN1Isd53uzLg==
Message-ID: <edca1eb7-9730-4fc5-db86-60a23c2304f9@bootlin.com>
Date: Tue, 14 Feb 2023 12:28:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Cc: Tim Orling <ticotimo@gmail.com>, Alex Kiernan <alex.kiernan@gmail.com>
Subject: Re: [docs] [PATCH] ref-manual: classes.rst: add
 python-setuptools3_rust and python_pyo3 classes
To: quentin.schulz@theobroma-systems.com, docs@lists.yoctoproject.org
References: <20230214103611.39995-1-michael.opdenacker@bootlin.com>
 <06bc0314-388f-5f8e-3463-6ad8c6e9181f@theobroma-systems.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <06bc0314-388f-5f8e-3463-6ad8c6e9181f@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Feb 2023 11:28:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3678

Hi Quentin,

Thanks for the review!

On 14.02.23 at 11:47, Quentin Schulz via lists.yoctoproject.org wrote:
> Hi Michael,
>
> On 2/14/23 11:36, Michael Opdenacker via lists.yoctoproject.org wrote:
>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> Cc: Tim Orling <ticotimo@gmail.com>
>> Cc: Alex Kiernan <alex.kiernan@gmail.com>
>> ---
>>   documentation/ref-manual/classes.rst | 23 +++++++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>
>> diff --git a/documentation/ref-manual/classes.rst 
>> b/documentation/ref-manual/classes.rst
>> index b5443c0d0a..2a20e095aa 100644
>> --- a/documentation/ref-manual/classes.rst
>> +++ b/documentation/ref-manual/classes.rst
>> @@ -2231,6 +2231,29 @@ The :ref:`ref-classes-python_poetry_core` 
>> class enables building Python modules
>>     Internally this uses the :ref:`ref-classes-python_pep517` class.
>>   +.. _ref-classes-python_pyo3:
>> +
>> +``python_pyo3``
>> +===============
>> +
>> +The :ref:`ref-classes-python_pyo3` class helps make sure that Python 
>> extensions
>> +written in Rust, built with `PyO3 
>> <https://urldefense.com/v3/__https://pyo3.rs/__;!!OOPJP91ZZw!lUmmEd0Wm4WxY9M9HTZWiO0-ZsqjgcTyYAJUyB67dTareG7k2qSXlVhMahJEHKctv3RUlbC9ktSk6nAqGyaXU0KPVeK04K2IInSKPfUkDa-AOrVgVDTq$ 
>> >`__ and
>> +:ref:`ref-classes-python-setuptools3_rust`, properly set up the 
>> environment
>> +for cross compilation.
>> +
>> +.. _ref-classes-python-setuptools3_rust:
>> +
>> +``python-setuptools3_rust``
>> +===========================
>> +
>> +The :ref:`ref-classes-python-setuptools3_rust` class enables 
>> building Python
>> +extensions implemented in Rust with `PyO3 
>> <https://urldefense.com/v3/__https://pyo3.rs/__;!!OOPJP91ZZw!lUmmEd0Wm4WxY9M9HTZWiO0-ZsqjgcTyYAJUyB67dTareG7k2qSXlVhMahJEHKctv3RUlbC9ktSk6nAqGyaXU0KPVeK04K2IInSKPfUkDa-AOrVgVDTq$ 
>> >`__, which allows
>> +to compile and distribute Python extensions written in Rust as easily
>> +as if they were written in C.
>> +
>> +This class inherits the :ref:`ref-classes-setuptools3` and
>> +:ref:`ref-classes-python_pyo3` classes.
>> +
>
> I guess one is likely to use python-setuptools3_rust more than 
> python_pyo3 no? Is python_pyo3 supposed to be an internal class?


Correct. I should mention this. I'll send a V2.
Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


