Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
 by mx.groups.io with SMTP id smtpd.web12.16511.1601475299667308065
 for <docs@lists.yoctoproject.org>;
 Wed, 30 Sep 2020 07:15:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.16, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 4C1dYr3JWJz5tlC;
	Wed, 30 Sep 2020 16:14:56 +0200 (CEST)
Date: Wed, 30 Sep 2020 16:14:54 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Usama Arif <usama.arif@arm.com>
Cc: docs@lists.yoctoproject.org, nd@arm.com
Subject: Re: [docs] [PATCH v2] ref-manual: document authentication key variables
Message-ID: <20200930141454.c34hwyaocpbreusu@qschulz>
References: <20200930141118.44916-1-usama.arif@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200930141118.44916-1-usama.arif@arm.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Usama,

On Wed, Sep 30, 2020 at 03:11:18PM +0100, Usama Arif wrote:
> This documents the variables used to create keys for
> signing fitImage.
> 
> Signed-off-by: Usama Arif <usama.arif@arm.com>
> ---
>  documentation/ref-manual/ref-classes.xml   |  7 ++-
>  documentation/ref-manual/ref-variables.xml | 65 ++++++++++++++++++++++

YP is migrating to Sphinx doc, could you please edit the rst files
instead? xml files are meant to disappear soon :)

Thanks!
Quentin
