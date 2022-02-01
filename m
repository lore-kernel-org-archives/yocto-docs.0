Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EC66C433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Feb 2022 16:48:34 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.51512.1643734112113222726
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Feb 2022 08:48:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=e0uecKml;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 28342240006;
	Tue,  1 Feb 2022 16:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1643734110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1jOvoO2HFVCa3J9Qx9lf5n79Kc99aGmdBF99uME2L8I=;
	b=e0uecKml341bs9X794Xge7t8E0CdWPCsUAkFkl84+YPik+S9tSf3UP/sWjaIzRYyHrIdRI
	QGSjaLwYvz9hfFdCtvDvnIFk9oKJOjeva4KszzsrCG3NiBFnvnstHNHvxH8qjAvKSh3woj
	RNhFE9SH9avtvQ1yrQjmMKcyR7qm1wYzl6GqPVRlgXIe7JtUJvWYEGBn1KmqWsXwZ5GkVj
	ndsQvGNDV9NwN5mCx1KyVBBgjhxZdj+vLWD6rkloDzU5oZYxHFhG3i/QNwOQ3G4RuptA7P
	WO+YG41Ya2vfXZEzuYX/4u0von0kFCCDmqAJjjHCcLAAFiMd6EFN1TjXAPLPQw==
Message-ID: <c0cb6fba-4c65-48cf-c406-69be7f9ae0df@bootlin.com>
Date: Tue, 1 Feb 2022 17:48:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [docs] [PATCH] ref-manual: add usage details about ccache.bbclass
Content-Language: en-US
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
References: <16CE7A27ABB38F4D.29885@lists.yoctoproject.org>
 <b2479910-b50c-2f06-0290-72cb953f0963@bootlin.com>
 <2d54f0a86eed433f95fb22b03ea8117c@axis.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <2d54f0a86eed433f95fb22b03ea8117c@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 01 Feb 2022 16:48:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2457

Hi Peter,

On 1/28/22 20:25, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: docs@lists.yoctoproject.org <docs@lists.yoctoproject.org> On Behalf Of Michael Opdenacker via lists.yoctoproject.org
>> Sent: den 28 januari 2022 16:56
>> To: docs@lists.yoctoproject.org
>> Subject: Re: [docs] [PATCH] ref-manual: add usage details about ccache.bbclass
>>
>> On 1/28/22 16:53, Michael Opdenacker via lists.yoctoproject.org wrote:
>>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>> ---
>>>  documentation/ref-manual/classes.rst | 13 +++++++++----
>>>  1 file changed, 9 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
>>> index d9065b3619..949217bf42 100644
>>> --- a/documentation/ref-manual/classes.rst
>>> +++ b/documentation/ref-manual/classes.rst
>>> @@ -274,10 +274,15 @@ sstate re-use. In order to function, this class requires the
>>>
>>>  The ``ccache`` class enables the C/C++ Compiler Cache for the build.
>>>  This class is used to give a minor performance boost during the build.
>>> -However, using the class can lead to unexpected side-effects. Thus, it
>>> -is recommended that you do not use this class. See
>>> -https://ccache.samba.org/ for information on the C/C++ Compiler
>>> -Cache.
>>> +
>>> +See https://ccache.samba.org/ for information on the C/C++ Compiler
>>> +Cache, and the :oe_git:`ccache.bbclass </openembedded-core/tree/meta/classes/ccache.bbclass>`
>>> +file for details about how to enable this mechanism in your configuration
>>> +file, how to disable it for specific recipes, and how to share ``ccache``
>>> +files between builds.
>>> +
>>> +However, using the class can lead to unexpected side-effects. Thus, using
>>> +this class is not recommended.
> It would probably be a good idea then to explain what those 
> unexpected side-effects are, or you leave the reader hanging. 
> That way it easier to make an educated choice whether using 
> the class is a good idea or not.


Thanks for the review. Indeed, I was wondering too. If anyone has
details about such issues, I'll be happy to mention them in the
documentation.

Thanks in advance
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


