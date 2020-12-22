Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.10448.1608637353022048714
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Dec 2020 03:42:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:35458 helo=localhost.localdomain)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1krg3i-00074O-0x; Tue, 22 Dec 2020 06:42:31 -0500
Date: Tue, 22 Dec 2020 06:42:27 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
cc: Quentin Schulz <quentin.schulz@streamunlimited.com>, 
    Paul Eggleton <paul.eggleton@linux.microsoft.com>, 
    YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 4/5] variables: Add documentation for new kernel-fitimage vars
In-Reply-To: <CAP71Wjy-yTnQ=02bu_VXfbqSCuwBFSQ2=Y42zZ0LK1hezXv84w@mail.gmail.com>
Message-ID: <d4de713-f16f-ab9-e92c-c6e09a203e50@crashcourse.ca>
References: <cover.1608598606.git.paul.eggleton@linux.microsoft.com> <2a491bf195731319b9fa3bca15b95f7ce8342af5.1608598606.git.paul.eggleton@linux.microsoft.com> <20201222093924.gdmvccls6xd7bme7@qschulz>
 <CAP71Wjy-yTnQ=02bu_VXfbqSCuwBFSQ2=Y42zZ0LK1hezXv84w@mail.gmail.com>
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
Content-Type: text/plain; charset=US-ASCII

On Tue, 22 Dec 2020, Nicolas Dechesne wrote:

> On Tue, Dec 22, 2020 at 10:39 AM Quentin Schulz
> <quentin.schulz@streamunlimited.com> wrote:
> >
> > Hi Paul,
> >
> > On Mon, Dec 21, 2020 at 05:06:03PM -0800, Paul Eggleton wrote:
> > > From: Paul Eggleton <paul.eggleton@microsoft.com>
> > >
> > > Add documentation for FIT_DESC, FIT_SIGN_INDIVIDUAL, UBOOT_MKIMAGE,
> > > UBOOT_MKIMAGE_SIGN and UBOOT_MKIMAGE_SIGN_ARGS.
> > >
> > > Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
> > > ---
> > >  documentation/ref-manual/variables.rst | 33 +++++++++++++++++++++++++++++++++
> > >  1 file changed, 33 insertions(+)
> > >
> > > diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> > > index 8f7f86e..607ebfe 100644
> > > --- a/documentation/ref-manual/variables.rst
> > > +++ b/documentation/ref-manual/variables.rst
> > > @@ -2538,6 +2538,14 @@ system and gives an overview of their function and contents.
> > >        For guidance on how to create your own file permissions settings
> > >        table file, examine the existing ``fs-perms.txt``.
> > >
> > > +   :term:`FIT_DESC`
> > > +      Specifies the description string encoded into a fitImage. The default
> > > +      value is set by the :ref:`kernel-fitimage <ref-classes-kernel-fitimage>`
> > > +      class as follows:
> > > +      ::
> >
> > The two lines above have the same outcome as:
> >
> > class as follows::
> >
> > IIRC. I don't remember if a patch was sent by Robert recently nor if it
> > was merged (does not seem so?) but we strive for consistency on this one
> > by having all :\n:: migrated to :: at the end of a paragraph.
> >
> > c.f.: https://lists.yoctoproject.org/g/docs/message/557
>
> We agreed to do it, I haven't seen any updates/response on that
> thread. So as of now, it's not done..
> As such, I don't think it's blocking for new patches.

  apologies ... i've been swamped with my current contract. here's
hoping i get some free time over the holidays.

rday
