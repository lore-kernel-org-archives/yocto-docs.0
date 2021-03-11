Received: from bsmtp1.bon.at (bsmtp1.bon.at [213.33.87.15])
 by mx.groups.io with SMTP id smtpd.web11.5245.1615465434905387511
 for <docs@lists.yoctoproject.org>;
 Thu, 11 Mar 2021 04:23:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.15, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp1.bon.at (Postfix) with ESMTPSA id 4Dx7Qv2c7dz5tlP;
	Thu, 11 Mar 2021 13:23:50 +0100 (CET)
Date: Thu, 11 Mar 2021 13:23:49 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] why i'm not crazy about "PROVIDES += ..." syntax, then i'll shut up
Message-ID: <20210311122349.4eitqvt5ximeeq6f@qschulz>
References: <eda1c715-ba9d-89dc-d96a-fb5e62d8ee2e@crashcourse.ca>
MIME-Version: 1.0
In-Reply-To: <eda1c715-ba9d-89dc-d96a-fb5e62d8ee2e@crashcourse.ca>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Robert,

On Thu, Mar 11, 2021 at 06:47:25AM -0500, Robert P. J. Day wrote:
>=20
>   yes, i appreciate the recent settling on the preferred syntax of
> "PROVIDES +=3D" rather than "PROVIDES =3D", so i'll whine about why i
> don't like it one more time, then i'll shut up about it (and there's a
> larger point to be made here as well).
>=20
>   we all know that it is necessary to use only "PROVIDES =3D" to *add*
> extra provided entities, but the current bitbake manual makes no
> mention of that explicitly; it simply shows an example of:
>=20
>   PROVIDES +=3D "fullkeyboard"
>=20
> sure, that will work, and it might even make readers feel better, but
> here's the problem.
>=20
>   many readers like me, in order to better understand things they read
> for the first time, will instantly go look in the source code for
> examples as to how those things are used. i used to do that all the
> time, which is why i kept stumbling over things that seemed to
> disagree with what i just read, and i'd ask about it and, in many
> cases, the reaction was, "huh ... you're right, that's kind of
> confusing, we should clean that up."
>=20
>   the same thing is going to happen here, as some readers will read
> that section in the BB manual, run a quick "grep", and run into, for
> example:
>=20
>   systemd/systemd_247.3.bb:PROVIDES =3D "udev"
>   udev/eudev_3.2.10.bb:PROVIDES =3D "udev"
>=20
> and some of them will fer shure get confused about why it's "=3D"
> instead of "+=3D".
>=20
>   IMHO, it's fine to settle on a preferred style, but not if you
> deliberately omit the other possibilities. protecting the reader from
> subtleties or complexities is not helping them if it simply sets them
> up to be confused later. after all, if one regularly advises people to
> both RTFM and RTFS, then those two things should not appear to
> contradict each other.
>=20
>   i will shut up now.
>=20

https://docs.yoctoproject.org/ref-manual/variables.html#term-PROVIDES

```
Note

A recipe=E2=80=99s own recipe name (PN) is always implicitly prepended to=
 PROVIDES, so while using =E2=80=9C+=3D=E2=80=9D in the above example may=
 not be strictly necessary it is recommended to avoid confusion.
```

Seems explicit enough to me. What would you suggest to improve the
explanation of PROVIDES?

Cheers,
Quentin
