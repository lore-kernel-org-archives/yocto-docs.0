Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.44.1616522134360560564
 for <docs@lists.yoctoproject.org>;
 Tue, 23 Mar 2021 10:55:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from bras-base-otwaon0916w-grc-67-70-50-7-189.dsl.bell.ca ([70.50.7.189]:54432 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lOlFc-00Gw9U-Dk; Tue, 23 Mar 2021 13:55:32 -0400
Date: Tue, 23 Mar 2021 13:55:29 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
cc: Michael Opdenacker <michael.opdenacker@bootlin.com>, 
    Nicolas Dechesne <nicolas.dechesne@linaro.org>, 
    YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] Spellcheck and capitalization fixes
In-Reply-To: <20210323174253.snpxrugj2f2hxyue@qschulz>
Message-ID: <687ecbf-9115-baba-50ad-aa9a927e436@crashcourse.ca>
References: <20210323170624.112564-1-michael.opdenacker@bootlin.com> <23e95d84-fec2-70b9-65d7-baeaee6df836@linaro.org> <24ff30ac-a70e-a366-aab7-d0abf337df6f@bootlin.com> <20210323174253.snpxrugj2f2hxyue@qschulz>
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
Content-Type: multipart/mixed; boundary="8323328-965223816-1616522132=:29805"

--8323328-965223816-1616522132=:29805
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT

On Tue, 23 Mar 2021, Quentin Schulz wrote:

> On Tue, Mar 23, 2021 at 06:38:03PM +0100, Michael Opdenacker wrote:
> > Hi Nico,
> >
> > Thanks for your review!
> >
> > On 3/23/21 6:31 PM, Nicolas Dechesne wrote:
> > > On 3/23/21 6:06 PM, Michael Opdenacker wrote:
> > >> - Spelling fixes found using Emacs' spelling checker
> > >>    configured for US English
> > >> - Fixes for some capitalization issues, especially some
> > >>    project names (QEMU, openSUSE, BusyBox), that were not
> > >>    consistently used with the same capitalization anyway.
> > >> - A few whitespace fixes too
> > >>
> > >> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> > >
> > > Looks good to me. Thanks!
> >
> >
> > I was really impressed by the scarcity of typos and style issues
> > found so far. Congrats to the authors, contributors and reviewers,
> > who seem to have done a great job!
> >
>
> You'll have a LOT more "fun" if you start working on the Bitbake
> documentation. I don't think it's been properly reviewed since the
> migration to Sphinx and the Yocto Project docs were full of style
> issues. Nicolas, other contributors and myself can attest how
> painful that was. Your contributions are very welcome, thank you for
> the ones already sent!

  don't get me started. :-)

rday

--8323328-965223816-1616522132=:29805--
