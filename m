Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.328.1616597188586487522
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Mar 2021 07:46:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:58844 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lP4mA-003rn1-Ch; Wed, 24 Mar 2021 10:46:27 -0400
Date: Wed, 24 Mar 2021 10:46:23 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] trying to clarify meaning of ASSUME_PROVIDED
In-Reply-To: <8928ef60d3acc30cf81a11016a697f76dadf0307.camel@linuxfoundation.org>
Message-ID: <e913bba9-608e-21b4-9b8e-f14773f229f5@crashcourse.ca>
References: <23422e6f-1232-0e1-a2aa-5e85af3d493@crashcourse.ca> <8928ef60d3acc30cf81a11016a697f76dadf0307.camel@linuxfoundation.org>
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
Content-Type: multipart/mixed; boundary="8323328-965771011-1616597186=:28056"

--8323328-965771011-1616597186=:28056
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 24 Mar 2021, Richard Purdie wrote:

> On Wed, 2021-03-24 at 09:02 -0400, Robert P. J. Day wrote:
> >   i've asked about this before, but i'd like to really nail this down
> > and perhaps update the documentation.
> >
> >   current definition of ASSUME_PROVIDED in ref manual:
> >
> > "Lists recipe names (PN values) BitBake does not attempt to build.
> > Instead, BitBake assumes these recipes have already been built.
> >
> > "In OpenEmbedded-Core, ASSUME_PROVIDED mostly specifies native tools
> > that should not be built. An example is git-native, which when
> > specified, allows for the Git binary from the host to be used rather
> > than building git-native."
> >
> >   re: that first paragraph, what does it mean to say that BB assumes
> > these recipes have already been built? does that mean that, without
> > building that recipe, the build should expect to find on the host
> > *all* of the executables that should have been produced by the native
> > build of the recipe?
> >
> >   for example, consider recipe "zip," which produces four executables:
> > zip, zipnote, zipcloak and zipsplit. if i add "zip-native" to
> > ASSUME_PROVIDED, am i implicitly stating that the host is expected to
> > provide all four of the executables that would have come from
> > zip-native? and note that, on the host, even if those four executables
> > exist, it's possible they came from a package or packages other than
> > "zip."
>
> The definition is a little fuzzy and you're not going to like it ;-)
>
> ASSUME_PROVIDED = "zip-native" is generally thought to mean "zip" itself
> and not the others. HOSTTOOLS can clarify what might be meant.

  ... snip ...

ah, i was just about to drag HOSTTOOLS into this discussion, so i will
finish reading this, then continue the diatribe, at which point i will
try to tweak the documentation to be at least a little more
comprehensive.

rday

--8323328-965771011-1616597186=:28056--
