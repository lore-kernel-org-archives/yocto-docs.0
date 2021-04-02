Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web11.17074.1617372642455795136
 for <docs@lists.yoctoproject.org>;
 Fri, 02 Apr 2021 07:10:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: from [10.0.0.12] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id B0E9620000A;
	Fri,  2 Apr 2021 14:10:40 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 1/1] YP overview manual: style improvements
To: Khem Raj <raj.khem@gmail.com>
References: <20210330151905.13402-1-michael.opdenacker@bootlin.com>
 <20210330151905.13402-2-michael.opdenacker@bootlin.com>
 <7d197ec8-75b8-5010-bca8-f9174961609f@gmail.com>
 <81ead373-461c-b6b9-56cf-ed9fd952f553@bootlin.com>
 <CAMKF1sqNnGQwLVJuZzZqi8TaUm7+XUZsiM=6CgoRhhupnsv9uQ@mail.gmail.com>
 <16720B54D46DA7C3.28438@lists.yoctoproject.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <2805bebd-42dc-288c-9967-6faf115eddcd@bootlin.com>
Date: Fri, 2 Apr 2021 16:10:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <16720B54D46DA7C3.28438@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 4/2/21 2:47 PM, Michael Opdenacker wrote:
> Hi Khem,
>
> On 3/31/21 5:39 PM, Khem Raj wrote:
>> the left and right margins,  how do they look on epub readers for this
>> document was
>> what I was wondering.
>
> Understood. Actually, the output is almost perfect and there are no side
> margins. That's great to read the text.
> It's just some of the diagrams that would be easier to read if they were
> rendered in full width.
>
> I'll see if there's something I can do and will keep you posted.

By the way, don't hesitate to try by yourself (testers are welcome!)

sudo apt install fbreader (or any ebook reader, if you're using Debian /
Ubuntu)

cd yocto-docs/documentation
make epub
fbreader _build/epub/TheYoctoProject.epub

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

