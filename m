Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
 by mx.groups.io with SMTP id smtpd.web12.6730.1610443144449634368
 for <docs@lists.yoctoproject.org>;
 Tue, 12 Jan 2021 01:19:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.17, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp3.bon.at (Postfix) with ESMTPSA id 4DFQ4P5mlPz5tlK;
	Tue, 12 Jan 2021 10:19:01 +0100 (CET)
Date: Tue, 12 Jan 2021 10:19:00 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Quentin Schulz <foss@0leil.net>,
	"docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] documentation: sphinx-static: switchers.js: add release name in dropdown menu
Message-ID: <20210112091900.ugbdh7herzosvb2d@qschulz>
References: <20210111120938.20633-1-foss@0leil.net>
 <20210111121155.zgrmq3bh6roynjhv@qschulz>
 <6ce3ef28ccb44fcb9ade563d5aabd267@XBOX03.axis.com>
MIME-Version: 1.0
In-Reply-To: <6ce3ef28ccb44fcb9ade563d5aabd267@XBOX03.axis.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peter,

On Mon, Jan 11, 2021 at 05:07:49PM +0000, Peter Kjellerstedt wrote:
[...]
> > On Mon, Jan 11, 2021 at 01:09:38PM +0100, Quentin Schulz wrote:
[...]
> > > diff --git a/documentation/sphinx-static/switchers.js b/documentation/sphinx-static/switchers.js
> > > index 754de2e6a..fd4dd607d 100644
> > > --- a/documentation/sphinx-static/switchers.js
> > > +++ b/documentation/sphinx-static/switchers.js
> > > @@ -3,10 +3,10 @@
> > >
> > >    var all_versions = {
> > >      'dev': 'dev (3.3)',
> > > -    '3.2.1': '3.2.1',
> > > -    '3.1.4': '3.1.4',
> > > -    '3.0.4': '3.0.4',
> > > -    '2.7.4': '2.7.4',
> > > +    '3.2.1': 'gatesgarth (3.2.1)',
> > > +    '3.1.4': 'dunfell (3.1.4)',
> > > +    '3.0.4': 'zeus (3.0.4)',
> > > +    '2.7.4': 'warrior (2.7.4)',
> 
> Since these are names, wouldn't it be more appropriate to capitalize them:
> 
>     '3.2.1': 'Gatesgarth (3.2.1)',
>     '3.1.4': 'Dunfell (3.1.4)',
>     '3.0.4': 'Zeus (3.0.4)',
>     '2.7.4': 'Warrior (2.7.4)',
> 

Yup, thanks for the review.

In the end, we'll go for a more generic approach so that bitbake and
yocto docs can both share switchers.js and use a configuration file to
fill the dropdown menu. I'll try to not forget about this review :)

We can drop this patch for now.

Cheers,
Quentin
