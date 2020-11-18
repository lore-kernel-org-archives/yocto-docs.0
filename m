Received: from bsmtp1.bon.at (bsmtp1.bon.at [213.33.87.15])
 by mx.groups.io with SMTP id smtpd.web10.25144.1605710380168789934
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Nov 2020 06:39:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.15, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp1.bon.at (Postfix) with ESMTPSA id 4Cblnh3XLHz5tlF;
	Wed, 18 Nov 2020 15:39:36 +0100 (CET)
Date: Wed, 18 Nov 2020 15:39:34 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Paul Barker <pbarker@konsulko.com>,
	YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v2 1/9] conf.py: Add oe_git directive
Message-ID: <20201118143934.ovvg4sb7cte3zk46@qschulz>
References: <20201118100705.3656-1-pbarker@konsulko.com>
 <CAP71Wjy0zX_vExgmWcV_6fA3RcOghRfBr1zvxt9dyphyrdFBOA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP71Wjy0zX_vExgmWcV_6fA3RcOghRfBr1zvxt9dyphyrdFBOA@mail.gmail.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

On Wed, Nov 18, 2020 at 12:42:21PM +0100, Nicolas Dechesne wrote:
> On Wed, Nov 18, 2020 at 11:07 AM Paul Barker <pbarker@konsulko.com> wrote:
> >
> > This simplifies linking to git repositories on openembedded.org.
> >
> > Signed-off-by: Paul Barker <pbarker@konsulko.com>
> 
> Thanks Paul!. I reviewed the whole series. made a suggestion about a
> new variable for the LTS name. It can be done in a v3, or a later
> series as well, i don't mind much.

+1 for LTS variables in poky.yaml, though maybe we can just replace
_MINUS_ONE variables with LTS ones? From the quick look I had in the
docs, it seems to not be that big of a deal to migrate MINUS_ONE
variables to LTS ones and still keep more or less the same intended
behavior/explanation.

Also, throwing this out right now, I really don't like:
:yocto_git:`poky </cgit.cgi/poky>` lines.. Couldn't we just set
:yocto_git: to https://git.yoctoproject.org/cgit.cgi%s instead? and then
use it like that: :yocto_git:`/poky`?

Nothing to be changed in this patch series though, just thinking out
loud.

For the whole series:
Reviewed-by: Quentin Schulz <quentin.schulz@streamunlimited.com>

Thanks!
Quentin
