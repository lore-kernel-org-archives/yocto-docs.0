Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.36289.1620058332054401466
 for <docs@lists.yoctoproject.org>;
 Mon, 03 May 2021 09:12:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 109.208.196.11
Received: from [10.0.0.19] (lfbn-mar-1-666-11.w109-208.abo.wanadoo.fr [109.208.196.11])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 43F1160009;
	Mon,  3 May 2021 16:12:08 +0000 (UTC)
Subject: Re: [docs] can all references to "lsb" in docs be removed?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <321fc26-93d6-c91b-43c4-b3f02458dfd@crashcourse.ca>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <7cd25876-56a9-9c6c-0a31-95b7900c1a3e@bootlin.com>
Date: Mon, 3 May 2021 18:12:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <321fc26-93d6-c91b-43c4-b3f02458dfd@crashcourse.ca>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi again Robert,

On 5/2/21 12:00 AM, Robert P. J. Day wrote:
>   in this case, i refer to sdk-manual, appendix-obtain.rst, where one
> reads:
>
>    The pre-built root filesystem image files follow these naming
>    conventions::
>
>       core-image-profile-arch.tar.bz2
>
>       Where:
>           profile is the filesystem image's profile:
>                     lsb, lsb-dev, lsb-sdk, minimal, minimal-dev, minimal-initramfs,
>                     sato, sato-dev, sato-sdk, sato-sdk-ptest. For information on
>                     these types of image profiles, see the "Images" chapter in
>                     the Yocto Project Reference Manual.
>
>           arch is a string representing the target architecture:
>                     beaglebone-yocto, beaglebone-yocto-lsb, edgerouter, edgerouter-lsb,
>                     genericx86, genericx86-64, genericx86-64-lsb, genericx86-lsb and qemu*.
>
>
> note the numerous references to "lsb"-related downloadable objects,
> none of which seem to exist anymore. can all those lsb entries be
> tossed?


Good catch, thanks! Actually, we're missing image types as found in
meta*/recipes*/images/*.bb. Even ref-manual/images.rst is missing such
image types.

I'll propose an update removing the outdated ones and adding the new
ones, at least in ref-manual/images.rst.

By the way, I may not keep the exhaustive list in the above text, to
keep things simple and easier to maintain. The reference to the YP Ref
Manual may be enough...

Anyway, you'll be able to review my patch :)

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

