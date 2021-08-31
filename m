Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.8769.1630428990659212026
 for <docs@lists.yoctoproject.org>;
 Tue, 31 Aug 2021 09:56:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 8901C60005;
	Tue, 31 Aug 2021 16:56:28 +0000 (UTC)
Cc: docs@lists.yoctoproject.org, "Robert P . J . Day" <rpjday@crashcourse.ca>
Subject: Re: [docs] [PATCH] dev-manual: correct note about virtual providers
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20210830153720.68398-1-michael.opdenacker@bootlin.com>
 <795cdbf31208231b7ab001464b7247524aa6b459.camel@linuxfoundation.org>
 <20210831094951.syxtrwtk65jziwbk@fedora>
 <c5458825b741ce1fad5737d46a0a5210cabc4548.camel@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <d0a37a8d-58d4-1675-90d5-42df39b4d956@bootlin.com>
Date: Tue, 31 Aug 2021 18:56:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <c5458825b741ce1fad5737d46a0a5210cabc4548.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Richard,

On 8/31/21 12:01 PM, Richard Purdie wrote:
>
>> How Bitbake chooses between two recipes creating a package RPROVIDES'ing the 
>> same "virtual/something" is something I have no knowledge in 
> You don't set that. It doesn't work. It isn't supported. This is what that
> manual section is trying to say. Making the manual pretend it does doesn't
> change this.
>
>> but I feel like it's something that
>> should be explained here, or at least explicit why it does not apply to
>> runtime dependencies or point to where the providers for runtime
>> dependencies are explained in the docs.
> I've explained this many times before but let me try once again.
>
> Bitbake is the interpreter of DEPENDS and PROVIDES and it can see multiple
> providers and choose between them. We have full control over that piece of the
> process.
>
> Bitbake picks the combination it thinks the user wants and then bakes it into
> the task graph. For any given configuration, one task graph should result.
>
> The runtime namespace is quite different. RPROVIDES are written into the
> packages and they are interpreted by the package managers. We have no way to
> tell the package manager that when it sees "virtual/shell", it should be bash.
> It would be something different for each package manager and at best it is badly
> supported by the distros and packaging backends (e.g. dpkg-reconfigure). We've
> therefore not gone there.

Thank you for the clarification. I got confused by the below definitions
in recipes:

poky$ git grep virtual | grep RDEPENDS
meta/recipes-bsp/grub/grub-efi_2.06.bb:RDEPENDS:${PN} = "grub-common
virtual/grub-bootconf"
meta/recipes-core/systemd/systemd-boot_249.3.bb:RDEPENDS:${PN} +=
"virtual/systemd-bootconf"

poky$ git grep virtual | grep RPROVIDES
meta/recipes-bsp/grub/grub-bootconf_1.00.bb:RPROVIDES:${PN} +=
"virtual/grub-bootconf"
meta/recipes-core/glibc/glibc-package.inc:RPROVIDES:${PN}-dev =
"eglibc-dev libc6-dev virtual-libc-dev"
meta/recipes-core/musl/musl_git.bb:RPROVIDES:${PN}-dev += "libc-dev
virtual-libc-dev"
meta/recipes-core/systemd/systemd-bootconf_1.00.bb:RPROVIDES:${PN} +=
"virtual/systemd-bootconf"

In these cases, if I understand correctly, "virtual/xxx" are just
regular strings with no special meaning that the package managers will
use, right? Should such packages avoid the use of "virtual/" RPROVIDES?

Thanks again,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

