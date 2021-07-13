Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web08.2391.1626171107626361421
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jul 2021 03:11:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id C2C48FF80F;
	Tue, 13 Jul 2021 10:11:43 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Paul Eggleton <bluelightning@bluelightning.org>,
 Nicolas Dechesne <nicolas.dechesne@linaro.org>,
 Quentin Schulz <foss@0leil.net>
Subject: Re: [docs] [yocto-docs][PATCH v2] ref-manual: added new section library-functions
To: Milan Shah <mshah@mvista.com>, Randy MacLeod <randy.macleod@windriver.com>
References: <1615787270-17662-1-git-send-email-mshah@mvista.com>
 <f81a94d1-9903-0799-862c-de5ea0b5da73@windriver.com>
 <CA+=qD9O79RYoq68WFLp2Xibqcu82SwJJkCKYbmBgW8cqXrxFHQ@mail.gmail.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <977691f4-c55c-ef5d-2160-c245fe445331@bootlin.com>
Date: Tue, 13 Jul 2021 12:11:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CA+=qD9O79RYoq68WFLp2Xibqcu82SwJJkCKYbmBgW8cqXrxFHQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Milan,

On 7/9/21 7:26 AM, Milan Shah wrote:
> Hello All,
>
> My Patch-v2 has not been reviewed yet. Looking forward to see some
> updates on it.
> https://lists.yoctoproject.org/g/docs/message/903
> <https://lists.yoctoproject.org/g/docs/message/903>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=9612
> <https://bugzilla.yoctoproject.org/show_bug.cgi?id=9612>


My apologies for the very late reply !

However, I don't see that you took Quentin and Nicolas' final remarks
into account. Rather than copying documentation from the source code, it
would be much cheaper and more reliable to extract such documentation
from comments in the sources. This seems like the way to go.

Did I miss anything?

Anyway, I agree that such information would be useful to include in the
BitBake manual.

Kind regards,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

