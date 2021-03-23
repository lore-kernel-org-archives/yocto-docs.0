Received: from bsmtp1.bon.at (bsmtp1.bon.at [213.33.87.15])
 by mx.groups.io with SMTP id smtpd.web11.6412.1616491674684691823
 for <docs@lists.yoctoproject.org>;
 Tue, 23 Mar 2021 02:27:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.15, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp1.bon.at (Postfix) with ESMTPSA id 4F4QyH2Y0Xz5tlM;
	Tue, 23 Mar 2021 10:27:51 +0100 (CET)
Date: Tue, 23 Mar 2021 10:27:49 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 1/1] Update documentation URL
Message-ID: <20210323092749.2vuhqkef6ptxhfww@qschulz>
References: <20210319181321.45758-1-michael.opdenacker@bootlin.com>
 <20210319181321.45758-2-michael.opdenacker@bootlin.com>
 <099D8738-5946-4A6B-8A31-C575E7B77F4E@0leil.net>
 <9aeeb509-7a46-a761-2782-7d28dc0199c0@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <9aeeb509-7a46-a761-2782-7d28dc0199c0@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michael,

On Mon, Mar 22, 2021 at 03:46:55PM +0100, Michael Opdenacker wrote:
> Hi Quentin,
> 
> Nice to hear from you again, and thanks for your help!
> 

Nice to see you contribute to the project :) Here's to many more
patches.

> > Please use :yocto_docs: extlink here. IIRC, :yocto_docs:`/` should do just fine.
> 
> 
> Oops, actually, this doesn't work here, as we are in a "code-block". The
> patch didn't give you enough context for you to see this.
> 

Ah the eternal struggle with literal blocks. We should check if those
the same links appear often in literal blocks and then maybe have an
entry in poky.yaml for those for easier maintenance.

Later work anyway :)

> >
> > You can find the list of our extlinks in documentation/conf.py. They can be used in rST files (so your change in README is fine).
> 
> 
> This is very good to know, thanks!
> 
> Apparently, these shortcuts don't work in the toplevel index.rst file
> though... That was tempting to use them there too. Anyway, I'll use them
> in normal documentation.
> 

Indeed, probably related to the use of .. toc-tree directive. The goal
in the end is to have as few places as possible where manual maintenance
and monitoring is required. index.html is anyway so critical that I
doubt it'll stay broken for long if it ever happens to be broken :)

> 
> >
> >>       For more information about OpenEmbedded see their website:
> >>           http://www.openembedded.org
> > And a free patch here with :oe_home:`/` :)
> 
> 
> Same here, unfortunately.
> 
> So, I believe my patch can be taken as is...
> 

Works for me.

Reviewed-by: Quentin Schulz <foss@0leil.net>

Cheers,
Quentin
