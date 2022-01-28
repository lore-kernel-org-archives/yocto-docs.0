Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC00C433F5
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 15:26:55 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web12.8523.1643383613799206515
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Jan 2022 07:26:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RXBQBkbB;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 0C23420000A;
	Fri, 28 Jan 2022 15:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1643383610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oasNs1JHaun7mse2leJhGhUjduoCoddIxtHp/VT1erE=;
	b=RXBQBkbB1Y8ijxeQ2kV3zUE14YHupNYoQk3hjhWVWbwXUDPlmE2CLW/d7BFJ4cIZuAozrq
	pCft1sDP96hOjlCtkwWw8c0FMz0eIIAmZmCrBKUZ8KM0uS0AGY/OkiKSSbO9pbLvHQMtC2
	9X8Qkp/U+C+NoRbJgE4sw0xqruNw4YMsW+/70XQlyyuicdUgqUuaExM0TLNB2LRF7is7Th
	WPQChGSYAX5RE07AxYURbF8L7QwW4tLQTfKIcaRDPL1rceAumOFn7U1AEmFjKfSYnU7pb3
	rWEHHDh8rxrnGVC3n2Sjrfm5fYddL9XfcvMpUcxkWqxRmfE29jIBd41N44JBVA==
Message-ID: <80626fac-c910-8587-29e4-a3a30cb5b130@bootlin.com>
Date: Fri, 28 Jan 2022 16:26:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [docs] [PATCH] manuals: propose https for SSTATE_MIRRORS
Content-Language: en-US
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
References: <20220126131825.1064950-1-michael.opdenacker@bootlin.com>
 <eb0beb28b2ce4ee3a342f0e8c49ab98c@axis.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <eb0beb28b2ce4ee3a342f0e8c49ab98c@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Jan 2022 15:26:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2447

Hi Peter

Thank you very much for the new review!

On 1/27/22 21:23, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: docs@lists.yoctoproject.org <docs@lists.yoctoproject.org> On Behalf Of Michael Opdenacker
>> Sent: den 26 januari 2022 14:18
>> To: docs@lists.yoctoproject.org
>> Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> Subject: [docs] [PATCH] manuals: propose https for SSTATE_MIRRORS
>>
>> Both http and https work, but https should raise fewer questions
>> from users.
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> ---
>>  documentation/brief-yoctoprojectqs/index.rst      | 4 ++--
>>  documentation/overview-manual/concepts.rst        | 2 +-
>>  documentation/ref-manual/variables.rst            | 4 ++--
>>  documentation/sdk-manual/appendix-customizing.rst | 2 +-
>>  4 files changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
>> index eaacde2d9a..b01fb4d40b 100644
>> --- a/documentation/brief-yoctoprojectqs/index.rst
>> +++ b/documentation/brief-yoctoprojectqs/index.rst
>> @@ -256,12 +256,12 @@ an entire Linux distribution, including the toolchain, from source.
>>           BB_SIGNATURE_HANDLER = "OEEquivHash"
>>           BB_HASHSERVE = "auto"
>>           BB_HASHSERVE_UPSTREAM = "typhoon.yocto.io:8687"
>> -         SSTATE_MIRRORS ?= "file://.* http://sstate.yoctoproject.org/&YOCTO_DOC_VERSION;/PATH;downloadfilename=PATH"
>> +         SSTATE_MIRRORS ?= "file://.* https://sstate.yoctoproject.org/&YOCTO_DOC_VERSION;/PATH;downloadfilename=PATH"
>>
>>        The above settings assumed the use of Yocto Project &YOCTO_DOC_VERSION;.
>>        If you are using the development version instead, set :term:`SSTATE_MIRRORS` as follows::
>>
>> -         SSTATE_MIRRORS ?= "file://.* http://sstate.yoctoproject.org/dev/PATH;downloadfilename=PATH"
>> +         SSTATE_MIRRORS ?= "file://.* https://sstate.yoctoproject.org/dev/PATH;downloadfilename=PATH"
>>
>>  #. **Start the Build:** Continue with the following command to build an OS
>>     image for the target, which is ``core-image-sato`` in this example:
>> diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
>> index 5698d93759..5cb5cb7127 100644
>> --- a/documentation/overview-manual/concepts.rst
>> +++ b/documentation/overview-manual/concepts.rst
>> @@ -1904,7 +1904,7 @@ Behind the scenes, the shared state code works by looking in
>>  shared state files. Here is an example::
>>
>>     SSTATE_MIRRORS ?= "\
>> -       file://.* http://someserver.tld/share/sstate/PATH;downloadfilename=PATH \n \
>> +       file://.* https://someserver.tld/share/sstate/PATH;downloadfilename=PATH \n \
> You might want to take this opportunity to remove the no longer 
> needed \n from all these examples.
>
>>         file://.* file:///some/local/dir/sstate/PATH"
>>
>>  .. note::
>> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
>> index adb104e202..d4f40b6929 100644
>> --- a/documentation/ref-manual/variables.rst
>> +++ b/documentation/ref-manual/variables.rst
>> @@ -7196,7 +7196,7 @@ system and gives an overview of their function and contents.
>>        following maps the local search path ``universal-4.9`` to the
>>        server-provided path server_url_sstate_path::
>>
>> -         SSTATE_MIRRORS ?= "file://universal-4.9/(.*) http://server_url_sstate_path/universal-4.8/\1 \n"
>> +         SSTATE_MIRRORS ?= "file://universal-4.9/(.*) https://server_url_sstate_path/universal-4.8/\1 \n"
> Here it is even inconsistent as this example has a \n at the 
> end of the value, which the other examples do not.


Right, good catch, but I'd rather fix this through a different commit,
possibly touching other settings as well.

I am being programmed not to mix different changes in the same commit ;-)

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


