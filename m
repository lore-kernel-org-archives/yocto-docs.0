Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web12.11200.1618927402291467727
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Apr 2021 07:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 92.150.42.106
Received: from [10.0.0.10] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id F13CEC0002;
	Tue, 20 Apr 2021 14:03:19 +0000 (UTC)
Cc: michael.opdenacker@bootlin.com
Subject: Re: [docs] current glossary entry for SPL_BINARY is out of date
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <eacf923-3eb3-649e-ff25-cddf43a466a@crashcourse.ca>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <bcb2ef9f-157b-0c2e-921b-272ef4c338fd@bootlin.com>
Date: Tue, 20 Apr 2021 16:03:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <eacf923-3eb3-649e-ff25-cddf43a466a@crashcourse.ca>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Robert,

On 4/20/21 1:50 PM, Robert P. J. Day wrote:
>   here:
>
> https://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html#var-SPL_BINARY
>
> the alleged snippet of code from u-boot.inc no longer exists in that
> file; the code is noticeably more complicated, if someone who
> understands that stuff wants to update that glossary entry.


Thanks for reporting this! Good catch!

Indeed, the definitions have moved to meta/classes/uboot-config.bbclass,
and an example overwriting the default value can be found in
meta-yocto-bsp/conf/machine/beaglebone-yocto.conf

I'll try to propose an update. Thanks again!

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

