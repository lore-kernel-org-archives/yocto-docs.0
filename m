Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web08.36.1617118063998603328
 for <docs@lists.yoctoproject.org>;
 Tue, 30 Mar 2021 08:27:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 92.150.42.106
Received: from [10.0.0.8] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 4F62B1BF20C
	for <docs@lists.yoctoproject.org>; Tue, 30 Mar 2021 15:27:42 +0000 (UTC)
Subject: Re: [docs] [PATCH 0/1] YP overview manual: style improvements
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
References: <167127D8F46CF10E.18414@lists.yoctoproject.org>
Organization: Bootlin
Message-ID: <75714db2-fbb9-eded-0b60-a08fbe346063@bootlin.com>
Date: Tue, 30 Mar 2021 17:27:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <167127D8F46CF10E.18414@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hello,

On 3/30/21 5:19 PM, Michael Opdenacker wrote:
> Thanks in advance for your reviews!


Sorry, I missed again! When I sent the e-mail to myself, both the cover
letter and patch were on the same thread.

But, when I sent to the list, I lost that. Here's the command I used (I
referred to "man git-send-email"):

git send-email --compose --thread --no-chain-reply --to docs@lists.yoctoproject.org 0001-YP-overview-manual-style-improvements.patch

What would you do to have both messages in the same thread? I mean,
without having to run "git send-email" twice, the second time with
"--in-reply-to=".

Apologies again for the noise...

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

