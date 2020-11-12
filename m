Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
 by mx.groups.io with SMTP id smtpd.web08.2090.1605174999639446347
 for <docs@lists.yoctoproject.org>;
 Thu, 12 Nov 2020 01:56:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.16, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 4CWxnv19DHz5tlJ;
	Thu, 12 Nov 2020 10:56:35 +0100 (CET)
Date: Thu, 12 Nov 2020 10:56:33 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2 0/2] Update poky.yaml
Message-ID: <20201112095633.mbhjs4ztaz3tk7w2@qschulz>
References: <20201112075206.113124-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20201112075206.113124-1-nicolas.dechesne@linaro.org>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nicolas,

On Thu, Nov 12, 2020 at 08:52:04AM +0100, Nicolas Dechesne wrote:
> This file was not updated for 3.2. These 2 changes should go on master
> and gatesgarth. Then we can update poky.yaml for master/3.3 later.
> 
> Nicolas Dechesne (2):
>   poky.yaml: remove unused variables
>   poky.yaml: updates for 3.2
> 

For both:

Reviewed-by: Quentin Schulz <quentin.schulz@streamunlimited.com>

Thanks!
Quentin
