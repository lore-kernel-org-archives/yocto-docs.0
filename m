Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CAFEC61DD3
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 12:21:04 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6726.1788265258676298959
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Sep 2026 05:20:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=2GLMrRm6;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7312E4E41497
	for <docs@lists.yoctoproject.org>; Tue,  1 Sep 2026 12:20:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 47DAC6053C;
	Tue,  1 Sep 2026 12:20:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E2C5211C7923B;
	Tue,  1 Sep 2026 14:20:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788265251; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=u+n5V3NlF3Sa82zeLBDfZwI9pbO8+Nh4/iydOUNcIA4=;
	b=2GLMrRm6oj2dwGNPXfXollFRVvEKkvrs9zx8LTSVKOR69KQL1jnZxnMqDjloZMw594sMwm
	Lthp/5jit3uH4HXbkqvAx+X/PnR7hEuQz2JoKskm5aj2YnYRUnqCy7CgL0XESYFjjTQ8kl
	Wly8cHTd/vipsSL5jEbyKPTcNJ2U6DIP6pLnKLtkf8p9bDQtHdAKrVG5etlseKJwKERdFg
	ZQNa4WLpxXi68TgCoutDAjN1uZcYAqjI9Rx42GK0DtU8aU3hb4o/RPlas1t+kZnULn3+hF
	N30VqA8pFiAgBH6PNg+9T3OIPUfgZavsy0xXTVP0P/z8eGdTAxIaBx+1ScHIDA==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Subject: Re: [docs] [PATCH] ref-manual/system-requirements.rst: add ccache
 in distros
From: Antonin Godard <antonin.godard@bootlin.com>
To: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Cc: Antonin Godard <antonin.godard@bootlin.com>, 
 docs@lists.yoctoproject.org
In-Reply-To: <CADWMC-bz-ukZqh1ZCj-0xL3Fi7S_ynaRRXiemFZdVZhNur9pkw@mail.gmail.com>
References: <20260831095856.2298-1-jose.quaresma@oss.qualcomm.com>
 <DL322H0N4CF5.IO2KG3IOZPKD@bootlin.com>
 <CADWMC-bO57E5JZPfNXCp0rjOH-hGyWGyF8_bnBrvf8NrHRaDjg@mail.gmail.com>
 <DL34MCC6G8T0.12NMB0V503NE4@bootlin.com>
 <CADWMC-bz-ukZqh1ZCj-0xL3Fi7S_ynaRRXiemFZdVZhNur9pkw@mail.gmail.com>
Date: Tue, 01 Sep 2026 14:20:30 +0200
Message-Id: <178826523033.129557.2771369482806275703.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1473;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=4RbMWKiDwQM5HFvVTB2ywG56UbQJ23M4xtd9Y52CHK8=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqlsMgbDt+IxK0cyzkQvEQ3nzhprwi9t6lgH9cA
 yJE/Yl919aJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCapbDIAAKCRDRgEFAKaOo
 NtpfEACXC3M0nO6sRyCzH6UreUbb3Az+YznQaS4z9QthMY03rMSjTEpWTd5Tddtgaa0vz6FJhLH
 cJMhNhvllWgqgcZXCxqHRPM7APU3dwniV3uI7fbUMgvsZTIVZZa9td6ipuLzY1VuuuTzJzttnA+
 xJZljTm+azZlC0ZtahCfAp5Nx9FweIM6kvEzPR65s6/5Of6VxkA0AriFmjWsuuvph1BR5QYVJOC
 RFRFjTjgYGP8F/kI3izfStCRAYyhPmfzzTqOnjuFvsq/oPrBk0YAVyu3PYsTnzZGTkO+Nw2Kx+8
 uN4eSNjgzrz4NKE8icXekUfLhD7MfoB0l5z7mGPdWY+29sm23zkFH+Eh0svx6EjtXPmaElHvRLc
 x+lUk6CFQ7aZ2t8yrFCh7iEsvxh6sRRs/pK8FcCSuninJ1R/BP7tvtJ4ZGgTfNN++lHxhjvmptt
 QQF+kxoknP6nd/IRFe1OSHho9dAouq2PByWGW6yWlO+yVpwHADkL6Rxrpm17JEaltTinfTNWDQp
 JvvU6t4VDwKPu64OaUcKgAF3ZQqtSiHUetN0RK2zp9VQg86k7D1LAGWte4RkZ3OOPc1VbvL1vO2
 h4wjdu0IUNCv8FUeclsTQA2hHydu1xYpr9otxBh7EY6YzlPb/CUWI8KOqzcrj+T35MDBvnL/eSB
 GD/EXFUvTdJ2IDw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 01 Sep 2026 12:21:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10429

On 2026-08-31 14:06:28+01:00, Jose Quaresma wrote:
> On Mon, Aug 31, 2026 at 1:26=E2=80=AFPM Antonin Godard <antonin.godard@=
bootlin.com>
> wrote:
>=20
> > On Mon Aug 31, 2026 at 12:48 PM CEST, Jose Quaresma wrote:
> > antonin.godard@bootlin.com>
> > do
> > host
> >
> > websockets became a requirement when we made the "poky-with-sstate"
> > bitbake-setup configuration proposed as part of the choices when runn=
ing
> > "bitbake-setup init". It would have made no sense to suggest a
> > configuration
> > with a missing package otherwise.
>=20
> I completely agree with what you say.
>=20
> > in
> >
> > I think this should then be stated in the ccache class documentation,=
 in
> > documentation/ref-manual/classes.rst. The host requirements should be=
 kept
> > minimal, IMO.
>=20
> The documentation [1] already mention the requirements for "-native"
> targets:
>=20
> ASSUME_PROVIDED +=3D "ccache-native"
> HOSTTOOLS +=3D "ccache"
>=20
> [1] https://docs.yoctoproject.org/ref-manual/classes.html#ccache
>=20
> This requirement was added last year
> https://github.com/openembedded/openembedded-core/commit/cc91a0f6500e88=
dd96a56307226fcfd16c60c342

Still, I don't think it really is a requirement, and I think the way forw=
ard is
to actually remove this from ubuntu_essential.sh, fedora_essential.sh,
opensuse_essential_15.6.sh, and opensuse_essential_16.0.sh so that all di=
stros
are aligned.

If you agree, can you send a follow-up patch?

Thanks,
Antonin


