Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.34425.1620051766083041846
 for <docs@lists.yoctoproject.org>;
 Mon, 03 May 2021 07:22:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: from [10.0.0.19] (lfbn-mar-1-666-11.w109-208.abo.wanadoo.fr [109.208.196.11])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id B25CE240012;
	Mon,  3 May 2021 14:22:42 +0000 (UTC)
Subject: Re: [docs] [PATCH] sdk-manual: various cleanups to intro.rst
To: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org,
 "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <f8833f4-34ab-98d2-ede1-881bf279ee60@crashcourse.ca>
 <BB89D528-4B9B-4E2A-808E-F679154865B2@0leil.net>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <600b21c7-859d-ae19-4d2d-19e3807a79d9@bootlin.com>
Date: Mon, 3 May 2021 16:22:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <BB89D528-4B9B-4E2A-808E-F679154865B2@0leil.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Robert,

Thanks for these improvements!

On 5/1/21 9:11 PM, Quentin Schulz wrote:
>
>> Welcome to the Yocto Project Application Development and the Extensible
>> -Software Development Kit (eSDK) manual. This manual provides information
>> -that explains how to use both the Yocto Project extensible and standard
>> +Software Development Kit (eSDK) manual. This manual
>> +explains how to use both the Yocto Project extensible and standard
>> SDKs to develop applications and images.


Actually, I caught multiple ones like this while reading the manuals
(still ongoing work). I'll submit more such improvements. Sometimes the
style is too verbose indeed.

>> The :term:`Cross-Development Toolchain` consists
>> of a cross-compiler, cross-linker, and cross-debugger that are used to
>> -develop user-space applications for targeted hardware. Additionally, for
>> -an extensible SDK, the toolchain also has built-in ``devtool``
>> +develop user-space applications for targeted hardwarer; in addition,
> Small typo here, should be hardware and not hardwarer I think.

I've fixed it and merged your patch into "master-next", with my
"Reviewed-by" note too.

Thanks to you both Robert and Quentin,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

