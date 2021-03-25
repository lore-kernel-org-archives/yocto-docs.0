Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web09.2352.1616701228155716940
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Mar 2021 12:40:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 109.210.254.211
Received: from [192.168.1.18] (amontpellier-552-1-199-211.w109-210.abo.wanadoo.fr [109.210.254.211])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 2A7F8FF806;
	Thu, 25 Mar 2021 19:40:26 +0000 (UTC)
Cc: michael.opdenacker@bootlin.com
Subject: Re: [docs] [PATCH] Quick build: checkout a branch instead of a fixed tag
To: docs@lists.yoctoproject.org
References: <166FACE5797F8BE0.19792@lists.yoctoproject.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <f61354e9-28ad-ee0b-c14a-dcb76c5c2945@bootlin.com>
Date: Thu, 25 Mar 2021 20:40:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <166FACE5797F8BE0.19792@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 3/25/21 8:34 PM, Michael Opdenacker wrote:
> - Add guidelines for choosing a release
> - Check-out a branch instead of a fixed tag
>   This way it's possible to pull release updates later


The idea was proposed by rr123 on IRC (don't know her/his e-mail address
for the "Reported-by" field).

If this makes things easier to review, see a screenshot of the result on
https://pasteboard.co/JUi4Wtd.png (by the way, if you have a better
screenshot sharing to propose, which keeps links forever too, don't
hesitate to make suggestions)

Of course, your comments and suggestions about the proposed changes are
welcome!

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

