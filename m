Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web12.16528.1630328414215983410
 for <docs@lists.yoctoproject.org>;
 Mon, 30 Aug 2021 06:00:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 2C47CC0006;
	Mon, 30 Aug 2021 13:00:11 +0000 (UTC)
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] what's the standard for em dashes in sphinx for YP docs?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <c81c363-94a9-da8c-4d9f-32ec8415d245@crashcourse.ca>
 <20210830080327.zasqwk4jz5me24p5@fedora>
 <b177648e-ff38-f0d9-9548-ea46471513f3@crashcourse.ca>
 <356727d3-c50e-d0df-d758-44c3d257817b@bootlin.com>
 <9b9aae5-921e-f6ef-79cd-deaf653c942c@crashcourse.ca>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <46ee1539-3d8f-9bbb-a305-656dd9d1e34f@bootlin.com>
Date: Mon, 30 Aug 2021 15:00:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <9b9aae5-921e-f6ef-79cd-deaf653c942c@crashcourse.ca>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 8/30/21 2:54 PM, Robert P. J. Day wrote:
>
>   i will go with the consensus -- i asked only because there are
> always places where one would properly use a comma, and others a
> semi-colon, and others an em dash, and so on. (see what i did there?)


:D

Right, I believe we should follow the rules rather than inventing new
ones or having none.

So, I'll vote for the proper use of "--" (en dash) and "---" (em dash)
when suitable, and document this in the coding style I need to propose.
Any objections?

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

