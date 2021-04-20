Received: from bsmtp1.bon.at (bsmtp1.bon.at [213.33.87.15])
 by mx.groups.io with SMTP id smtpd.web12.13184.1618935156671602498
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Apr 2021 09:12:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.15, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp1.bon.at (Postfix) with ESMTPSA id 4FPpcL3sCyz5tl9;
	Tue, 20 Apr 2021 18:12:33 +0200 (CEST)
Date: Tue, 20 Apr 2021 18:12:32 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] current glossary entry for SPL_BINARY is out of date
Message-ID: <20210420161232.4lekjsojozepgo5v@qschulz>
References: <eacf923-3eb3-649e-ff25-cddf43a466a@crashcourse.ca>
MIME-Version: 1.0
In-Reply-To: <eacf923-3eb3-649e-ff25-cddf43a466a@crashcourse.ca>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robert,

On Tue, Apr 20, 2021 at 07:50:29AM -0400, Robert P. J. Day wrote:
> 
>   here:
> 
> https://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html#var-SPL_BINARY
> 

Please stop looking into those www.yoctoproject.org/docs/latest links,
you should use https://docs.yoctoproject.org instead. The link you point
to has stopped to be updated since 3.1.5 release IIRC.

(Not saying your remark does not apply, just that to avoid future alerts
and prevent you to do some work that's already been done it might make
sense to look at actual latest version of the docs.

Cheers,
Quentin
