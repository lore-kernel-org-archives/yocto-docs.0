Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.7645.1623317950447058230
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Jun 2021 02:39:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id B8BA41BF208
	for <docs@lists.yoctoproject.org>; Thu, 10 Jun 2021 09:39:08 +0000 (UTC)
Subject: Re: [docs] [PATCH] ref-manual: move release notes to separate document
To: docs@lists.yoctoproject.org
References: <1675A932C413C877.8243@lists.yoctoproject.org>
 <16872EDF3FBC0621.15202@lists.yoctoproject.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <9c29810b-b20f-f752-d914-0f27f779ba2d@bootlin.com>
Date: Thu, 10 Jun 2021 11:39:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <16872EDF3FBC0621.15202@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Greetings,

On 6/10/21 11:35 AM, Michael Opdenacker wrote:
> This makes the reference manual much lighter by moving
> the release notes to a separate document.
>
> The release notes are also reordered from last to first,
> and they appear directly in the left bar, making them easier
> to find in the documentation.


These are my proposed changes, trying to match what was discussed back
in April.

Don't hesitate to try them by applying them to the "master" branch and
running "make html". In particular, you should see a new "Release Notes"
entry in the left column.

Your feedback and reviews are welcome. I don't expect to get it right
the first time :)

Thanks in advance,

Michael.

-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

