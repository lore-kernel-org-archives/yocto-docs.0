Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.11625.1618929328580551883
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Apr 2021 07:35:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 92.150.42.106
Received: from [10.0.0.10] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id B268EFF819;
	Tue, 20 Apr 2021 14:35:26 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2 0/3] manuals: simplify colon usage
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
References: <20210416175549.161851-1-michael.opdenacker@bootlin.com>
 <20210419082916.jhlpzb6os63ykjyi@qschulz>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <ed9b8751-0db3-443b-30c8-a164b2fdbeee@bootlin.com>
Date: Tue, 20 Apr 2021 16:35:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210419082916.jhlpzb6os63ykjyi@qschulz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Quentin,

On 4/19/21 10:29 AM, Quentin Schulz wrote:
> Not sure we care the fewer bytes part, but we certainly do care about
> the same output! I can't reasonably give you my Reviewed-By, nor can I
> give you an Acked-by, so mmmm... well LGTM since you verified that the
> HTML output is unchanged :)
>
> Many thanks, one step closer to consistency \o/

Thanks for your review and your trust ;)

Applied to master-next:
http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/log/?h=master-next

Cheers,

Michael

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

