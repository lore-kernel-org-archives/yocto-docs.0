Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
 by mx.groups.io with SMTP id smtpd.web12.8313.1600417352984332713
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Sep 2020 01:22:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.16, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 4Bt6Jj1CNqz5tlB;
	Fri, 18 Sep 2020 10:22:29 +0200 (CEST)
Date: Fri, 18 Sep 2020 10:22:27 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Quentin Schulz <foss@0leil.net>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 2/2] docs: fix broken links
Message-ID: <20200918082227.4tmksf2ot5omitg2@qschulz>
References: <20200917210947.51974-1-foss@0leil.net>
 <20200917210947.51974-2-foss@0leil.net>
MIME-Version: 1.0
In-Reply-To: <20200917210947.51974-2-foss@0leil.net>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 17, 2020 at 11:09:47PM +0200, Quentin Schulz wrote:
[...]
>  1. *Access the Index of Releases:* Open a browser and go to
> -   :yocto_dl:`Index of Releases <releases>`. The
> +   :yocto_dl:`Index of Releases </releases>`. The

All those broken links could be mitigated by having:

extlinks = {
-    'yocto_home': ('https://yoctoproject.org%s', None),
+    'yocto_home': ('https://yoctoproject.org/%s', None),
}

in documentation/conf.py.

But then you need to change all links using this "macro") so that they
don't have a double slash after the domain name :/

At least with this patch it's consistent (and working :) ) but still
error-prone.

Quentin
