Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
 by mx.groups.io with SMTP id smtpd.web11.9542.1608630069971094912
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Dec 2020 01:41:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.16, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 4D0WYb6DnPz5tlL;
	Tue, 22 Dec 2020 10:41:07 +0100 (CET)
Date: Tue, 22 Dec 2020 10:41:06 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Paul Eggleton <paul.eggleton@linux.microsoft.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 0/5] fitimage-related changes
Message-ID: <20201222094106.rq7hie6oiiudpry4@qschulz>
References: <cover.1608598606.git.paul.eggleton@linux.microsoft.com>
MIME-Version: 1.0
In-Reply-To: <cover.1608598606.git.paul.eggleton@linux.microsoft.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,

On Mon, Dec 21, 2020 at 05:05:59PM -0800, Paul Eggleton wrote:
> Doc changes corresponding to patches for kernel-fitimage class that were
> recently merged to master, as well as some related tweaks.
> 
> 
> The following changes since commit b268b1b190861cb203fa642e57794acb402280a7:
> 
>   releases: conf: add link to 3.2.1, update to include 3.2.1 (2020-12-15 10:59:41 -0800)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib paule/fitimage-docs
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=paule/fitimage-docs
> 
> Paul Eggleton (5):
>   classes: minor corrections to kernel-fitimage section
>   variables: clarify KERNEL_ALT_IMAGETYPE reference
>   variables: explicitly state that UBOOT_MKIMAGE_DTCOPTS is optional
>   variables: Add documentation for new kernel-fitimage vars

Except for the small :\n:: issue in this one ^:

Reviewed-by: Quentin Schulz <quentin.schulz@streamunlimited.com>

Thanks!
Quentin
