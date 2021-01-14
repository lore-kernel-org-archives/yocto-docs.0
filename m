Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
 by mx.groups.io with SMTP id smtpd.web12.33.1610623100828198105
 for <docs@lists.yoctoproject.org>;
 Thu, 14 Jan 2021 03:18:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.14, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 4DGhd52T8jz5tlF;
	Thu, 14 Jan 2021 12:18:17 +0100 (CET)
Date: Thu, 14 Jan 2021 12:18:16 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Yoann Congal <yoann.congal@smile.fr>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
	YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] toaster-manual: Fix a warning related to the code-block directive
Message-ID: <20210114111815.u5r2ltfrnvqweel5@qschulz>
References: <20210113172329.7683-1-yoann.congal@smile.fr>
 <CAP71Wjwi92hxX7U_qC7KwKQpND4mD_F_K8RQ8xBApZUw8o+GFQ@mail.gmail.com>
 <CAMSfU+7kP7kotufDWP=b=SSnK2OXc+w96HfK8doZuNTcDja2Hw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMSfU+7kP7kotufDWP=b=SSnK2OXc+w96HfK8doZuNTcDja2Hw@mail.gmail.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Yoann, Nicolas,

On Thu, Jan 14, 2021 at 12:06:10PM +0100, Yoann Congal wrote:
> Hi !
>=20
> Le mer. 13 janv. 2021 =E0 18:39, Nicolas Dechesne <nicolas.dechesne@lin=
aro.org>
> a =E9crit :
>=20
> > On Wed, Jan 13, 2021 at 6:23 PM Yoann Congal <yoann.congal@smile.fr>
> > wrote:
> >
> >> Fix the following warning by specifying the language (here : shell):
> >> .../yocto/poky/documentation/toaster-manual/reference.rst:572: WARNI=
NG:
> >> Error in "code-block" directive:
> >> 1 argument(s) required, 0 supplied.
> >>
> >
> > Which version of Sphinx are you using? I suspect an old version, in S=
phinx
> > 2+ (I think) it is no longer an error to omit the language. And I don=
't see
> > any warnings in my builds. In fact, we have 0 warning in the whole do=
c, and
> > we will try to avoid adding new ones!
> >
>=20
> Well you were right! I was running sphinx 1.8. I got no more warnings a=
fter
> upgrading to sphinx 3.4.3.
>=20
> Sorry about the noise !
>=20

And now I just discovered we don't have a requirements.txt or something
alike where we could ask for a min version of sphinx.

@Nicolas, any idea why we're not using requirements.txt so that one
could do pip install -r requirements.txt (and we could also enforce a
min version of Sphinx, the theme or pyyaml)? Or whatever mechanisms the
cool kids doing Python use nowadays?

Quentin
