Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web09.21557.1617024653536889208
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Mar 2021 06:30:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 92.150.42.106
Received: from [10.0.0.12] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id CC0564000F
	for <docs@lists.yoctoproject.org>; Mon, 29 Mar 2021 13:30:51 +0000 (UTC)
Subject: Re: [docs] [PATCH] documentation/README minor improvements
To: docs@lists.yoctoproject.org
References: <166EB9A9DDFCFF90.14702@lists.yoctoproject.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <51d4ea3d-3c4b-0c57-1508-a7cb256e17c3@bootlin.com>
Date: Mon, 29 Mar 2021 15:30:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <166EB9A9DDFCFF90.14702@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 3/22/21 6:17 PM, Michael Opdenacker wrote:
> - Minor style and spelling fixes
> - Add some extra details; add missing external link macros
>   and explain where they are defined
> - Correct where documentation can be found on the
>   Yocto Project website: the "Documentation" tab
>   has been replaced by "Docs" (and its later
>   shown as uppercase ("DOCS") by the current CSS, but this
>   may change one day.


For your information, this change is now in the "master-next" tree:
http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/commit/?h=master-next&id=5831f68112174f80ab6b78c3cdfb88a753a1ffb8

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

