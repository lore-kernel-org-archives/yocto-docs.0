Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web08.722.1620313849377038830
 for <docs@lists.yoctoproject.org>;
 Thu, 06 May 2021 08:10:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 109.208.196.11
Received: from [10.0.0.10] (lfbn-mar-1-666-11.w109-208.abo.wanadoo.fr [109.208.196.11])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id E83EC240004;
	Thu,  6 May 2021 15:10:46 +0000 (UTC)
Cc: alistair.francis@wdc.com, liezhi.yang@windriver.com
To: YP docs mailing list <docs@lists.yoctoproject.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Subject: Questions about runqemu --help, misleading usage string?
Organization: Bootlin
Message-ID: <1ec33849-e45e-4202-7a1d-97968d2a0532@bootlin.com>
Date: Thu, 6 May 2021 17:10:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hello,

Following some experiments with the runqemu command, I'm trying to
update its documentation in the development manual, which looks
significantly out of date. However, reading the code, I think that the
usage string is misleading...

Here's the current usage:

   Usage: you can run this script with any valid combination
   of the following environment variables (in any order):
     KERNEL - the kernel image file to use
     BIOS - the bios image file to use
     ROOTFS - the rootfs image file or nfsroot directory to use
     DEVICE_TREE - the device tree blob to use
     MACHINE - the machine name (optional, autodetected from KERNEL filename if unspecified)
     Simplified QEMU command-line options can be passed with:
       nographic - disable video console
       ....

I understand that MACHINE can be recognized because of unique valid
strings corresponding to it (such as "qemuarm64"), KERNEL because its
filename and extension can be recognized, ROOTFS because it is a file
with a known extension or is a directory. I also checked that MACHINE,
KERNEL and ROOTFS can be set as environment variables.

But what about BIOS and DEVICE_TREE? It only seems to be possible to
pass them as environment variables.

If so, then the usage string is very confusing, because it gives the
impression that BIOS and DEVICE_TREE are at the same level as KERNEL,
ROOTFS and MACHINE, but unlike the latter, they cannot be passed as
command line arguments.

Shouldn't we modify "runqemu --help" so that it lists supported
environment variables and details that only KERNEL, ROOTFS and MACHINE
can be set by parsing the command line?

Thank you in advance,

Cheers,

Michael.


-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

