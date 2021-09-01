Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.5015.1630483954530989009
 for <docs@lists.yoctoproject.org>;
 Wed, 01 Sep 2021 01:12:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:47332 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mLLME-0001jE-DQ; Wed, 01 Sep 2021 04:12:32 -0400
Date: Wed, 1 Sep 2021 04:12:25 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
    YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] virtual providers don't apply to runtime dependencies?
In-Reply-To: <d39a9c39-f618-a02d-f188-87172318f3bc@bootlin.com>
Message-ID: <b759d81-504e-3ca9-e07c-55d0d826ffae@crashcourse.ca>
References: <09ae7be-46c4-ab72-542-a450f6132b5b@crashcourse.ca> <0af509d5adc926ade1439a011d03e26687773e74.camel@linuxfoundation.org> <d39a9c39-f618-a02d-f188-87172318f3bc@bootlin.com>
MIME-Version: 1.0
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

On Tue, 31 Aug 2021, Michael Opdenacker wrote:

> Hi,
>
> On 8/30/21 2:20 PM, Richard Purdie wrote:
> > On Mon, 2021-08-30 at 04:44 -0400, Robert P. J. Day wrote:
> >>   in this section:
> >>
> >> https://docs.yoctoproject.org/dev-manual/common-tasks.html#using-virtual-providers
> >>
> >> one reads the note:
> >>
> >> "Virtual providers only apply to build time dependencies specified
> >> with PROVIDES and DEPENDS. They do not apply to runtime dependencies
> >> specified with RPROVIDES and RDEPENDS."
> >>
> >>   except in current oe-core, there seem to be a couple examples of
> >> that:
> >>
> >> meta/recipes-core/systemd/systemd-bootconf_1.00.bb:RPROVIDES:${PN} +=
> >> "virtual/systemd-bootconf"
> >>
> >> meta/recipes-bsp/grub/grub-bootconf_1.00.bb:RPROVIDES:${PN} +=
> >> "virtual/grub-bootconf"
> >>
> >>   am i misreadimg something?
> > No, the above lines are incorrect and should be fixed. A bug or something to
> > track that would be good.
>
>
> Oops, I now understand that I misunderstood Richard's point. The lines
> in the recipes are wrong, not the documentation text.
>
> So bug https://bugzilla.yoctoproject.org/show_bug.cgi?id=14530 is not a
> documentation bug, but an OE core one. I'll fix this.
>
> Thanks for your patience with us mere mortals, Richard ;-)

  *sigh* ... i feel responsible for opening yet another can of worms.

rday
