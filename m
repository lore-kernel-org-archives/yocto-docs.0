Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 900B0C4332F
	for <webhook@archiver.kernel.org>; Tue,  5 Oct 2021 17:22:10 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web09.61.1633454529128163772
 for <docs@lists.yoctoproject.org>;
 Tue, 05 Oct 2021 10:22:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 5D47E60005;
	Tue,  5 Oct 2021 17:22:06 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] best practices regarding using WKS_FILES to reference
 multiple .wks files?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <409faf0-ab12-33b5-20d0-aa60d678ef6@crashcourse.ca>
 <20211004082421.2rgtcfjxodmkrq5e@fedora>
 <8b867c34-b494-be37-736e-cc1ed3aa0ec@crashcourse.ca>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <51e679b9-48b1-f5b6-2b75-b70f9de206e2@bootlin.com>
Date: Tue, 5 Oct 2021 19:22:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <8b867c34-b494-be37-736e-cc1ed3aa0ec@crashcourse.ca>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 05 Oct 2021 17:22:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1916

Quentin, Robert,

Thank you for the research and for the details about WKS_FILES

On 10/4/21 11:34 AM, Robert P. J. Day wrote:
> On Mon, 4 Oct 2021, Quentin Schulz wrote:
>
>> Hi Robert,
>>
>> On Sun, Oct 03, 2021 at 10:53:54AM -0400, Robert P. J. Day wrote:
>>>   quick observation -- variable glossary makes no reference to
>>> WKS_FILES variable (or a few other wic-related variables as i think i
>>> mentioned once, but that's not why we're here).
>>>
>>>   simple practice for wic is to define a single .wks file which
>>> defines all partitioning for the target. however, what i'm running
>>> into in my current project is that that single .wks file defines a
>>> couple dozen partitions, many of which are maintained by a number of
>>> different developers.
>>>
>>>   unsurprisingly, since all this content is in a single file, and
>>> those developers are regularly tweaking their partition attributes,
>>> it's a regular occurrence to have commits step on each other when
>>> merging to master.
>>>
>>>   is it reasonable (or even doable) to define a collection of
>>> reasonably independent .wks files that, collectively, define the final
>>> partitioning, and use WKS_FILES to pull them all in, thus avoiding all
>>> those merge conflicts?
>>>
>> No. WKS_FILES is not doing what you think it is.
>   story of my life. :-)
>
>> WKS_FILES is a list of candidates for the .wks file that will be used by
>> wic. First to be found (left to right) will be used.
>> c.f. https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/image_types_wic.bbclass#n57,
>> https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/image_types_wic.bbclass#n39
>>
>> What I found reading the code is that an include statement should work
>> in the wks file, c.f. https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/scripts/lib/wic/ksparser.py#n282
>>
>> I don't know if they are supposed to be in the same directory, if
>> the path after the include directive is absolute, relative and if
>> relative, to which directory.
>>
>> If that works, I think this is something that should be documented
>> :)
>   yup, that could very well be what i'm after, having the same effect.


Did you manage to try this mechanism? If you have details about how it
works, I'll be happy to add documentation for setting.
I created a bug in the meantime, so I cannot forget:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14590

Thanks in advance
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


