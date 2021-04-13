Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web12.1564.1618339196511772896
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Apr 2021 11:39:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 109.210.254.211
Received: from [192.168.1.20] (amontpellier-552-1-199-211.w109-210.abo.wanadoo.fr [109.210.254.211])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 756AB20002;
	Tue, 13 Apr 2021 18:39:54 +0000 (UTC)
Cc: Janne Kiiskila <janne.kiiskila@pelion.com>,
 "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH]Variables - WKS_FILE tip finding one used
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <DBAPR08MB5558B9EA79319C4C09AC1802F3709@DBAPR08MB5558.eurprd08.prod.outlook.com>
 <266de944-aab4-2e1d-021f-d722d15339e3@bootlin.com>
 <4788fc62-112d-b2cb-2292-e87a6282a214@crashcourse.ca>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <3b3e763c-7e0b-611d-2b45-2c917aaa0537@bootlin.com>
Date: Tue, 13 Apr 2021 20:39:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <4788fc62-112d-b2cb-2292-e87a6282a214@crashcourse.ca>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Janne, Robert,

On 4/13/21 11:32 AM, Robert P. J. Day wrote:
>
>   while this is undeniably useful information, the same tip could be
> added to pretty much every variable in the variable glossary, so i'm
> not sure we want to start doing that; i think it would be far more
> useful to make this a general hint somewhere.
>
>   i also recall, from years gone by, that chris larson had a cool
> utility named "bb" that would search in a *proper* way for the values
> of variables by actually digging into the data dictionary, rather than
> the clearly hackier way of grep'ing through the output of "bitbake
> -e".


Thanks for your contribution and review (respectively).

Do others have opinions about such a change? It would help to make a
decision...

Thanks in advance for jumping in...

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

