Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
 by mx.groups.io with SMTP id smtpd.web10.10492.1619785781618683459
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Apr 2021 05:29:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.16, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 4FWsBV1ncyz5tlD;
	Fri, 30 Apr 2021 14:29:37 +0200 (CEST)
Date: Fri, 30 Apr 2021 14:29:36 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] trying to keep the variable glossary up to date
Message-ID: <20210430122936.sytnerrfegtofdbz@qschulz>
References: <e1a39395-2a7c-895f-a977-d6baf87fba94@crashcourse.ca>
MIME-Version: 1.0
In-Reply-To: <e1a39395-2a7c-895f-a977-d6baf87fba94@crashcourse.ca>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Apr 30, 2021 at 08:11:14AM -0400, Robert P. J. Day wrote:
>=20
>   unsurprisingly, the list of variables in the variable glossary lags
> noticeably behind all of the recent (and even not so recent) variables
> in use. as one example i'm perusing right now, there are a number of
> BUILDHISTORY-related variables that aren't in the glossary, such as:
>=20
>   BUILDHISTORY_RESET
>   BUILDHISTORY_SDK_FILES
>   BUILDHISTORY_DIR_IMAGE
>   BUILDHISTORY_DIR_PACKAGE
>=20
> there's more but that's enough to make the point, which inspires the
> obvious question -- is it even worth trying to keep up?
>=20
>   is there a reasonably methodical way to try to stay on top of this?
> or is that just doomed to failure? certainly, there are variables that
> are totally local to some focused bit of processing and merit no
> explanation, but for any variables that might be of interest to the
> developer, is it the goal for *all* of those variables to be in the
> glossary?
>=20

All variables that are publicly exposed should be documented. IMO,
anything that is expected to be changed (or at least give the user the
ability to change it) in recipes declared in classes or configuration
files are part of this group. Obviously, anything defined in classes and
configuration files can be changed from a recipe but that does not mean
they were intended to be changeable by the original committer.

There's no way we can keep this in sync except by making sure changes in
classes/configuration files mean a patch to the documentation needs to
be sent.

Just my 2=A2,
Cheers,
Quentin
