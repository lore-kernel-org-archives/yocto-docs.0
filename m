Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D143FC05027
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 09:59:32 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.3416.1676627964899810870
 for <docs@lists.yoctoproject.org>;
 Fri, 17 Feb 2023 01:59:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Wccvd1H3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 09DAD240005;
	Fri, 17 Feb 2023 09:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676627962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5BnIuZ94XSERtZxbAOTYFjwlYPFi+mQHpwOXKcV6KRo=;
	b=Wccvd1H3eg6v6+gq69wx70RAH3BbfQZbJanGNf4dYSYs5KLwEYvKLW9vxb65206ec+gMNt
	jxL+MlGDPvTU0sAXXNBvHdo8++FY/aFk5oTfi3Cy2Z3jsEO7m3wPr0AKRN+WwKinPb8JLs
	rn9RgKt0cCPZ4HJ4NCMI871Y5ANu8gYWtIKzWzpk5bJigLFl7i6rWaAXwshYJHYCVeF57m
	/U0oTeZrcSkfkP+iVt542MX+z7HyDMdSeuDrbeh2tieiTbU7CDlTf6KfyfVHtDz09x21To
	5Z68aMBSlnCJu9z5ngrDnwe2eucY8F79hBhp7WnenKeza+szFDbj4dbHCe+A4A==
Message-ID: <ae0bedcd-934b-3146-1385-98285a353af2@bootlin.com>
Date: Fri, 17 Feb 2023 10:59:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Cc: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: document meson class and EXTRA_OEMESON
 variable
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
References: <20230216140811.2383941-1-michael.opdenacker@bootlin.com>
 <54ef2f3b5b1e433d8d79dfed86996338@axis.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <54ef2f3b5b1e433d8d79dfed86996338@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 17 Feb 2023 09:59:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3696

Hi Peter

Thanks for the review!

On 16.02.23 at 19:52, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: docs@lists.yoctoproject.org <docs@lists.yoctoproject.org> On Behalf Of Michael Opdenacker via lists.yoctoproject.org
>> Sent: den 16 februari 2023 15:08
>> To: docs@lists.yoctoproject.org
>> Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> Subject: [docs] [PATCH] ref-manual: document meson class and EXTRA_OEMESON variable
>>
>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> ---
>>   documentation/ref-manual/classes.rst   | 10 ++++++++++
>>   documentation/ref-manual/variables.rst | 11 +++++++++++
>>   2 files changed, 21 insertions(+)
>>
>> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
>> index b5443c0d0a..b34c966788 100644
>> --- a/documentation/ref-manual/classes.rst
>> +++ b/documentation/ref-manual/classes.rst
>> @@ -1648,6 +1648,16 @@ messages for various BitBake severity levels (i.e. ``bbplain``,
>>   This class is enabled by default since it is inherited by the :ref:`ref-classes-base`
>>   class.
>>
>> +.. _ref-classes-meson:
>> +
>> +``meson``
>> +=========
>> +
>> +The :ref:`ref-classes-meson` class allows to create recipes that build software
>> +using the `Meson <https://mesonbuild.com/>`__ build system. You can use
>> +the :term:`EXTRA_OEMESON` variable to specify additional configuration options
>> +to be passed using the ``meson`` command line.
>> +
>>   .. _ref-classes-metadata_scm:
>>
>>   ``metadata_scm``
>> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
>> index 62176f7ee8..877ea20b47 100644
>> --- a/documentation/ref-manual/variables.rst
>> +++ b/documentation/ref-manual/variables.rst
>> @@ -2528,6 +2528,17 @@ system and gives an overview of their function and contents.
>>         variable specifies additional configuration options you want to pass
>>         to the ``scons`` command line.
>>
>> +   :term:`EXTRA_OEMESON`
>> +      Additional `Meson <https://mesonbuild.com/>`__ options. See the
>> +      :ref:`ref-classes-meson` class for additional information.
>> +
>> +      In addition to standard Meson options, such options correspond
> Change "correspond" to "correspond to".


Oops, fixed.

>
>> +      `Meson build options <https://mesonbuild.com/Build-options.html>`__
>> +      defined in the ``meson_options.txt`` file in the sources to build.
>> +      Here is an example::
>> +
>> +         EXTRA_OEMESON = "-Dpython=disabled -Dvalgrind=disabled"
>> +
> You might also want to add a definition of the MESON_BUILDTYPE variable,
> which defaults to `debug` or `plain` depending on if DEBUG_BUILD is set
> or not, but can be set by the recipe.

Oh yes, that's necessary. You don't want to use EXTRA_OEMESON to pass 
"--buildtype" options, otherwise two different "--buildtype" settings 
may be passed at the same time.

I'm preparing a V2.
Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


