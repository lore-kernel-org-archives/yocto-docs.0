Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC564C433F5
	for <webhook@archiver.kernel.org>; Fri, 22 Oct 2021 13:40:16 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web11.8391.1634910015124502137
 for <docs@lists.yoctoproject.org>;
 Fri, 22 Oct 2021 06:40:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 31D5B200016;
	Fri, 22 Oct 2021 13:40:12 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [docs v2] ref-manual: Update how to set a useradd password
To: Daiane Angolini <daiane.angolini@foundries.io>
References: <20211021181604.4077605-1-daiane.angolini@foundries.io>
 <a2d5ad1e-9c33-0a03-12fd-0e2f59ce9674@bootlin.com>
 <CA+HEL79Y0h-DW7QQx-7VMrv96=zXkF44jjHSVYjCmaXiMrJS8w@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <8f207096-bb97-a4c2-a02d-4ece73a946a0@bootlin.com>
Date: Fri, 22 Oct 2021 15:40:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: 
 <CA+HEL79Y0h-DW7QQx-7VMrv96=zXkF44jjHSVYjCmaXiMrJS8w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Oct 2021 13:40:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2040

Hi Daiane,

On 10/22/21 3:30 PM, Daiane Angolini wrote:
> On Fri, Oct 22, 2021 at 4:25 AM Michael Opdenacker
> <michael.opdenacker@bootlin.com> wrote:
>> Hi Daiane,
>>
>> Thank you for the patch update!
>>
>> On 10/21/21 8:16 PM, Daiane Angolini wrote:
>>> Partial fix for [YOCTO 14605]
>>>
>>> Signed-off-by: Daiane Angolini <daiane.angolini@foundries.io>
>>> ---
>>> changes since v2:
>>> - changing suggested encrypt algoritm (512->256)
>>> - resultant -> resulting
>>> - closing quote around ${PASSW}
>>>
>>>  documentation/ref-manual/classes.rst | 16 +++++++++++-----
>>>  1 file changed, 11 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
>>> index 79af45ada..8747c4b08 100644
>>> --- a/documentation/ref-manual/classes.rst
>>> +++ b/documentation/ref-manual/classes.rst
>>> @@ -590,19 +590,25 @@ Here is an example that uses this class in an image recipe::
>>>         "
>>>
>>>  Here is an example that adds two users named "tester-jim" and "tester-sue" and assigns
>>> -passwords::
>>> +passwords. First on host, create the password hash::
>>> +
>>> +   mkpasswd -m sha256crypt tester01
>>> +
>>> +The resulting hash is set to a variable and used in ``useradd`` command parameters.
>>> +Remember to escape the character ``$``::
>>>
>>>     inherit extrausers
>>> +   PASSWD = "\$6\$kt.uxYMp9O9.Yxqd\$SBaJTucixmPm7/WjFL2CjUGMHTqtw8KPK0yxpYw.tGWWHlnOwkUwZ0Pa6vR724Te/E5./V.wua4HT/h0li8Lw/"
>>
>> Shouldn't you update the hashed password too? The above is still the
>> output of "mkpasswd -m sha512crypt tester01".
> I was never sure on pasting the hash to the documentation. In fact I
> would really prefer to find a way to fake a hash
>
> Because I think it's important that the reader create a hash.
>
> What do you think if, for example, I use something such as:
>
> PASSWD = "\$X\$ABC123\$Along-Hash"
>
> I don't know, I don't like the hash copied and pasted in the example.


I understand and this makes sense. Dum users could copy the hash without
understanding it. What you propose sounds all right.
Thanks in advance for the update
Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


