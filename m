Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
 by mx.groups.io with SMTP id smtpd.web09.13743.1617354327845630781
 for <docs@lists.yoctoproject.org>;
 Fri, 02 Apr 2021 02:05:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.17, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp3.bon.at (Postfix) with ESMTPSA id 4FBYzb3ckxz5tlB;
	Fri,  2 Apr 2021 11:05:15 +0200 (CEST)
Date: Fri, 2 Apr 2021 11:05:14 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: richard.purdie@linuxfoundation.org, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] scripts/run-docs-build: build hardknott docs
Message-ID: <20210402090514.pmlavtpfp4jguifl@qschulz>
References: <20210401162610.591089-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210401162610.591089-1-nicolas.dechesne@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nicolas,

Small niptick on the patch prefix, it should be [yocto-autobuilder-helper]
instead of [docs].

Cheers,
Quentin
