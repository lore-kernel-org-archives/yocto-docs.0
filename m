Received: from bsmtp1.bon.at (bsmtp1.bon.at [213.33.87.15])
 by mx.groups.io with SMTP id smtpd.web12.12807.1603113668843019147
 for <docs@lists.yoctoproject.org>;
 Mon, 19 Oct 2020 06:21:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.15, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp1.bon.at (Postfix) with ESMTPSA id 4CFHSy5Gqzz5tlF;
	Mon, 19 Oct 2020 15:21:06 +0200 (CEST)
Date: Mon, 19 Oct 2020 15:21:05 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 1/3] docs: dev-manual: fix typos, highlights, indentation and links
Message-ID: <20201019132105.ugmzxn53gzwpmfhe@qschulz>
References: <20201018175712.23800-1-foss@0leil.net>
 <CAP71Wjx8MJNy0-jN4+P39TTK0C5zyd8BQomTbX2jOiO4jGzx0Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP71Wjx8MJNy0-jN4+P39TTK0C5zyd8BQomTbX2jOiO4jGzx0Q@mail.gmail.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nicolas,

On Mon, Oct 19, 2020 at 03:17:22PM +0200, Nicolas Dechesne wrote:
> On Sun, Oct 18, 2020 at 7:58 PM Quentin Schulz <foss@0leil.net> wrote:
[...]
> > @@ -482,7 +480,7 @@ have to manually merge changes as they occur.
> >
> >  When you create an append file, you must use the same root name as the
> >  corresponding recipe file. For example, the append file
> > -``someapp_DISTRO.bbappend`` must apply to ``someapp_DISTRO.bb``. This
> > +``someapp_3.1.bbappend`` must apply to ``someapp_3.1.bb``. This
> 
> Should we have &DISTRO; instead?
> 

I don't think so? Is there a reason for wanting someapp's PV to be of the
value of the current release number of poky?

[...]

Thanks,
Quentin
