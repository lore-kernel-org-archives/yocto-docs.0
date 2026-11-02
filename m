Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14800.1793631749909872880
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Nov 2026 07:02:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pengutronix.de header.s=20260414 header.b=Jok6QQGh;
 spf=pass (domain: pengutronix.de, ip: 185.203.200.13, mailfrom: u.oelmann@pengutronix.de)
Received: from ptx.office.stw.pengutronix.de (ptx.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::109])
	(Authenticated sender: relay-from-ptx.office.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id F1DED201DFC;
	Mon, 02 Nov 2026 16:02:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793631742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G/PAYO/9f20ro/LP44jfNr/5Wjn5c/yLpLQHyZ+rvIU=;
	b=Jok6QQGhYGX1zHou/FJAeG0WJSCRX/d9HauXnpUriLVBAlydVs9hGPXotavZqg0B+BoNN2
	doHMJipKOnm1sm0TZdtgY74myaytyA9NrBGIDC+lEWJDvqn8WhUglVSTIMR2uHbeJcxJVw
	cS3/jxeNp7HRXmUSEkqgxXcewkddzmBd49VBiw9aOF7ke1DxynyxE6ZQXbfYTtvqt+6Ba2
	ZWKQcIVrE64dxeBiFU/ILJZllVi/iuXrIP844dGCV9UVXSfFQtPYkehVF0VWCZug3Tpc01
	HAzviQ2libv6Ka1t+1yCe6RcPXuSqtSxLd6jx0hAJhMpR+D82Qr0gekdkEtOVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793631742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G/PAYO/9f20ro/LP44jfNr/5Wjn5c/yLpLQHyZ+rvIU=;
	b=VjxL7CBSX4kvmQFzXAnrw86UR6znr505GXbGyqrk0qUtXqdOSS702Es7+xCui3wejjqbUC
	K3zPrU7G2hZzvbRm2cCkHLvL6bLxuvhTqMQ7dQ69TBrMqqsdtbjFi+cp7exln6z1vi1X8V
	AzLx/YoC+QOBoR9pbJo9ylgbzYn+6TcF2qpThAv+bvU+jv/qSQYME1obDf1H1gx3yfA1Em
	MxR74Cn4b2rOPBGToahButjj3PUlps0yLnyCxOhrFrucTBezYpeajn7NpewPY4oPscuumx
	q/wef1D+D0P6W95Bd7lE99lNwOWlDGzPr34sVsBrodNuuxw3B7FnWarQCXnHiQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-ptx.office.stw.pengutronix.de smtp.mailfrom=u.oelmann@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793631742; a=rsa-sha256;
	cv=none;
	b=O1kEjsxp6yIx4DsPeOIRibZDKuva6Rb2oD4qPfZuDmMZ1LRe+2Yal6qVgHsnTM+xJbNhD7
	JBP0rlIq2ycqDRlkPeW/kIj10C8SWoQ0a4Da2PTzXZwWzkSPQdOrEmo3izRy9w4nAPhyJq
	E5zt80LsEHdZH5oKHBhl+C7cR3Q8rOjMU0BL7zhvXdEIta2ByckhF+gyrM3XPdCHbLWeDn
	Sabz6V8gfWCFNOLxAY4WLtUBOKCiR3D0qQVN+3Fl1gsPyuqKGh5QOyBfz7o5jmnT7kYhLE
	WsGFGeNcPbv+w8PEGwf8I1GcQb9EH/ZnAOoXdOgtvT2w5nTDvNMB0bPUTUwIzQ==
Received: by ptx.office.stw.pengutronix.de (Postfix, from userid 1052)
	id D741E1BFA72; Mon, 02 Nov 2026 16:02:22 +0100 (CET)
From: =?utf-8?Q?Ulrich_=C3=96lmann?= <u.oelmann@pengutronix.de>
To: richard.purdie@linuxfoundation.org
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual/faq: Add entry about github pull
 requests
In-Reply-To: <20261102110847.15588-1-richard.purdie@linuxfoundation.org>
References: <20261102110847.15588-1-richard.purdie@linuxfoundation.org>
User-Agent: mu4e 1.14.4-pre6; emacs 31.1
Date: Mon, 02 Nov 2026 16:02:22 +0100
Message-ID: <6rse1jwa2p.fsf@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Mon, 02 Nov 2026 15:02:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10763

Hi Richard,

I don=E2=80=99t have any content-related feedback and only noticed a few ty=
pos.

On Mon, Nov 02 2026 at 11:08 +0000, "Richard Purdie via docs" <richard.purd=
ie=3Dlinuxfoundation.org@lists.yoctoproject.org> wrote:
> This is an emotive topic but try and fairly document some of the pros and=
 cons
> of such a model and where they make sense along with why the project has =
made
> the decisions it currently has.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  documentation/ref-manual/faq.rst | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/=
faq.rst
> index c1657d677..60e89d834 100644
> --- a/documentation/ref-manual/faq.rst
> +++ b/documentation/ref-manual/faq.rst
> @@ -108,6 +108,34 @@ It is very easy to check whether a patch has merged =
by looking at the repository
>  pulling and rebasing.
>=20=20
>=20=20
> +Why doesn't the project use github?
> +-----------------------------------
> +
> +This is not a simple question and there is no right answer to it but the=
re is some
> +background worth appreciating.
> +
> +Some components within the project do accept pull requests from github, =
others don't.
> +The README in the component in question should make the process clear fo=
r that
> +component. Github itself is a commercial operation and there are concern=
s about what
> +happens if they change direction or decide to to discontinue it as there=
 is precedent in

s/to to/to/

> +the past for that kind of thing happening. Equally, there are open alter=
natives to it.
> +
> +The bigger issue is the model. Mailing lists allow for wide peer review.=
 The people
> +performing that review are extremely valuable with experience built up o=
ver decades.
> +The github model doesn't really lend itself to them being able to easily=
 see or be
> +aware of changes beyond the maintainer accepting the pull request. That =
model also
> +tends to focus on the single maintainer with total authority, which for =
components
> +like OE-Core, simply isn't how things operate for us. Moving to much a m=
odel would

s/Moving to much a model/Moving to such a model/

Best regards,
Ulrich


> +alienate our existing reviewers and our community consensus approach to =
changes.
> +
> +So yes, for a contributor wanting to make a quick submission, github and=
 similar models
> +are attractive, but they would likely come at a cost to the project's lo=
ng term health.
> +They can work well for the single or limited number of maintainer model,=
 and for components
> +with the setup, but not for other areas which benefit from wide peer rev=
iew. We live
> +in hope that tools can catch up with that, we'd even love to develop the=
m ourselves if
> +we had time but sadly, we don't at this point.
> +
> +
>  Building environment
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20=20
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#10758): https://lists.yoctoproject.org/g/docs/message=
/10758
> Mute This Topic: https://lists.yoctoproject.org/mt/122055611/3618626
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [u.oelmann@pengu=
tronix.de]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
--=20
Pengutronix e.K.                           | Ulrich =C3=96lmann            =
   |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
