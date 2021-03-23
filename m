Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
 by mx.groups.io with SMTP id smtpd.web11.478.1616521377329161263
 for <docs@lists.yoctoproject.org>;
 Tue, 23 Mar 2021 10:42:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.17, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp3.bon.at (Postfix) with ESMTPSA id 4F4dxV3s1Qz5tlB;
	Tue, 23 Mar 2021 18:42:54 +0100 (CET)
Date: Tue, 23 Mar 2021 18:42:53 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
	YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] Spellcheck and capitalization fixes
Message-ID: <20210323174253.snpxrugj2f2hxyue@qschulz>
References: <20210323170624.112564-1-michael.opdenacker@bootlin.com>
 <23e95d84-fec2-70b9-65d7-baeaee6df836@linaro.org>
 <24ff30ac-a70e-a366-aab7-d0abf337df6f@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <24ff30ac-a70e-a366-aab7-d0abf337df6f@bootlin.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2021 at 06:38:03PM +0100, Michael Opdenacker wrote:
> Hi Nico,
>=20
> Thanks for your review!
>=20
> On 3/23/21 6:31 PM, Nicolas Dechesne wrote:
> > On 3/23/21 6:06 PM, Michael Opdenacker wrote:
> >> - Spelling fixes found using Emacs' spelling checker
> >> =A0=A0 configured for US English
> >> - Fixes for some capitalization issues, especially some
> >> =A0=A0 project names (QEMU, openSUSE, BusyBox), that were not
> >> =A0=A0 consistently used with the same capitalization anyway.
> >> - A few whitespace fixes too
> >>
> >> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> >
> > Looks good to me. Thanks!
>=20
>=20
> I was really impressed by the scarcity of typos and style issues found
> so far. Congrats to the authors, contributors and reviewers, who seem t=
o
> have done a great job!
>=20

You'll have a LOT more "fun" if you start working on the Bitbake
documentation. I don't think it's been properly reviewed since the
migration to Sphinx and the Yocto Project docs were full of style
issues. Nicolas, other contributors and myself can attest how painful
that was. Your contributions are very welcome, thank you for the ones
already sent!

Quentin
