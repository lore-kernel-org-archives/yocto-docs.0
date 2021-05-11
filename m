Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web12.1855.1620761148834130151
 for <docs@lists.yoctoproject.org>;
 Tue, 11 May 2021 12:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 109.210.254.211
Received: from [192.168.1.25] (amontpellier-552-1-199-211.w109-210.abo.wanadoo.fr [109.210.254.211])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 7AB0220003;
	Tue, 11 May 2021 19:25:46 +0000 (UTC)
Cc: alistair.francis@wdc.com, liezhi.yang@windriver.com
Subject: Re: [docs] Questions about runqemu --help, misleading usage string?
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <1ec33849-e45e-4202-7a1d-97968d2a0532@bootlin.com>
 <85d045f13f7da6828ff86dc163a47ab36c0afaf0.camel@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <1aa26f15-1ef5-479a-04c5-df3f1474584a@bootlin.com>
Date: Tue, 11 May 2021 21:25:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <85d045f13f7da6828ff86dc163a47ab36c0afaf0.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

HI Richard,

On 5/10/21 10:57 AM, Richard Purdie wrote:
> On Thu, 2021-05-06 at 17:10 +0200, Michael Opdenacker wrote:
>> Following some experiments with the runqemu command, I'm trying to
>> update its documentation in the development manual, which looks
>> significantly out of date. However, reading the code, I think that the
>> usage string is misleading...
>>
>> Here's the current usage:
>>
>>    Usage: you can run this script with any valid combination
>>    of the following environment variables (in any order):
>>      KERNEL - the kernel image file to use
>>      BIOS - the bios image file to use
>>      ROOTFS - the rootfs image file or nfsroot directory to use
>>      DEVICE_TREE - the device tree blob to use
>>      MACHINE - the machine name (optional, autodetected from KERNEL filename if unspecified)
>>      Simplified QEMU command-line options can be passed with:
>>        nographic - disable video console
>>        ....
>>
>> I understand that MACHINE can be recognized because of unique valid
>> strings corresponding to it (such as "qemuarm64"), KERNEL because its
>> filename and extension can be recognized, ROOTFS because it is a file
>> with a known extension or is a directory. I also checked that MACHINE,
>> KERNEL and ROOTFS can be set as environment variables.
>>
>> But what about BIOS and DEVICE_TREE? It only seems to be possible to
>> pass them as environment variables.
>>
>> If so, then the usage string is very confusing, because it gives the
>> impression that BIOS and DEVICE_TREE are at the same level as KERNEL,
>> ROOTFS and MACHINE, but unlike the latter, they cannot be passed as
>> command line arguments.
>>
>> Shouldn't we modify "runqemu --help" so that it lists supported
>> environment variables and details that only KERNEL, ROOTFS and MACHINE
>> can be set by parsing the command line?
> I suspect you're right and we should fix the help output...

Many thanks for the feedback. Then I'll submit a patch to double check
this, and if it's accepted, I'll update the documentation accordingly.

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

