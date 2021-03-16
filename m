Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
 by mx.groups.io with SMTP id smtpd.web08.5789.1615885293478595665
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Mar 2021 02:01:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.17, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp3.bon.at (Postfix) with ESMTPSA id 4F06j56qh2z5tlH;
	Tue, 16 Mar 2021 10:01:29 +0100 (CET)
Date: Tue, 16 Mar 2021 10:01:27 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] Description of BBPATH in BB user manual seems ... wrong
Message-ID: <20210316090127.fcbule36mo4f7npd@qschulz>
References: <ff1a51a0-8f8d-13c-5bf3-e833a1b79e5e@crashcourse.ca>
 <20210315131042.lgjgjzdjtp2ofdey@qschulz>
 <cbb6d8df-10c-b845-3ffa-9e294ead99a0@crashcourse.ca>
MIME-Version: 1.0
In-Reply-To: <cbb6d8df-10c-b845-3ffa-9e294ead99a0@crashcourse.ca>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 15, 2021 at 04:19:02PM -0400, Robert P. J. Day wrote:
> On Mon, 15 Mar 2021, Quentin Schulz wrote:
>=20
> > Hi Robert,
> >
> > On Mon, Mar 15, 2021 at 09:05:53AM -0400, Robert P. J. Day wrote:
> > >
> > >   Section 3.4.1 of BB manual:
> > >
> > > https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-u=
ser-manual-metadata.html#locating-include-and-class-files
> > >
> > > "BitBake uses the BBPATH variable to locate needed include and clas=
s
> > > files. Additionally, BitBake searches the current directory for
> > > include and require directives.
> > >
> > > ... snip ..
> > >
> > > "In order for include and class files to be found by BitBake, they
> > > need to be located in a =E2=80=9Cclasses=E2=80=9D subdirectory that=
 can be found in
> > > BBPATH."
> > >
> > >   first, is BBPATH not used for finding conf files as well? and the
> >
> > Yes it is.
> >
> > > wording of that second paragraph suggests that include files need t=
o
> > > be in a classes subdirectory to be found, which i'm pretty sure isn=
't
> > > true.
> > >
> >
> > I think what was meant by "include" files are conf files.... which
> > (probably) technically are include files to Yocto PoV.
> >
> > Not entirely sure but I think Yocto includes all appropriate conf fil=
es
> > to create the "base" "environment" of all recipes.
> >
> > basically, stuff on top of bitbake.conf and what is the environment
> > being reset to between tasks/recipes.
> >
> > Those are guesses though.
>=20
>   well, i think that wording in the BB user manual is at least a
> little misleading, but if others think it's sufficiently clear, i'll
> shut up about it.
>=20

I agree with you. Don't know how to reword though.

Something like what's in YP docs for example:
https://docs.yoctoproject.org/ref-manual/variables.html#term-BBPATH

Where include files are replaced by configuration files. I guess we
could explicit BBPATH represents the parent directory of classes/ and
conf/ directories where bbclasses and configuration files such as
machine, distro, layer configuration files are.

My 2=C2=A2 on this :)

Quentin
