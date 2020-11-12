Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
 by mx.groups.io with SMTP id smtpd.web08.1978.1605174123963337718
 for <docs@lists.yoctoproject.org>;
 Thu, 12 Nov 2020 01:42:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.17, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp3.bon.at (Postfix) with ESMTPSA id 4CWxT50PwBz5tlM;
	Thu, 12 Nov 2020 10:42:01 +0100 (CET)
Date: Thu, 12 Nov 2020 10:41:59 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Joshua Watt <JPEWhacker@gmail.com>, shantanoo.desai@gmail.com,
	YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] documentation: Add Pipenv support
Message-ID: <20201112094159.zhmmc6vyjwx6k2ri@qschulz>
References: <20201110212917.25172-1-JPEWhacker@gmail.com>
 <27534.1605130210340595078@lists.yoctoproject.org>
 <f4daa05e-8aa6-c817-fe51-910c0f9d0a69@gmail.com>
 <CAP71WjydMC_00a6YMWo77Pv39C7hwMYoVJt_sOOTsF5U1rxc6g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP71WjydMC_00a6YMWo77Pv39C7hwMYoVJt_sOOTsF5U1rxc6g@mail.gmail.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 12, 2020 at 08:29:34AM +0100, Nicolas Dechesne wrote:
> hey Shan,
> 
> can you please avoid top posting and using html for emails to the
> list? this makes it harder for us to follow.
> 
> On Wed, Nov 11, 2020 at 11:05 PM Joshua Watt <JPEWhacker@gmail.com> wrote:
> >
> >
> > On 11/11/20 3:30 PM, shantanoo.desai@gmail.com wrote:
> >
> > Hi Joshua,
> >
> > I would suggest adding sphinx-serve as a dev-package to serve the docs during local development/tests.
> >
> > I'd be fine with that. We can see if anyone else objects, or we can also merge as is and add that as a separate patch.
> 
> I never used it, but why not. I just tried it, and it worked. But it's
> definitely another patch on its own.
> 

What's the benefit over using `python3 -m http.server` or `python -m
SimpleHTTPServer`? (since those are part of the python standard library
AFAICT, no need to install new packages).

Thanks,
Quentin
