Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3698DC4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 15:06:44 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.3654.1670598394218227752
 for <docs@lists.yoctoproject.org>;
 Fri, 09 Dec 2022 07:06:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=aP0+Xs4C;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9D018FF811;
	Fri,  9 Dec 2022 15:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670598391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TKo1jLbFfhvjyJVRt9cAcuOnTSjFAxlUVZh/+7GANhk=;
	b=aP0+Xs4CC1nJTM0pHkiQ50MPUvliH0sVwQ5ReEgnn4FhAaJ6Yp2rUVCovHnbSgFHjjPSwK
	EXYzbY/fg/IT13q18tyrQdpqvYgJxH8cgH22BI+3MvD0m+93+Q8Wbk9M8aVv+HqGMP+wGC
	fY7/tohfBb0mwVg4QU87cp95TF//Zjx4tMLvU6le2GE2hTq/OVZVewr2kivIB5lHFp00Z8
	I00GJajJn7eQNv75Q3Mir2KqEhFjRvL/L/AyOkre49pQht/PqFEvPkex73ELAFmm/o28KW
	2csuVDr4koigRmitcaxSpbdqwMzY9kXoNM7dN8xkPPbiBA+m6G7V88wI0FU/SA==
Message-ID: <7445957e-1223-4977-79bf-ccd9bd35071e@bootlin.com>
Date: Fri, 9 Dec 2022 16:06:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] manual: improve documentation about using external
 toolchains
Content-Language: en-US
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20221208181350.39601-1-michael.opdenacker@bootlin.com>
 <bc43c280-058f-04a6-12a4-986c5ccb88d8@theobroma-systems.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <bc43c280-058f-04a6-12a4-986c5ccb88d8@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 09 Dec 2022 15:06:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3538

Hi Quentin,

Thanks for the review!

Am 09.12.22 um 11:51 schrieb Quentin Schulz:
> We could still keep this section in the FAQ and redirect to the 
> documentation/dev-manual/external-toolchain.rst manual, but no strong 
> opinion on this.


Agreed, it makes sense. I did just that.

>
>>   Why do I get chmod permission issues?
>>   -------------------------------------
>>   diff --git a/documentation/ref-manual/variables.rst 
>> b/documentation/ref-manual/variables.rst
>> index 776c8a2792..0586760a48 100644
>> --- a/documentation/ref-manual/variables.rst
>> +++ b/documentation/ref-manual/variables.rst
>> @@ -2420,6 +2420,12 @@ system and gives an overview of their function 
>> and contents.
>>         :ref:`kernel-yocto <ref-classes-kernel-yocto>` class in
>>         ``meta/classes-recipe`` to see how the variable is used.
>>   +   :term:`EXTERNAL_TOOLCHAIN`
>> +      When you intend to use an
>> +      :ref:`external toolchain 
>> <dev-manual/external-toolchain:optionally using an external toolchain>`,
>> +      this variable allows to specify the directory in which this 
>> toolchain was
>> +      installed.
>> +
>>      :term:`EXTERNALSRC`
>>         When inheriting the :ref:`externalsrc <ref-classes-externalsrc>`
>>         class, this variable points to the source tree, which is 
>> outside of
>> @@ -8481,16 +8487,20 @@ system and gives an overview of their 
>> function and contents.
>> https://urldefense.com/v3/__https://github.com/MentorEmbedded/meta-sourcery/__;!!OOPJP91ZZw!iVny7D_tgmsS9YRYu1nh93Aa322nmitTKLdI-iCobzRfKZxvczJxvv2fCJHvt2hjcknk0cDnc2dayQei4TR8zLinoTpD_oozAcyIkgsHUsxfwCNbs7B8$ 
>> .
>>           The layer's ``README`` file contains information on how to 
>> use the
>> -      Sourcery G++ Toolchain as an external toolchain. In summary, 
>> you must
>> -      be sure to add the layer to your ``bblayers.conf`` file in 
>> front of
>> -      the ``meta`` layer and then set the ``EXTERNAL_TOOLCHAIN`` 
>> variable
>> -      in your ``local.conf`` file to the location in which you 
>> installed
>> -      the toolchain.
>> +      Sourcery G++ Toolchain as an external toolchain. You will have to
>> +      add the layer to your ``bblayers.conf`` file and then set the
>> +      :term:`EXTERNAL_TOOLCHAIN` variable in your ``local.conf`` 
>> file to
>> +      the location in which you installed the toolchain.
>
> s/in which you installed/of/ ?
> s/in which/where/ ?
>
> "the location in which" doesn't sound good to my non-native ears.

OK, I went for "of", which indeed is sufficient.
Thanks for correcting me on this!
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


