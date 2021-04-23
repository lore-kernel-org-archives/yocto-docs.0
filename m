Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web09.557.1619190156753077270
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Apr 2021 08:02:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 92.150.42.106
Received: from [10.0.0.12] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 70C5260017;
	Fri, 23 Apr 2021 15:02:34 +0000 (UTC)
Cc: docs@lists.yoctoproject.org, Trevor Gamblin <trevor.gamblin@windriver.com>
Subject: Re: [docs] [PATCH v2] ref-manual/variables.rst: Add incompatibility warning for SERIAL_CONSOLES_CHECK
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
References: <16783B7361829FC0.16298@lists.yoctoproject.org>
 <20210422163940.300616-1-michael.opdenacker@bootlin.com>
 <20210422164245.qdxj4crtcl7ro2up@qschulz>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <7689cde6-08f4-f812-81d0-8a1ddfc5b125@bootlin.com>
Date: Fri, 23 Apr 2021 17:02:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210422164245.qdxj4crtcl7ro2up@qschulz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 4/22/21 6:42 PM, Quentin Schulz wrote:
> On Thu, Apr 22, 2021 at 06:39:40PM +0200, Michael Opdenacker wrote:
>> From: Trevor Gamblin <trevor.gamblin@windriver.com>
>>
>> See [YOCTO #13921]
>>
>> Add details to the SERIAL_CONSOLES_CHECK entry to clarify that it
>> doesn't work with read-only rootfs.
>>
>> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>> Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> Reviewed-by: Quentin Schulz <foss@0leil.net>


Merged in master-next:
http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/log/?h=master-next

Will soon submit a PR for inclusion in master.

Thanks again,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

