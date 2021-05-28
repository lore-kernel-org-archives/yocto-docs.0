Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web10.11022.1622220350325882199
 for <docs@lists.yoctoproject.org>;
 Fri, 28 May 2021 09:45:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 1EB6420000B;
	Fri, 28 May 2021 16:45:47 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: add glossary entry for NON_MULTILIB_RECIPES
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 Quentin Schulz <quentin.schulz@streamunlimited.com>
References: <4483651b-7799-71b4-69e1-8ba43b933821@crashcourse.ca>
 <20210527104920.7gdkqgjqdinckr3s@qschulz>
 <3a2a7d34-8e9d-18b-8de4-1bc1e3d828c@crashcourse.ca>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <ceaed9f0-f0a2-9156-f3f2-f5a5c835cab7@bootlin.com>
Date: Fri, 28 May 2021 18:45:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <3a2a7d34-8e9d-18b-8de4-1bc1e3d828c@crashcourse.ca>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Robert, Quentin,

On 5/27/21 2:01 PM, Robert P. J. Day wrote:
> On Thu, 27 May 2021, Quentin Schulz wrote:
>
>> On Sun, May 23, 2021 at 07:00:57AM -0400, Robert P. J. Day wrote:
>>> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>>>
>>> ---
>>>
>>> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
>>> index df6413b68..7f9182a5a 100644
>>> --- a/documentation/ref-manual/variables.rst
>>> +++ b/documentation/ref-manual/variables.rst
>>> @@ -4803,6 +4803,13 @@ system and gives an overview of their function and contents.
>>>           FILES_${PN}-dbg = "/usr/src/debug/"
>>>           FILES_${QT_BASE_NAME}-demos-doc = "${docdir}/${QT_DIR_NAME}/qch/qt.qch"
>>>
>>> +   :term:`NON_MULTILIB_RECIPES`
>>> +      A list of recipes that should not be built for multilib. OE-Core's
>>> +      ``multilib.conf`` file defines a reasonable starting point for this
>>> +      list with::
>>> +
>>> +         NON_MULTILIB_RECIPES = "grub grub-efi make-mod-scripts ovmf u-boot"
>>> +
>> I'm surprised the kernel isn't part of this list? I would have assumed
>> it would be there.
>   possibly ... i'm just reproducing the current state of affairs.

Right.

Thanks for the patch and review.
I merged it into "master-next".

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

