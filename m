Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
 by mx.groups.io with SMTP id smtpd.web08.6301.1622120123804745657
 for <docs@lists.yoctoproject.org>;
 Thu, 27 May 2021 05:55:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.17, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp3.bon.at (Postfix) with ESMTPSA id 4FrSTj11RBz5tlK;
	Thu, 27 May 2021 14:55:20 +0200 (CEST)
Date: Thu, 27 May 2021 14:55:19 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 0/3] A couple of changes on the documentation main page
Message-ID: <20210527125519.5jzemfdb7qu54bh4@qschulz>
References: <20210526122250.2552376-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210526122250.2552376-1-nicolas.dechesne@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nicolas,

On Wed, May 26, 2021 at 02:22:47PM +0200, Nicolas Dechesne wrote:
> A few simple changes to try to improve the content of the main page. I
> am still hoping that we can have a more graphical main page
> eventually. I really like
> https://projectacrn.github.io/latest/index.html for example (also
> managed with Sphinx)
> 
> Nicolas Dechesne (3):
>   index: remove the link/section to 'mega manual' from main page
>   index: remove links to releases manual and index
>   index: split releases manuals and indexes into two section in the tree
> 

Reviewed-by: Quentin Schulz <foss@0leil.net>

Cheers,
Quentin
