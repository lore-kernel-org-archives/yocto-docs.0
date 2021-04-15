Received: from linuxplesk15.openhost.net.nz (linuxplesk15.openhost.net.nz [119.47.118.83])
 by mx.groups.io with SMTP id smtpd.web12.4878.1618481258814680205
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 03:07:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 119.47.118.83, mailfrom: bluelightning@bluelightning.org)
Received: from linc.localnet (unknown [151.210.226.152])
	by linuxplesk15.openhost.net.nz (Postfix) with ESMTPSA id 82E83A2F44;
	Thu, 15 Apr 2021 22:07:36 +1200 (NZST)
Authentication-Results: linuxplesk15.openhost.net.nz;
	spf=pass (sender IP is 151.210.226.152) smtp.mailfrom=bluelightning@bluelightning.org smtp.helo=linc.localnet
Received-SPF: pass (linuxplesk15.openhost.net.nz: connection is authenticated)
From: "Paul Eggleton" <bluelightning@bluelightning.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 09/13] ref-manual: add FIT_KERNEL_COMP_ALG*
Date: Thu, 15 Apr 2021 22:07:36 +1200
Message-ID: <6250809.G0QQBjFxQf@linc>
In-Reply-To: <799bb8cf-ca33-325f-b717-f68db0b7a1ed@crashcourse.ca>
References: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>
	<20210414081605.nkoys2ri63h2d75f@qschulz>
	<799bb8cf-ca33-325f-b717-f68db0b7a1ed@crashcourse.ca>
MIME-Version: 1.0
X-PPP-Message-ID: <20210415100736.3903113.35614@localhost6.localdomain6>
X-PPP-Vhost: softec.co.nz
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Robert

On Wednesday, 14 April 2021 20:35:19 NZST Robert P. J. Day wrote:
> On Wed, 14 Apr 2021, Quentin Schulz wrote:
> > On Tue, Apr 13, 2021 at 05:19:50PM -0700, Paul Eggleton wrote:
> > > --- a/documentation/ref-manual/variables.rst
> > > +++ b/documentation/ref-manual/variables.rst
> > > @@ -2580,6 +2580,17 @@ system and gives an overview of their function
> > > and contents.> > 
> > >     :term:`FIT_HASH_ALG`
> > >     :
> > >        Specifies the hash algorithm used in creating the FIT Image. For
> > >        e.g. sha256.> > 
> > > +   :term:`FIT_KERNEL_COMP_ALG`
> > > +      Compression algorithm to use for the kernel image inside the
> > > fitImage. +      At present, the only supported values are "gzip"
> > > (default) or "none", +      which allows disabling of compression if it
> > > would otherwise be enabled.> 
> > I'm not a native speaker and I'm struggling to understand that last line,
> > would it be possible for you to rephrase please?
> 
>   i would just drop the second half of that second sentence -- the
> first part says all that needs to be said:
> 
>   Compression algorithm to use for the kernel image inside the
>   fitImage; at present, the only supported values are "gzip" (default)
>   or "none".

Sounds reasonable, I've done exactly this. I also adjusted the text to remove 
mention of setting  FIT_KERNEL_COMP_ALG_EXTENSION if FIT_KERNEL_COMP_ALG is 
set to "none" (upon closer inspection that isn't necessary based on how the 
code behaves).

> i would pick nits with the varieties of the phrase "fitImage";
> regardless of how it's used as a variable, i believe the proper
> reference is "FIT image", which is how it should appear in the above,
> methinks.

Yep I fixed this as well. We're not consistent with this in the existing text, 
I haven't fixed that so we probably should in future.

Thanks,
Paul


