Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web09.34539.1628847792648898151
 for <docs@lists.yoctoproject.org>;
 Fri, 13 Aug 2021 02:43:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 160B120004;
	Fri, 13 Aug 2021 09:43:10 +0000 (UTC)
Cc: docs@lists.yoctoproject.org, Quentin Schulz <foss@0leil.net>
Subject: Re: [docs] [PATCH v3] kickstart: document which options accept units
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 o.mandel@menlosystems.com
References: <20210813083743.g4a2iax2ybxusamc@fedora>
 <20210813084855.9693-1-o.mandel@menlosystems.com>
 <20210813085223.3ajkjeormkpmhx4e@fedora>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <eb3d497e-0404-cbad-649a-ec31d213850a@bootlin.com>
Date: Fri, 13 Aug 2021 11:43:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210813085223.3ajkjeormkpmhx4e@fedora>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 8/13/21 10:52 AM, Quentin Schulz wrote:
> Hi Olaf,
>
> On Fri, Aug 13, 2021 at 08:48:55AM +0000, o.mandel@menlosystems.com wrote:
>> Document which units are accepted as parameters for the four options
>> that accept units. Also be pedantic about using binary instead of
>> decimal prefixes so readers don't have to wonder.
>>
>> Signed-off-by: Olaf Mandel <o.mandel@menlosystems.com>
>> Reviewed-by: Quentin Schulz <foss@0leil.net>
> If the content of the patch is the same as v2, there's no need to send a
> v3 to add my Reviewed-by, the maintainer will do it when merging the
> patch :)


Indeed. But that's natural to assume this when you begin. I did too :)
Cheers

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

