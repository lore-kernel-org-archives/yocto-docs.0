Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
 by mx.groups.io with SMTP id smtpd.web08.299.1610624810875256015
 for <docs@lists.yoctoproject.org>;
 Thu, 14 Jan 2021 03:46:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.17, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp3.bon.at (Postfix) with ESMTPSA id 4DGjFz36Y8z5tlD;
	Thu, 14 Jan 2021 12:46:47 +0100 (CET)
Date: Thu, 14 Jan 2021 12:46:46 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Yoann Congal <yoann.congal@smile.fr>,
	YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] toaster-manual: Fix a warning related to the code-block directive
Message-ID: <20210114114646.2opuupittdc6kz5a@qschulz>
References: <20210113172329.7683-1-yoann.congal@smile.fr>
 <CAP71Wjwi92hxX7U_qC7KwKQpND4mD_F_K8RQ8xBApZUw8o+GFQ@mail.gmail.com>
 <CAMSfU+7kP7kotufDWP=b=SSnK2OXc+w96HfK8doZuNTcDja2Hw@mail.gmail.com>
 <20210114111815.u5r2ltfrnvqweel5@qschulz>
 <CAP71WjxCRKmy2vJzykLiD77_PNHWSexL1vm+ax8Ek8RMo0hgWw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP71WjxCRKmy2vJzykLiD77_PNHWSexL1vm+ax8Ek8RMo0hgWw@mail.gmail.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2021 at 12:22:58PM +0100, Nicolas Dechesne wrote:
> On Thu, Jan 14, 2021 at 12:18 PM Quentin Schulz <
> quentin.schulz@streamunlimited.com> wrote:
>=20
> > Hi Yoann, Nicolas,
> >
> > On Thu, Jan 14, 2021 at 12:06:10PM +0100, Yoann Congal wrote:
> > > Hi !
> > >
> > > Le mer. 13 janv. 2021 =E0 18:39, Nicolas Dechesne <
> > nicolas.dechesne@linaro.org>
> > > a =E9crit :
> > >
> > > > On Wed, Jan 13, 2021 at 6:23 PM Yoann Congal <yoann.congal@smile.=
fr>
> > > > wrote:
> > > >
> > > >> Fix the following warning by specifying the language (here : she=
ll):
> > > >> .../yocto/poky/documentation/toaster-manual/reference.rst:572:
> > WARNING:
> > > >> Error in "code-block" directive:
> > > >> 1 argument(s) required, 0 supplied.
> > > >>
> > > >
> > > > Which version of Sphinx are you using? I suspect an old version, =
in
> > Sphinx
> > > > 2+ (I think) it is no longer an error to omit the language. And I
> > don't see
> > > > any warnings in my builds. In fact, we have 0 warning in the whol=
e
> > doc, and
> > > > we will try to avoid adding new ones!
> > > >
> > >
> > > Well you were right! I was running sphinx 1.8. I got no more warnin=
gs
> > after
> > > upgrading to sphinx 3.4.3.
> > >
> > > Sorry about the noise !
> > >
> >
> > And now I just discovered we don't have a requirements.txt or somethi=
ng
> > alike where we could ask for a min version of sphinx.
> >
> > @Nicolas, any idea why we're not using requirements.txt so that one
> > could do pip install -r requirements.txt (and we could also enforce a
> > min version of Sphinx, the theme or pyyaml)? Or whatever mechanisms t=
he
> > cool kids doing Python use nowadays?
> >
>=20
> We have a Pipfile, which is even cooler, no? but we don't specify any
> version yet!
>=20

Didn't even know!

Kind of wary of this project though because of that part of their README:
" WARNING: This project is under active design and development. Nothing
is set in stone at this point in time."

But maybe something we could add to the docs
(https://docs.yoctoproject.org/ref-manual/system-requirements.html) as an
alternative installaion method?

Aaaaaand I should have read the README in yocto-docs more seriously :)

Thanks for the info,
Quentin
