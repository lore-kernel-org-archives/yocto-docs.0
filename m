Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
 by mx.groups.io with SMTP id smtpd.web11.7484.1618495255406024976
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 07:00:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.14, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 4FLgwh6GLbz5tlC;
	Thu, 15 Apr 2021 16:00:52 +0200 (CEST)
Date: Thu, 15 Apr 2021 16:00:51 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Paul Eggleton <paul.eggleton@linux.microsoft.com>,
	docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 00/13] Documentation updates for 3.3
Message-ID: <20210415140051.j43m4xhquzfa5jeb@qschulz>
References: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>
 <446635da-f144-9e8e-fd4b-7dc127e4b8da@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <446635da-f144-9e8e-fd4b-7dc127e4b8da@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michael,

On Thu, Apr 15, 2021 at 03:54:28PM +0200, Michael Opdenacker wrote:
> Hi Paul,
> 
> On 4/14/21 2:19 AM, Paul Eggleton wrote:
> > The migration guide for 3.3, plus some missing related changes and a few
> > cleanups. Let me know if I missed anything.
> >
> >
> > The following changes since commit 4f7f451df266a307b34bf145b29291ca85eb882f:
> >
> >   docs: add a top level page for bitbake documentation (2021-04-09 09:00:53 +0200)
> >
> > are available in the git repository at:
> >
> >   git://git.yoctoproject.org/poky-contrib paule/migration-3.3
> >   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=paule/migration-3.3
> 
> 
> Thanks, the changes look good to me. I checked that indeed you took the
> feedback into account.
> 
> I merged them in yocto-docs' master-next.
> 

You answered on the v1 thread. I'm here just to make sure you took the
v2?

Thanks,
Quentin
