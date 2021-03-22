Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.14094.1616424417917392423
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Mar 2021 07:46:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 92.150.42.106
Received: from [10.0.0.8] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id B507DFF803;
	Mon, 22 Mar 2021 14:46:55 +0000 (UTC)
Cc: michael.opdenacker@bootlin.com
Subject: Re: [docs] [PATCH 1/1] Update documentation URL
To: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
References: <20210319181321.45758-1-michael.opdenacker@bootlin.com>
 <20210319181321.45758-2-michael.opdenacker@bootlin.com>
 <099D8738-5946-4A6B-8A31-C575E7B77F4E@0leil.net>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <9aeeb509-7a46-a761-2782-7d28dc0199c0@bootlin.com>
Date: Mon, 22 Mar 2021 15:46:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <099D8738-5946-4A6B-8A31-C575E7B77F4E@0leil.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Quentin,

Nice to hear from you again, and thanks for your help!

> Please use :yocto_docs: extlink here. IIRC, :yocto_docs:`/` should do just fine.


Oops, actually, this doesn't work here, as we are in a "code-block". The
patch didn't give you enough context for you to see this.

>
> You can find the list of our extlinks in documentation/conf.py. They can be used in rST files (so your change in README is fine).


This is very good to know, thanks!

Apparently, these shortcuts don't work in the toplevel index.rst file
though... That was tempting to use them there too. Anyway, I'll use them
in normal documentation.


>
>>       For more information about OpenEmbedded see their website:
>>           http://www.openembedded.org
> And a free patch here with :oe_home:`/` :)


Same here, unfortunately.

So, I believe my patch can be taken as is...

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

