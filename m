Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
 by mx.groups.io with SMTP id smtpd.web12.10127.1618389694865504535
 for <docs@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 01:41:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.17, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp3.bon.at (Postfix) with ESMTPSA id 4FKwth0pGYz5tlD;
	Wed, 14 Apr 2021 10:41:31 +0200 (CEST)
Date: Wed, 14 Apr 2021 10:41:30 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Paul Eggleton <paul.eggleton@linux.microsoft.com>,
	docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 09/13] ref-manual: add FIT_KERNEL_COMP_ALG*
Message-ID: <20210414084130.mkwaaber7rjjycfy@qschulz>
References: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>
 <fedb9252444ceaaaa6567d381318ca02c119a3da.1618358456.git.paul.eggleton@linux.microsoft.com>
 <20210414081605.nkoys2ri63h2d75f@qschulz>
 <799bb8cf-ca33-325f-b717-f68db0b7a1ed@crashcourse.ca>
MIME-Version: 1.0
In-Reply-To: <799bb8cf-ca33-325f-b717-f68db0b7a1ed@crashcourse.ca>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 14, 2021 at 04:35:19AM -0400, Robert P. J. Day wrote:
> On Wed, 14 Apr 2021, Quentin Schulz wrote:
> 
> > Hi Paul,
> >
> > On Tue, Apr 13, 2021 at 05:19:50PM -0700, Paul Eggleton wrote:
> > > From: Paul Eggleton <paul.eggleton@microsoft.com>
> > >
> > > Add FIT_KERNEL_COMP_ALG and FIT_KERNEL_COMP_ALG_EXTENSION. Examining
> > > OE-Core commit 5c72105e2973e613b5c0f0e6310ffdea6e56c6c7 and the
> > > associated code, these do not enable arbitrary selection of compression
> > > algorithm - only disabling compression - so document them accordingly.
> > >
> > > Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
> > > ---
> > >  documentation/ref-manual/variables.rst | 11 +++++++++++
> > >  1 file changed, 11 insertions(+)
> > >
> > > diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> > > index 3b76dbc..f010cd7 100644
> > > --- a/documentation/ref-manual/variables.rst
> > > +++ b/documentation/ref-manual/variables.rst
> > > @@ -2580,6 +2580,17 @@ system and gives an overview of their function and contents.
> > >     :term:`FIT_HASH_ALG`
> > >        Specifies the hash algorithm used in creating the FIT Image. For e.g. sha256.
> > >
> > > +   :term:`FIT_KERNEL_COMP_ALG`
> > > +      Compression algorithm to use for the kernel image inside the fitImage.
> > > +      At present, the only supported values are "gzip" (default) or "none",
> > > +      which allows disabling of compression if it would otherwise be enabled.
> >
> > I'm not a native speaker and I'm struggling to understand that last line,
> > would it be possible for you to rephrase please?
> 
>   i would just drop the second half of that second sentence -- the
> first part says all that needs to be said:
> 
>   Compression algorithm to use for the kernel image inside the
>   fitImage; at present, the only supported values are "gzip" (default)
>   or "none".
> 
> i would pick nits with the varieties of the phrase "fitImage";
> regardless of how it's used as a variable, i believe the proper
> reference is "FIT image", which is how it should appear in the above,
> methinks.
> 
> > > +      If you set this you will also need to set :term:`FIT_KERNEL_COMP_ALG_EXTENSION`.
> > > +
> > > +   :term:`FIT_KERNEL_COMP_ALG_EXTENSION`
> > > +      File extension corresponding to :term:`FIT_KERNEL_COMP_ALG`. The default
> > > +      value is ".gz"; if you set ``FIT_KERNEL_COMP_ALG`` to "none" then
> >
> > s/``FIT_KERNEL_COMP_ALG``/:term:`FIT_KERNEL_COMP_ALG`/
> 
>   since the first occurrence is already term'ed, the remaining
> occurrences in that entry don't need to be, isn't that the standard
> that's being used?
> 

We're planning to have all variable references to be :term:'ed
eventually, so better not add more to change later on :)

Quentin
