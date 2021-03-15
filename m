Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
 by mx.groups.io with SMTP id smtpd.web12.8261.1615813847324711815
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Mar 2021 06:10:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.14, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 4DzcH8567Kz5tlV;
	Mon, 15 Mar 2021 14:10:43 +0100 (CET)
Date: Mon, 15 Mar 2021 14:10:42 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] Description of BBPATH in BB user manual seems ... wrong
Message-ID: <20210315131042.lgjgjzdjtp2ofdey@qschulz>
References: <ff1a51a0-8f8d-13c-5bf3-e833a1b79e5e@crashcourse.ca>
MIME-Version: 1.0
In-Reply-To: <ff1a51a0-8f8d-13c-5bf3-e833a1b79e5e@crashcourse.ca>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Robert,

On Mon, Mar 15, 2021 at 09:05:53AM -0400, Robert P. J. Day wrote:
>=20
>   Section 3.4.1 of BB manual:
>=20
> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-=
manual-metadata.html#locating-include-and-class-files
>=20
> "BitBake uses the BBPATH variable to locate needed include and class
> files. Additionally, BitBake searches the current directory for
> include and require directives.
>=20
> ... snip ..
>=20
> "In order for include and class files to be found by BitBake, they
> need to be located in a =E2=80=9Cclasses=E2=80=9D subdirectory that can=
 be found in
> BBPATH."
>=20
>   first, is BBPATH not used for finding conf files as well? and the

Yes it is.

> wording of that second paragraph suggests that include files need to
> be in a classes subdirectory to be found, which i'm pretty sure isn't
> true.
>=20

I think what was meant by "include" files are conf files.... which
(probably) technically are include files to Yocto PoV.

Not entirely sure but I think Yocto includes all appropriate conf files
to create the "base" "environment" of all recipes.

basically, stuff on top of bitbake.conf and what is the environment
being reset to between tasks/recipes.

Those are guesses though.

Quentin
