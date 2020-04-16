Received: from linuxplesk15.openhost.net.nz (linuxplesk15.openhost.net.nz [112.109.81.172])
 by mx.groups.io with SMTP id smtpd.web12.1811.1586999746416974749
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Apr 2020 18:15:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 112.109.81.172, mailfrom: bluelightning@bluelightning.org)
Received: from linc.localnet (unknown [165.84.15.3])
	by linuxplesk15.openhost.net.nz (Postfix) with ESMTPSA id 3D9C9A12D8;
	Thu, 16 Apr 2020 13:15:42 +1200 (NZST)
Authentication-Results: linuxplesk15.openhost.net.nz;
        spf=pass (sender IP is 165.84.15.3) smtp.mailfrom=bluelightning@bluelightning.org smtp.helo=linc.localnet
Received-SPF: pass (linuxplesk15.openhost.net.nz: connection is authenticated)
From: "Paul Eggleton" <bluelightning@bluelightning.org>
To: akuster808 <akuster808@gmail.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 2/2] ref-manual: add migration section for 3.1
Date: Thu, 16 Apr 2020 13:15:41 +1200
Message-ID: <32390130.ZqN1KRdhQd@linc>
In-Reply-To: <a2ada06c-7958-a14a-318c-12a945833a67@gmail.com>
References: <cover.1586987359.git.bluelightning@bluelightning.org> <387de38945c4514c58edf915474a2ec474539746.1586987359.git.bluelightning@bluelightning.org> <a2ada06c-7958-a14a-318c-12a945833a67@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Armin

On Thursday, 16 April 2020 10:39:26 AM NZST akuster808 wrote:
> On 4/15/20 2:49 PM, Paul Eggleton wrote:
> > +        <para>
> > +            In order to avoid unnecessary differences in output files
> > (aiding binary reproducibility), the Poky distribution configuration
> > (<filename><link linkend='var-DISTRO'>DISTRO</link> = "poky"</filename>)
> > now inherits the <filename>reproducible_build</filename> class by
> > default. +        </para>
> > +    </section>
> 
> AK] I think the l hash equivalence server is also enabled by default:
> 
> commit 1fb4aa42f9c3b9738d78d198ad695fe4fcb6dc2f
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Wed Aug 7 21:56:01 2019 +0100
> 
>     poky: Default to enabling a local hash equivalence server

That is true. The purpose of this document though is more to highlight changes 
that the user will need to take some sort of action in response to when they 
upgrade. You might perhaps very reasonably argue that the reproducible builds 
change  doesn't qualify either :)

> > +        <para>
> > +            Previously, recipes by tradition included both SHA256 and MD5
> > checksums for remotely fetched files in <link
> > linkend='var-SRC_URI'><filename>SRC_URI</filename></link>, even though
> > only one is actually mandated. However, the MD5 checksum does not add
> > much given its inherent weakness; thus when a checksum fails only the
> > SHA256 sum will now be printed. The md5sum will still be verified if it
> > is specified.
>
> AK] If I am not mistaken, we can support all these in a recipe:  "md5",
> "sha256", "sha1", "sha384", "sha512"
> 
> ref: bitbake/lib/bb/fetch2/__init__.py ; CHECKSUM_LIST
> 
> Not sure if we want to mention that too???

We certainly could, but it's along similar lines as above. It wouldn't hurt to 
add it on to what we've got though I guess.

Cheers,
Paul




