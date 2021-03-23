Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
 by mx.groups.io with SMTP id smtpd.web08.483.1616523842071570482
 for <docs@lists.yoctoproject.org>;
 Tue, 23 Mar 2021 11:24:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.16, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 4F4frv1rQJz5tlC;
	Tue, 23 Mar 2021 19:23:59 +0100 (CET)
Date: Tue, 23 Mar 2021 19:23:57 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: janne.kiiskila@pelion.com
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] UBUNTU sudo apt git instead of git-core
Message-ID: <20210323182357.i4sm2b3ggj3i7cjq@qschulz>
References: <KkZH.1616523262298523931.IGi7@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <KkZH.1616523262298523931.IGi7@lists.yoctoproject.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Janne,

On Tue, Mar 23, 2021 at 11:14:22AM -0700, janne.kiiskila@pelion.com wrote:
> From 6d672cf6dcb39e20d10ee2da012e372016fa3c38 Mon Sep 17 00:00:00 2001
> From: Janne Kiiskila <janne.kiiskila@arm.com>
> Date: Tue, 23 Mar 2021 11:11:39 -0700
> Subject: [PATCH] UBUNTU sudo apt git instead of git-core
> 
> Ubuntu has changed packing and git-core is not available anymore,
> it is now just plain git.
> 
> (pelion-venv) jankii01@ubuntu1804:~/poky/documentation$ sudo apt-get install git-core
> [sudo] password for jankii01:
> Reading package lists... Done
> Building dependency tree
> Reading state information... Done
> Note, selecting 'git' instead of 'git-core'
> git is already the newest version (1:2.17.1-1ubuntu0.8).
> The following package was automatically installed and is no longer required:
> linux-hwe-5.4-headers-5.4.0-65
> Use 'sudo apt autoremove' to remove it.
> 0 upgraded, 0 newly installed, 0 to remove and 13 not upgraded.
> 
> Documentaiton should match the current package name to avoid confusion/warnings.

We're missing your Signed-off-by here.

The documentation applies to both Ubuntu AND Debian. 16.04, 18.04 and
20.04 are supported as well as Debian 8, 9 and 10.

You need to check your change is working for all the above. Otherwise, a
warning is really not that big of deal for the sake of consistency and
compatibility with older (and still supported) distributions.

Thanks,
Quentin
