Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.528.1615839547901448835
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Mar 2021 13:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:33588 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lLtg9-00Bt1n-Lo; Mon, 15 Mar 2021 16:19:06 -0400
Date: Mon, 15 Mar 2021 16:19:02 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] Description of BBPATH in BB user manual seems ... wrong
In-Reply-To: <20210315131042.lgjgjzdjtp2ofdey@qschulz>
Message-ID: <cbb6d8df-10c-b845-3ffa-9e294ead99a0@crashcourse.ca>
References: <ff1a51a0-8f8d-13c-5bf3-e833a1b79e5e@crashcourse.ca> <20210315131042.lgjgjzdjtp2ofdey@qschulz>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: multipart/mixed; boundary="8323328-149249070-1615839545=:13696"

--8323328-149249070-1615839545=:13696
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Mon, 15 Mar 2021, Quentin Schulz wrote:

> Hi Robert,
>
> On Mon, Mar 15, 2021 at 09:05:53AM -0400, Robert P. J. Day wrote:
> >
> >   Section 3.4.1 of BB manual:
> >
> > https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-metadata.html#locating-include-and-class-files
> >
> > "BitBake uses the BBPATH variable to locate needed include and class
> > files. Additionally, BitBake searches the current directory for
> > include and require directives.
> >
> > ... snip ..
> >
> > "In order for include and class files to be found by BitBake, they
> > need to be located in a “classes” subdirectory that can be found in
> > BBPATH."
> >
> >   first, is BBPATH not used for finding conf files as well? and the
>
> Yes it is.
>
> > wording of that second paragraph suggests that include files need to
> > be in a classes subdirectory to be found, which i'm pretty sure isn't
> > true.
> >
>
> I think what was meant by "include" files are conf files.... which
> (probably) technically are include files to Yocto PoV.
>
> Not entirely sure but I think Yocto includes all appropriate conf files
> to create the "base" "environment" of all recipes.
>
> basically, stuff on top of bitbake.conf and what is the environment
> being reset to between tasks/recipes.
>
> Those are guesses though.

  well, i think that wording in the BB user manual is at least a
little misleading, but if others think it's sufficiently clear, i'll
shut up about it.

rday

--8323328-149249070-1615839545=:13696--
