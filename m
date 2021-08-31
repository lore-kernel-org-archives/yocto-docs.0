Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web09.8767.1630429764092065224
 for <docs@lists.yoctoproject.org>;
 Tue, 31 Aug 2021 10:09:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 153FD1BF20A;
	Tue, 31 Aug 2021 17:09:15 +0000 (UTC)
Cc: docs@lists.yoctoproject.org, "Robert P . J . Day" <rpjday@crashcourse.ca>
Subject: Re: [docs] [PATCH] dev-manual: correct note about virtual providers
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20210830153720.68398-1-michael.opdenacker@bootlin.com>
 <795cdbf31208231b7ab001464b7247524aa6b459.camel@linuxfoundation.org>
 <20210831094951.syxtrwtk65jziwbk@fedora>
 <c5458825b741ce1fad5737d46a0a5210cabc4548.camel@linuxfoundation.org>
 <d0a37a8d-58d4-1675-90d5-42df39b4d956@bootlin.com>
 <d4b3543f48d2bb3704e8597aee0d1f82d09e9483.camel@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <c0a5dea9-d5eb-1e0f-7c95-a27a20390db3@bootlin.com>
Date: Tue, 31 Aug 2021 19:09:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d4b3543f48d2bb3704e8597aee0d1f82d09e9483.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 8/31/21 6:58 PM, Richard Purdie wrote:
>
>> Thank you for the clarification. I got confused by the below definitions
>> in recipes:
>>
>> poky$ git grep virtual | grep RDEPENDS
>> meta/recipes-bsp/grub/grub-efi_2.06.bb:RDEPENDS:${PN} = "grub-common
>> virtual/grub-bootconf"
>> meta/recipes-core/systemd/systemd-boot_249.3.bb:RDEPENDS:${PN} +=
>> "virtual/systemd-bootconf"
>>
>> poky$ git grep virtual | grep RPROVIDES
>> meta/recipes-bsp/grub/grub-bootconf_1.00.bb:RPROVIDES:${PN} +=
>> "virtual/grub-bootconf"
>> meta/recipes-core/glibc/glibc-package.inc:RPROVIDES:${PN}-dev =
>> "eglibc-dev libc6-dev virtual-libc-dev"
>> meta/recipes-core/musl/musl_git.bb:RPROVIDES:${PN}-dev += "libc-dev
>> virtual-libc-dev"
>> meta/recipes-core/systemd/systemd-bootconf_1.00.bb:RPROVIDES:${PN} +=
>> "virtual/systemd-bootconf"
>>
>> In these cases, if I understand correctly, "virtual/xxx" are just
>> regular strings with no special meaning that the package managers will
>> use, right? Should such packages avoid the use of "virtual/" RPROVIDES?
> The virtual/xxx should not be there and yes, are just strings.


Thanks for confirming this. What about replacing then "virtual/" by
"virtual-" as already done in "virtual-libc-dev" above?

Cheers

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

