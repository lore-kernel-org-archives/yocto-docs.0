Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web08.7616.1618496065199174105
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 07:14:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 92.150.42.106
Received: from [10.0.0.10] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 0282C60009;
	Thu, 15 Apr 2021 14:14:22 +0000 (UTC)
Cc: Paul Eggleton <bluelightning@bluelightning.org>,
 YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 12/13] ref-manual: add migration section for 3.3 release
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
 Quentin Schulz <quentin.schulz@streamunlimited.com>
References: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>
 <d8b43077bf92ad403028cbf37b61c4a6349f9370.1618358456.git.paul.eggleton@linux.microsoft.com>
 <20210414082603.gmkxjpyxwnhwzzor@qschulz> <1712714.3VsfAaAtOV@linc>
 <20210415095914.eqpunspm2rnpnc4v@qschulz>
 <CAP71WjxKavO93Cm8ZooE4HnJtbb79WLOQASEkh9UL5nFKw8ZNA@mail.gmail.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <ea34f44b-c8ba-4771-2e82-954c24c1cd91@bootlin.com>
Date: Thu, 15 Apr 2021 16:14:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAP71WjxKavO93Cm8ZooE4HnJtbb79WLOQASEkh9UL5nFKw8ZNA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 4/15/21 12:25 PM, Nicolas Dechesne wrote:
>
>
> and it worked fine.. that's cool, because that means we should be able
> to remove some extraneous bitbake: prefix in few places.


Indeed! I'll propose a patch doing this.

Thanks,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

