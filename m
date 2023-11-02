Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AE45C4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 15:17:39 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.33607.1698938249999293253
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Nov 2023 08:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KnEE12I7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7777FE0010;
	Thu,  2 Nov 2023 15:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698938248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RhSwwGiQ8zvTFlckdQUrVqbrcD4GqG1lWEAafegeQpk=;
	b=KnEE12I7dR1sJ8PAGZ5/RwdXM1OR108jTFRhzsJm795AoP+zh3Bc5BQV8gh42DUT3/JLDo
	df7ybUyxk6jzVNglR681SDx8oRrDpo3cIx9LFD9seFvfp/on0ex4GQL7WTdf88j7BgI6mM
	qjtc5f22V/+GuP9u0uX1YhkpjkG5Pjx7qVa/VijkSQpYoigMqTd1xabqt39h7XykOWJiFF
	DUKUf3QHAwwzRreBwv+gqVAXjjTplEhpSWawmy4ibhseluTDnTCre1+AmCAcxxWwYPikiL
	BwqtwBXCDhd2qolDgA8QmZuHTkdZH7WeaMGWj+pqT82nDnMmp4WHrj3RMYITeA==
Message-ID: <c7a1127a-e3d8-4818-8edb-a1ff87aa79b6@bootlin.com>
Date: Thu, 2 Nov 2023 16:17:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual: document KERNEL_LOCALVERSION
Content-Language: en-US
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 =?UTF-8?Q?Ulrich_=C3=96lmann?= <u.oelmann@pengutronix.de>
References: <20231027092935.1601588-1-michael.opdenacker@bootlin.com>
 <6rjzr0tr2h.fsf@pengutronix.de>
 <44d9c528-fceb-928-421f-e8b26cb1f3@crashcourse.ca>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <44d9c528-fceb-928-421f-e8b26cb1f3@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Nov 2023 15:17:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4575


On 02.11.23 at 15:52, Robert P. J. Day wrote:
> On Thu, 2 Nov 2023, Ulrich Ölmann wrote:
>
>> Hi Michael,
>>
>> just a small typo, otherwise a good description.
>>
>> On Fri, Oct 27 2023 at 11:29 +0200, "Michael Opdenacker via lists.yoctoproject.org" <michael.opdenacker=bootlin.com@lists.yoctoproject.org> wrote:
>>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>>
>>> Introduced by
>>> https://git.yoctoproject.org/poky/commit/?id=66ed174ccdf7a89cb998f503cc6b631e2d1adcc0
>>>
>>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>> CC: Bruce Ashfield <bruce.ashfield@gmail.com>
>>> ---
>>>   documentation/ref-manual/variables.rst | 10 ++++++++++
>>>   1 file changed, 10 insertions(+)
>>>
>>> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
>>> index 03234d3f78..771eb91af6 100644
>>> --- a/documentation/ref-manual/variables.rst
>>> +++ b/documentation/ref-manual/variables.rst
>>> @@ -2485,6 +2485,16 @@ system and gives an overview of their function and contents.
>>>         external tools. See the :ref:`ref-classes-kernel-yocto` class in
>>>         ``meta/classes-recipe`` to see how the variable is used.
>>>
>>> +   :term:`KERNEL_LOCALVERSION`
>>> +      This variable allows to appends a string to the version
>> s/appends/append/
>    i don't like that variation either ... why not just "allows
> appending". or, better yet, "supports appending"?

Oops, too late, as the commit already made it into "master".
Maybe you could send a wider patch replacing instances of "allows to" by 
something you think sounds better.

Thanks!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


